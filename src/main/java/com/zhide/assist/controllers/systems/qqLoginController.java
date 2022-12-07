package com.zhide.assist.controllers.systems;

import com.alibaba.fastjson.JSONObject;
import com.zhide.assist.common.*;
import com.zhide.assist.mapper.AllUserListMapper;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbLoginUser;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbLoginUserRepository;
import com.zhide.assist.services.LoginUserErrorCounter;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/systems/qqLogin")
public class qqLoginController {

    @Autowired
    RestTemplate restTemplate;

    @Autowired
    tbLoginUserRepository repository;

    @Autowired
    AllUserListMapper allMapper;

    @Autowired
    LoginUserErrorCounter errorCounter;

    @Resource
    RedisTemplate<String,Object> redisTemplate;

    @RequestMapping(value = "/loginQQPage",method = RequestMethod.GET)
    public String Login(Map<String,Object> model, HttpServletResponse response) throws Exception{
        return "qqlogin";
    }

    @RequestMapping("/loginByQQ")
    public String LoginByQQ(String ScanningType,HttpServletRequest request, HttpServletResponse response) throws IOException{
        String redirect_uri = "";
        String response_type = "code";
        String client_id = LoginQQConstant.APP_ID;
        if (ScanningType == null) {
            redirect_uri = URLEncoder.encode(LoginQQConstant.CALLBACK_URL, "UTF-8");
        }else redirect_uri = URLEncoder.encode(LoginQQConstant.CALLBACK_BINDURL,"UTF-8");
        String state = new Date().toString();
        request.getSession().setAttribute("state", state);
        String url = LoginQQConstant.GET_AUTHORIZATION_CODE + "?response_type=" + response_type + "&client_id=" + client_id + "&redirect_uri=" + redirect_uri + "&state=" +state;
        System.out.println(url);
        return "redirect:" + url;
    }

    @RequestMapping("/callback")
    @ResponseBody
    public void CallBack(HttpServletRequest request, HttpServletResponse response){
        try {
            String[] result= GetQQLoginInfo(request).split(";");
            String openid = result[0];
            String access_token = result[1];
            JSONObject jsonObject = QQUtils.getUserInfo(access_token,openid,restTemplate);
            String nickName = jsonObject.get("nickname").toString();
            RedisUtils.saveToRedis("NickName",nickName,redisTemplate);
            // 5.根据openid获取用户信息
            if (openid == null || openid.trim().isEmpty()) {
                throw new RuntimeException("未获取到openId");
            } else {
                String username = "";
                String password = "";
                List<tbLoginUser> list = repository.findAllByQqOpenId(openid);
                if (list.size() > 0) {
                    RedisUtils.saveLoginInfoToRedis("LoginType", "QQLogin", redisTemplate);
                    LoginUserInfo info = null;
                    for (tbLoginUser u : list) {
                        info = allMapper.findUserInfoByQQOpenID(u.getQqOpenId());
                        info.setLoginName(nickName);
                        username = u.getQqOpenId();
                        password = "BindLoginPwd";
                    }
                    if (info != null) {
                        UsernamePasswordToken token = new UsernamePasswordToken(username, password);
                        Subject user = SecurityUtils.getSubject();
                        user.login(token);
                        if (user.isAuthenticated()) {
                            user.getSession().setAttribute("loginUser", info);
                            request.getSession().setAttribute("loginUser", info);
                            response.sendRedirect("/categorySelection");
                        }
                    }
                } else {
                    response.sendRedirect("/systems/Bind/phonebind?OpenID=" + openid + "&Type=QQ");
                }
            }
        }catch (Exception ax){
            ax.printStackTrace();
        }
    }

    @RequestMapping("/bcb")
    @ResponseBody
    public void BCB(HttpServletRequest request, HttpServletResponse response){
        try {
            LoginUserInfo Info = CompanyContext.get();
            String AlertInfo = "";
            String[] openids = GetQQLoginInfo(request).split(";");
            String openid = openids[0];
            String access_token = openids[1];
            JSONObject jsonObject = QQUtils.getUserInfo(access_token,openid,restTemplate);
            String NickName = jsonObject.get("nickname").toString();
            List<tbLoginUser> list = repository.findAllByQqOpenId(openid);
            if (list.size() > 0){
                AlertInfo = "true";
            }else {
                repository.UpdateQQOpenIDByUserID(openid, NickName, Info.getUserIdValue());
            }
            response.sendRedirect("/categorySelection?Modal=close&JumpPage=accountsettings&AlertInfo="+AlertInfo);
        }catch (Exception ax){
            ax.printStackTrace();
        }
    }

    private String GetQQLoginInfo(HttpServletRequest request) throws Exception{
        // 1.获取回调的authorization
        String authorization_code = request.getParameter("code");
        if (authorization_code == null || authorization_code.trim().isEmpty()) {
            throw new RuntimeException("未获取到AuthorizationCode");
        }
        // 2.client端的状态值。用于第三方应用防止CSRF攻击。
        String state = request.getParameter("state");
        if (!state.equals(request.getParameter("state"))) {
            throw new RuntimeException("client端的状态值不匹配！");
        }
        // 3.获取accessToken
        String urlForAccessToken = QQUtils.getUrlForAccessToken(authorization_code);
        String access_token = QQUtils.getAccessToken(urlForAccessToken, restTemplate);
        // 4.根据accessToken获取openId
        if (access_token == null || access_token.trim().isEmpty()) {
            throw new RuntimeException("未获取到accessToken");
        }
        String openid = QQUtils.getOpenId(access_token, restTemplate);
        return openid + ";" +access_token;
    }

    @RequestMapping("/cancelBindQQ")
    @ResponseBody
    public successResult CancelBindQQ(){
        successResult result = new successResult();
        LoginUserInfo Info = CompanyContext.get();
        try {
            repository.CancelBindQQ(Info.getUserIdValue());
        }catch (Exception ax){
            result.setSuccess(false);
            result.raiseException(ax);
        }
        return result;
    }
}
