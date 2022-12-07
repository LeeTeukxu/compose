package com.zhide.assist.configs;


import com.zhide.assist.multitenancy.Interceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Component
public class CustomMvcConfig implements WebMvcConfigurer {

    @Autowired
    private Interceptor interceptor;

    @Autowired
    private IndexActionInterceptor indexActionInterceptor;

    @Autowired
    private SinglePermissionCheckInterceptor singlePermission;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(interceptor);
        registry.addInterceptor(indexActionInterceptor);
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/images/**").addResourceLocations("file:d:/Upload/Images/");
        registry.addResourceHandler("/appImages/**").addResourceLocations("classpath:/static/images/");
        registry.addResourceHandler("/attImages/**").addResourceLocations("file:c:/AssistFtp/");
    }
}
