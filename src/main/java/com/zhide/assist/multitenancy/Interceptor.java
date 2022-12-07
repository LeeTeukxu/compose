package com.zhide.assist.multitenancy;

import com.google.common.base.Strings;
import com.zhide.assist.common.TokenUtils;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbLoginUser;
import com.zhide.assist.repositorys.tbLoginUserRepository;
import com.zhide.assist.services.define.IAllUserListService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

@Component
public class Interceptor extends HandlerInterceptorAdapter {

    @Autowired
    tbLoginUserRepository loginUserRepository;

    @Autowired
    IAllUserListService allMapper;

    private static String rowValue = "0";
    private static Integer techMainID = 0;

    List<String> urls= Arrays.asList("/login","/registered","/systems/loginUser/saveAll","/getQRCode","/getSMS","/systems/Bind/getBindSMS","/systems/Bind/bindLogin","/error","/WebAPI","/CPCUpload","/doLogin","/WebAPI/Login",
            "/WebAPI/IsLegalLogin","/callback","/systems/Bind/phonebind","/systems/Bind/bindphone","/systems/Bind/updatepasswordyz","/systems/Bind/forgetpassword","/systems/qqLogin/loginByQQ","/systems/qqLogin/callback","/systems/Bind/save","/phonelogin","/website","/QVerify","/nl","/Tool/sendwushu","/Tool/download");
    Logger logger= LoggerFactory.getLogger(Interceptor.class);

    @Value("${publish.version}")
    String version;
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView
            modelAndView) throws Exception {
//        CompanyContext.clear();
        if(version!=null && modelAndView!=null) {
            modelAndView.addObject("version", version);
        }

        String VX=request.getRequestURI();
        HttpSession session=request.getSession();
        System.out.println(VX);
        if(session!=null) {
            Object OO = session.getAttribute("loginUser");
            if (OO != null) {
                LoginUserInfo Info = (LoginUserInfo) OO;
                if (Info != null) {
                    if (VX.equals("/Product/save")) {
                        String AssistID = session.getAttribute("AssistID").toString();
                        if (org.apache.logging.log4j.util.Strings.isEmpty(AssistID)==false){
                            rowValue = AssistID;
                            loginUserRepository.UpdateRowValue(Integer.parseInt(rowValue), Info.getUserIdValue());
                        }
                        LoginUserInfo loginUserInfo = allMapper.findUserInfoByUserID(Info.getUserIdValue());
                        CompanyContext.set(loginUserInfo);
                    }
                }
            }
        }
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws
            Exception {
        String VX=request.getRequestURI();
        if( VX.startsWith("/js") || VX.startsWith("/images") || VX.startsWith("/res") || VX.startsWith("/website") || VX.startsWith("/QVerify")) {
            return true;
        }

        HttpSession session=request.getSession();
        boolean hasLogin=false;
        if(session!=null){
            Object OO=session.getAttribute("loginUser");
            if(OO!=null) {
                LoginUserInfo Info=(LoginUserInfo)OO;
                if(Info!=null){
                    if (VX.startsWith("/editAssistName")){
                        rowValue = request.getParameter("ID");
                        loginUserRepository.UpdateRowValue(Integer.parseInt(rowValue),Info.getUserIdValue());
                    }else if (VX.startsWith("/Product/index")){
                        String Mode = request.getParameter("Mode");
                        if (Mode != null && Mode.equals("Add")) {
                            loginUserRepository.UpdateRowValue(0, Info.getUserIdValue());
                        }
                    }
                    LoginUserInfo loginUserInfo = allMapper.findUserInfoByUserID(Info.getUserIdValue());
                    CompanyContext.set(loginUserInfo);
                    hasLogin=true;
                }
            } else {
                String token=request.getParameter("webToken");
                if(StringUtils.isEmpty(token)==false){
                    String companyId= TokenUtils.getCompanyIdByToken(token);
                    if(Strings.isNullOrEmpty(companyId)==false) {
                        LoginUserInfo info = new LoginUserInfo();
                        CompanyContext.set(info);
                        hasLogin = true;
                        logger.info(VX + " take webToken:" + token);
                    }
                }
            }
        }
        if(hasLogin==false){
            String VV= request.getRequestURI();
            if (!VV.equals("/doGetVerifyCode")) {
                if (urls.contains(VV) == false) {
                    rowValue = "0";
                    logger.info(VV + "被访问时Session已过期!");
                    response.sendRedirect("/login");
                    return false;
                }
            }
        }
        return true;
    }
}
