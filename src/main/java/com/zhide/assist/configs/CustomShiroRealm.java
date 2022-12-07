package com.zhide.assist.configs;

import com.zhide.assist.common.MD5Util;
import com.zhide.assist.common.RedisUtils;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.services.define.IAllUserListService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

public class CustomShiroRealm extends AuthorizingRealm {

    @Autowired
    IAllUserListService allMapper;

    @Resource
    RedisTemplate<String,Object> redisTemplate;

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        MD5Util md5Util = new MD5Util("zhifubang");
        String LoginType = RedisUtils.getLoginInfoFromRedis("LoginType",redisTemplate);
        String account =(String)token.getPrincipal();
        LoginUserInfo userInfo = allMapper.findUserInfoByAccount(account);
        if (LoginType.equals("WXLogin")){
            userInfo = allMapper.findUserInfoByWxOpenID(account);
            userInfo.setPassword(md5Util.EnCode("BindLoginPwd"));
        }else if (LoginType.equals("QQLogin")){
            userInfo = allMapper.findUserInfoByQQOpenID(account);
            userInfo.setPassword(md5Util.EnCode("BindLoginPwd"));
        }else if (LoginType.equals("PhoneLogin")){
            userInfo.setPassword(md5Util.EnCode("BindLoginPwd"));
        }
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(account,userInfo.getPassword(),getName());
        return authenticationInfo;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }
}
