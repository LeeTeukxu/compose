package com.zhide.assist.configs;

import org.apache.catalina.Context;
import org.apache.catalina.connector.Connector;
import org.apache.coyote.http11.Http11NioProtocol;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.tomcat.util.descriptor.web.SecurityCollection;
import org.apache.tomcat.util.descriptor.web.SecurityConstraint;
import org.springframework.boot.web.client.RestTemplateBuilder;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.servlet.server.ServletWebServerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class ShiroConfiguration {
    @Bean
    public ShiroFilterFactoryBean shiroFilterFactoryBean(SecurityManager securityManager){
        ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();
        shiroFilterFactoryBean.setSecurityManager(securityManager);

        Map<String,String> filterChainDefinitionMap = new LinkedHashMap<>();
        filterChainDefinitionMap.put("/logout","logout");
        filterChainDefinitionMap.put("/favicon.ico", "anon");
        filterChainDefinitionMap.put("/js/**","anon");
        filterChainDefinitionMap.put("/res/**","anon");
        filterChainDefinitionMap.put("/fonts/**","anon");
        filterChainDefinitionMap.put("/css/**","anon");
        filterChainDefinitionMap.put("/images/**","anon");
        filterChainDefinitionMap.put("/WebAPI/**","anon");
        filterChainDefinitionMap.put("/website/**","anon");
        filterChainDefinitionMap.put("/QVerify/**","anon");
        filterChainDefinitionMap.put("/doLogin","anon");
        filterChainDefinitionMap.put("/doGetVerifyCode","anon");
        filterChainDefinitionMap.put("/getQRCode","anon");
        filterChainDefinitionMap.put("/systems/loginUser/saveAll","anon");
        filterChainDefinitionMap.put("/registered","anon");
        filterChainDefinitionMap.put("/getSMS","anon");
        filterChainDefinitionMap.put("/nl","anon");
        filterChainDefinitionMap.put("/Tool/sendwushu","anon");
        filterChainDefinitionMap.put("/Tool/download","anon");
        filterChainDefinitionMap.put("/systems/Bind/getBindSMS","anon");
        filterChainDefinitionMap.put("/systems/Bind/bindLogin","anon");
        filterChainDefinitionMap.put("/CPCUpload/**","anon");
        filterChainDefinitionMap.put("/callback","anon");
        filterChainDefinitionMap.put("/phonelogin","anon");
        filterChainDefinitionMap.put("/systems/Bind/save","anon");
        filterChainDefinitionMap.put("/systems/Bind/phonebind","anon");
        filterChainDefinitionMap.put("/systems/Bind/bindphone","anon");
        filterChainDefinitionMap.put("/systems/Bind/updatepasswordyz","anon");
        filterChainDefinitionMap.put("/systems/Bind/forgetpassword","anon");
        filterChainDefinitionMap.put("/systems/qqLogin/loginByQQ","anon");
        filterChainDefinitionMap.put("/systems/qqLogin/callback","anon");
        filterChainDefinitionMap.put("/website","anon");
        filterChainDefinitionMap.put("/**", "authc");
        //authc表示需要验证身份才能访问，还有一些比如anon表示不需要验证身份就能访问等。
        shiroFilterFactoryBean.setLoginUrl("/website");
        shiroFilterFactoryBean.setSuccessUrl("/index");
//        shiroFilterFactoryBean.setSuccessUrl("/grid");
        shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);
        return shiroFilterFactoryBean;
    }

    @Bean
    public SecurityManager securityManager(){
        DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
        securityManager.setRealm(myShiroRealm()); //将Realm注入到SecurityManager中。
        return securityManager;
    }

    @Bean
    public CustomShiroRealm myShiroRealm(){
        CustomShiroRealm myShiroRealm = new CustomShiroRealm();
        myShiroRealm.setCredentialsMatcher(hashedCredentialsMatcher());//设置解密规则
        return myShiroRealm;
    }

    @Bean
    public HashedCredentialsMatcher hashedCredentialsMatcher(){
        HashedCredentialsMatcher hashedCredentialsMatcher = new HashedCredentialsMatcher();
        hashedCredentialsMatcher.setHashAlgorithmName("md5");//散列算法:这里使用MD5算法;
        hashedCredentialsMatcher.setHashIterations(1);//散列的次数，比如散列两次，相当于 md5(md5(""));
        return hashedCredentialsMatcher;
    }

    @Bean
    public RestTemplate restTemplate(RestTemplateBuilder builder){
        return builder.build();
    }

}
