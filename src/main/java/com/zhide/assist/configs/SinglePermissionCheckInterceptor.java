package com.zhide.assist.configs;

import com.google.common.base.Strings;
import com.zhide.assist.models.Allow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

@Component
public class SinglePermissionCheckInterceptor extends HandlerInterceptorAdapter {

    @Autowired
    menuIdCacheObject menuIdCacheObject;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod){
            HandlerMethod method = (HandlerMethod) handler;
            Allow allowInfo = method.getMethodAnnotation(Allow.class);
            if (allowInfo == null) return true;
            String Url = request.getRequestURI();
            if (Url.startsWith("/")) Url = Url.substring(1);
            String[] Urls = Url.split("/");
            if (Url.length() == 3){
                List<String> Ps = new ArrayList<>();
                Ps.add(Urls[0]);
                Ps.add(Urls[1]);
                String preUrl = "/" + String.join("/", Ps);
                String menuId = menuIdCacheObject.getMenuIdbyUrl(preUrl);
                if (Strings.isNullOrEmpty(menuId) == false){

                }
            }
        }
        return true;
    }
}
