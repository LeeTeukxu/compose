package com.zhide.assist.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * @ClassName: RedisUtils
 * @Author: JYM
 * @*TODO:
 * @CreateTime: 2021年2月7日 23:10
 **/
@Component
public class RedisUtils {
    @Autowired
    StringRedisTemplate redRep;

    Logger logger = LoggerFactory.getLogger(RedisUtils.class);

    public void clearAll(String KeyPattern){
        Set<String> Keys = redRep.keys("*" + KeyPattern + "*");
        Keys.forEach(f -> {
            Boolean X = redRep.delete(f);
            logger.info("删除Redis中Key为:" + f + "的记录,结果为:" + X.toString());
        });
    }

    public static void saveToRedis(String Key, String value,RedisTemplate<String,Object> redisTemplate){
        redisTemplate.delete(Key);
        redisTemplate.opsForList().leftPush(Key, value);
        redisTemplate.expire(Key,30, TimeUnit.MINUTES);
    }

    public static String getFromRedis(String Key, RedisTemplate<String,Object> redisTemplate){
        String value = "";
        if (redisTemplate.hasKey(Key)) {
            value = redisTemplate.opsForList().index(Key, 0).toString();
        }
        return value;
    }

    public static void saveLoginInfoToRedis(String Key, String value,RedisTemplate<String,Object> redisTemplate){
        redisTemplate.delete(Key);
        redisTemplate.opsForList().leftPush(Key, value);
    }

    public static String getLoginInfoFromRedis(String Key, RedisTemplate<String,Object> redisTemplate){
        String value = "";
        if (redisTemplate.hasKey(Key)) {
            value = redisTemplate.opsForList().index(Key, 0).toString();
        }
        return value;
    }
}
