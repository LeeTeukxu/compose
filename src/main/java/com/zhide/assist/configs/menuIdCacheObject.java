package com.zhide.assist.configs;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

@Component
public class menuIdCacheObject {

    String cacheKey = "Url_MenuID_Cache";

    @Autowired
    StringRedisTemplate  redisTemplate;

    public void add(String menuId, String url){
        if (redisTemplate.opsForHash().hasKey(cacheKey,url) == false){
            redisTemplate.opsForHash().put(cacheKey,url,menuId);
        }
    }

    public String getMenuIdbyUrl(String url){
        if (redisTemplate.opsForHash().hasKey(cacheKey,url)){
            Object OO = redisTemplate.opsForHash().get(cacheKey,url);
            return OO.toString();
        }else return null;
    }
}
