package com.zhide.assist.configs;

import com.google.common.base.Strings;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbMenuListRepository;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 对Index访问进行拦截，并将前缀与MenuID做一个缓存处理。
 */
@Component
public class IndexActionInterceptor extends HandlerInterceptorAdapter {
    Logger logger= LoggerFactory.getLogger(IndexActionInterceptor.class);

    @Autowired
    tbMenuListRepository menuRepository;

    @Autowired
    menuIdCacheObject menuIdCacheObject;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws
            Exception {
        if(handler instanceof HandlerMethod) {
            String Url = request.getRequestURI();
            String menuId = request.getParameter("MenuID");
            if (Url.indexOf("/index") > -1 && !Strings.isNullOrEmpty(menuId)) {
                String Tx=Url.replace("/index","");
                if (Url.equals("/work/notice/index")) {
                    String type = request.getParameter("Type");
                    Url = Tx+ "?Type=" + type;
                } else Url=Tx;
                int MID=Integer.parseInt(menuId);
                String menuName=menuRepository.getTitleByFid(MID);
                request.getSession(true).setAttribute("CurrentMenu",menuName);
                menuIdCacheObject.add(menuId, Url);
            }

        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        if (handler instanceof HandlerMethod){
            String pageName = request.getParameter("pageName");
            String XUrl = request.getRequestURI();
            LoginUserInfo Info = CompanyContext.get();
            if (StringUtils.isEmpty(pageName) == false){
                modelAndView.addObject("PageName",pageName);
            }
        }
    }
}
