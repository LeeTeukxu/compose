package com.zhide.assist.controllers.systems;

import com.alibaba.fastjson.JSON;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.zhide.assist.common.MD5Util;
import com.zhide.assist.common.RedisUtils;
import com.zhide.assist.common.successResult;
import com.zhide.assist.controllers.LoginController;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbLoginUser;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbLoginUserRepository;
import com.zhide.assist.services.LoginUserErrorCounter;
import com.zhide.assist.services.define.IAllUserListService;
import com.zhide.assist.services.define.IRegisteredService;
import com.zhide.assist.services.define.IphoneBindService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.rmi.runtime.Log;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import java.util.Map;

import static com.zhide.assist.common.SMSUtil.sendSms;

@Controller
@RequestMapping("/systems/Bind")
public class phoneBindController {
    @Autowired
    IphoneBindService iphoneBindService;
    @Autowired
    LoginUserErrorCounter errorCounter;
    @Resource
    RedisTemplate<String,Object> redisTemplate;
    @Autowired
    IAllUserListService allMapper;
    @Autowired
    tbLoginUserRepository loginUserRepository;

    Logger logger = LoggerFactory.getLogger(LoginController.class);
    @RequestMapping(value = "/phonebind")
    public String Phonebind(Map<String,Object> model,String OpenID, String Type){
        model.put("OpenID",OpenID);
        model.put("Type",Type);
        return "phonebinding";
    }
    @RequestMapping(value = "/bindphone")
    public String BindPhone(Map<String,Object> model,String Type){
        model.put("OpenID","");
        model.put("Type",Type);
        return "phonebinding";
    }

    @RequestMapping("/bindLogin")
    @ResponseBody
    public successResult BindLogin(HttpServletRequest request, HttpServletResponse response){
        successResult result = new successResult();
        try {
            String Data = request.getParameter("Data");
            String OpenID = request.getParameter("OpenID");
            String Type = request.getParameter("Type");
            tbLoginUser loginUser = JSON.parseObject(Data,tbLoginUser.class);
            String username = loginUser.getLoginCode();
            String password = "BindLoginPwd";
            errorCounter.setAccount(loginUser.getLoginCode());
            if (errorCounter.isOver()){
                errorCounter.lockUser();
            }
            tbLoginUser login = iphoneBindService.BindLogin(loginUser, OpenID, Type);
            if (login != null) {
                RedisUtils.saveToRedis("LoginType","PhoneLogin",redisTemplate);
                LoginUserInfo loginUserInfo = allMapper.findUserInfoByAccount(login.getLoginCode());
                UsernamePasswordToken token = new UsernamePasswordToken(username, password);
                Subject user = SecurityUtils.getSubject();
                user.login(token);
                if (user.isAuthenticated()) {
                    user.getSession().setAttribute("loginUser", loginUserInfo);
                    request.getSession().setAttribute("loginUser", loginUserInfo);
                    logger.info(loginUser.getLoginCode() + "登录成功");
                    errorCounter.clear();
                }else response.sendRedirect("/login");
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

    @RequestMapping("/updatepasswordyz")
    @ResponseBody
    public successResult UpdatePasswordYZ(HttpServletRequest request, HttpServletResponse response){
        successResult result = new successResult();
        try {
            String Data = request.getParameter("Data");
            tbLoginUser loginUser = JSON.parseObject(Data,tbLoginUser.class);
            iphoneBindService.UpdatePasswordYZ(loginUser);
        }catch (Exception ax){
            result.setSuccess(false);
            result.setMessage(ax.getMessage());
        }
        return result;
    }

    @RequestMapping("/updatepassword")
    @ResponseBody
    public successResult UpdatePassword(HttpServletRequest request, HttpServletResponse response){
        successResult result = new successResult();
        try {
            String Data = request.getParameter("Data");
            tbLoginUser loginUser = JSON.parseObject(Data,tbLoginUser.class);
            iphoneBindService.UpdatePassword(loginUser);
        }catch (Exception ax){
            result.setSuccess(false);
            result.setMessage(ax.getMessage());
        }
        return result;
    }

    @RequestMapping("/forgetpassword")
    @ResponseBody
    public successResult ForGetPassWord(HttpServletRequest request, HttpServletResponse response){
        successResult result = new successResult();
        try {
            String LoginCode = request.getParameter("LoginCode");
            String Password = request.getParameter("Password");
            iphoneBindService.UpdatePasswordByLoginCode(Password, LoginCode);
        }catch (Exception ax){
            result.setSuccess(false);
            result.setMessage(ax.getMessage());
        }
        return result;
    }

    @RequestMapping("/bindphonetosql")
    @ResponseBody
    public successResult BindPhoneToSql(HttpServletRequest request, HttpServletResponse response){
        successResult result = new successResult();
        LoginUserInfo Info = CompanyContext.get();
        try {
            String Data = request.getParameter("Data");
            tbLoginUser user = JSON.parseObject(Data,tbLoginUser.class);
            tbLoginUser loginUser = loginUserRepository.findAllByLoginCode(user.getLoginCode());
            if (loginUser == null) {
                result.setSuccess(true);
                loginUserRepository.UpdateLoginCodeByUserID(user.getLoginCode(), Info.getUserIdValue());
            }else {
                result.setSuccess(false);
                result.setMessage("该手机已经绑定,请勿重复绑定!");
            }
        }catch (Exception ax){
            result.setSuccess(false);
            result.setMessage(ax.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/getBindSMS")
    @ResponseBody
    public successResult GetBindSMS(HttpServletRequest request,String Phone){
        successResult result = new successResult();
        try {
            setNewcode();
            String code = Integer.toString(getNewcode());
            String RedisKey = Phone +"::Bind::Code";
            SendSmsResponse sendSms = sendSms(Phone, code, RedisKey, redisTemplate);//填写你需要测试的手机号码
            result.setMessage(sendSms.getCode());
            result.setData(code);
        }catch (Exception e){
            result.setSuccess(false);
            result.setMessage("获取验证码失败,请稍后重试!");
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/save")
    public successResult Save(HttpServletRequest request){
        successResult result = new successResult();
        try {
            String LoginCode = request.getParameter("LoginCode");
            String VerifyCode = request.getParameter("VerifyCode");
            String PhoneCode = request.getParameter("PhoneCode");
            String Type = request.getParameter("Type");
            tbLoginUser user = new tbLoginUser();
            user.setLoginCode(LoginCode);
            user.setVerifyCode(VerifyCode);
            user.setPhoneCode(PhoneCode);
            result.setData(iphoneBindService.Save(user, Type, request));
        }catch (Exception ax){
            result.raiseException(ax);
            result.setMessage(ax.getMessage());
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
}
