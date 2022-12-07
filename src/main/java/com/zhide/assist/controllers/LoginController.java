package com.zhide.assist.controllers;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.zhide.assist.common.*;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbLoginUser;
import com.zhide.assist.models.tbMenuList;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbLoginUserRepository;
import com.zhide.assist.services.LoginUserErrorCounter;
import com.zhide.assist.services.define.IAllUserListService;
import org.apache.logging.log4j.util.Strings;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import static com.zhide.assist.common.SMSUtil.sendSms;
import static com.zhide.assist.common.WxUtil.qrCode;


@Controller
public class LoginController {
    @Autowired
    IAllUserListService allMapper;
    @Autowired
    LoginUserErrorCounter errorCounter;
    @Resource
    RedisTemplate<String,Object> redisTemplate;
    @Autowired
    tbLoginUserRepository repository;

    private static String ScanningTypes = "";
    Logger logger = LoggerFactory.getLogger(LoginController.class);
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public String login() throws Exception{
        return "newlogin";
    }
    @RequestMapping(value = "/nl",method = RequestMethod.GET)
    public String NL(Map<String,Object> model,HttpServletResponse response) throws Exception{
        return "newlogin";
    }
    @RequestMapping(value = "/website",method = RequestMethod.GET)
    public String WebSite(Map<String,Object> model,HttpServletResponse response) throws Exception{
        return "WebSite";
    }
    @RequestMapping(value = "/registered",method = RequestMethod.GET)
    public String Registered(Map<String,Object> model){
        return "registered";
    }

    @RequestMapping(value = "/phonelogin",method = RequestMethod.GET)
    public String PhoneLogin(Map<String,Object> model, String Type, HttpServletRequest request){
        model.put("Type",Type);
        return "phonelogin";
    }

    @RequestMapping(value = "/getQRCode",method = RequestMethod.GET)
    public String GetQRCode(String ScanningType) throws UnsupportedEncodingException {
        ScanningTypes = ScanningType;
        return qrCode();
    }

    @RequestMapping(value = "/doLogin",method = RequestMethod.POST)
    @ResponseBody
    public successResult DoLogin(HttpServletRequest request, String username,String password,String piccode,Map<String,Object> model){
         successResult result = new successResult();
        try {
            errorCounter.setAccount(username);
            if (errorCounter.isOver()){
                errorCounter.lockUser();
            }
//            if (errorCounter.isLock()){
//                throw new Exception(username+"登录失败超过三次，已被锁定30分钟。");
//            }
            LoginUserInfo loginUserInfo = allMapper.findUserInfoByAccount(username);
            if (Strings.isEmpty(loginUserInfo.getUserId()) == true){
                errorCounter.addOne();
                throw new RuntimeException(username+"在系统中不存在");
            }

//            String PicCodeKey = "VerifyCode";
//            String PicCodeValue = RedisUtils.getFromRedis(PicCodeKey, redisTemplate);
//            if (PicCodeValue.equals("") || !piccode.toLowerCase().equals(PicCodeValue.toLowerCase())){
//                errorCounter.addOne();
//                throw new RuntimeException("图形验证码输入错误!");
//            }

            RedisUtils.saveToRedis("LoginType","DoLogin",redisTemplate);
            UsernamePasswordToken token = new UsernamePasswordToken(username,password);
            Subject user = SecurityUtils.getSubject();
            user.login(token);
            if(user.isAuthenticated()){
                user.getSession().setAttribute("loginUser",loginUserInfo);
                request.getSession().setAttribute("loginUser",loginUserInfo);
                logger.info(username + "登录成功！");
                errorCounter.clear();
            }
        }catch (IncorrectCredentialsException ax){
            errorCounter.addOne();
            logger.info("登录错误:" + ax.getMessage());
            result.setSuccess(false);
            result.setMessage("用户名或密码错误!");
        }catch (Exception ax){
            errorCounter.addOne();
            logger.info("登录失败:"+ax.getMessage());
            result.setSuccess(false);
            result.setMessage("登录失败:"+ax.getMessage());
        }
        return result;
    }

    @RequestMapping("/loginOut")
    @ResponseBody
    public successResult LoginOut() {
        successResult result = new successResult();
        try {
            Subject user = SecurityUtils.getSubject();
            if (user != null) {
                errorCounter.clear();
                user.logout();
            }
        } catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }

    @GetMapping("/callback")
    public void callback(String code, HttpServletRequest req, HttpServletResponse response) throws IOException{
        JSONObject object = WxUtil.GetWxLoginInfo(code);
        String strOPENID = object.get("openid").toString();
        String strNickName = object.get("nickname").toString();
        RedisUtils.saveToRedis("NickName",strNickName,redisTemplate);
        LoginUserInfo info = null;
        if (ScanningTypes.equals("Login")) {
            if (!code.equals("")) {
                String username = "";
                String password = "";
                List<tbLoginUser> listUser = repository.findAllByWxOpenId(strOPENID);
                if (listUser.size() > 0) {
                    RedisUtils.saveLoginInfoToRedis("LoginType", "WXLogin", redisTemplate);
                    RedisUtils.saveLoginInfoToRedis("LoginName",strNickName, redisTemplate);
                    for (tbLoginUser u : listUser) {
                        info = allMapper.findUserInfoByWxOpenID(u.getWxOpenId());
                        info.setLoginName(strNickName);
                        username = u.getWxOpenId();
                        password = "BindLoginPwd";
                    }
                    if (info != null) {
                        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
                        Subject user = SecurityUtils.getSubject();
                        user.login(token);
                        if (user.isAuthenticated()) {
                            user.getSession().setAttribute("loginUser", info);
                            req.getSession().setAttribute("loginUser", info);
                            response.sendRedirect("/categorySelection");
                        }
                    }
                } else {
                    response.sendRedirect("/systems/Bind/phonebind?OpenID=" + strOPENID + "&Type=WX");
                }
            }
        }else {
            LoginUserInfo Info = CompanyContext.get();
            if (ScanningTypes.equals("BindWx")) {
                String AlertInfo = "";
                List<tbLoginUser> list = repository.findAllByWxOpenId(strOPENID);
                if (list.size() > 0){
                    AlertInfo = "true";
                }else repository.UpdateWxOpenIDByUserID(strOPENID,strNickName,Info.getUserIdValue());
                response.sendRedirect("/categorySelection?JumpPage=accountsettings&AlertInfo="+AlertInfo);
            }
        }
    }

    @RequestMapping("/cancelBindWx")
    @ResponseBody
    public successResult CancelBindWx(){
        successResult result = new successResult();
        LoginUserInfo Info = CompanyContext.get();
        try {
            repository.CancelBindWx(Info.getUserIdValue());
        }catch (Exception ax){
            result.setSuccess(false);
            result.raiseException(ax);
        }
        return result;
    }

    private static int newcode;
    public static int getNewcode() {
        return newcode;
    }
    public static void setNewcode(){
        newcode = (int)(Math.random()*9999)+100;  //每次调用生成一次四位数的随机数
    }

    @RequestMapping(value = "/doGetVerifyCode")
    public void doGetVerifyCode(HttpServletRequest request, HttpServletResponse response, String RANDOMCODEKEY) throws Exception {
        try {
            response.setContentType("image/jpeg");//设置相应类型,告诉浏览器输出的内容为图片
            response.setHeader("Pragma", "No-cache");//设置响应头信息，告诉浏览器不要缓存此内容
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expire", 0);
            VerifyUtil randomValidateCode = new VerifyUtil();
            randomValidateCode.getRandcode(request, response,RANDOMCODEKEY,redisTemplate);//输出验证码图片
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    @RequestMapping("/getSMS")
    @ResponseBody
    public successResult GetSMS(HttpServletRequest request,String Phone){
        successResult result = new successResult();
        try {
            setNewcode();
            String code = Integer.toString(getNewcode());
            String RedisKey = Phone +"::Reg::Code";
            SendSmsResponse sendSms = sendSms(Phone, code, RedisKey, redisTemplate);//填写你需要测试的手机号码
            result.setMessage(sendSms.getCode());
            result.setData(code);
        }catch (Exception e){
            result.setSuccess(false);
            result.setMessage("注册失败,请稍后重试!");
        }
        return result;
    }
}
