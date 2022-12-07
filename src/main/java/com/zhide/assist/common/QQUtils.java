package com.zhide.assist.common;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Component
public class QQUtils {

    /**
     * 拼接用于获取accessToken的链接
     */
    public static String getUrlForAccessToken(String authorization_code) throws UnsupportedEncodingException {
        String grant_type = "authorization_code";
        String client_id = LoginQQConstant.APP_ID;
        String client_secret = LoginQQConstant.APP_KEY;
        String redirect_uri = LoginQQConstant.CALLBACK_URL;

        String url = String.format(LoginQQConstant.GET_ACCESS_TOKEN +
                        "?grant_type=%s&client_id=%s&client_secret=%s&code=%s&redirect_uri=%s",
                grant_type, client_id, client_secret, authorization_code, redirect_uri);
        return url;
    }

    /**
     * 获取accessToken
     */
    public static String getAccessToken(String urlForAccessToken, RestTemplate restTemplate){
        String firstCallbackInfo = restTemplate.getForObject(urlForAccessToken,String.class);
        System.out.println("获取accessToken" + firstCallbackInfo);
        String[] params = firstCallbackInfo.split("&");
        String access_token = null;
        for (String param : params){
            String[] keyValue = param.split("=");
            if (keyValue[0].equals("access_token")){
                access_token = keyValue[1];
                break;
            }
        }
        return access_token;
    }

    /**
     * 根据accessToken获取openid
     */
    public static String getOpenId(String access_token, RestTemplate restTemplate) throws IOException{
        String url = String.format(LoginQQConstant.GET_OPEN_ID + "?access_token=%s",access_token);
        //第二次模拟客户端发出请求后得到的是带openid的返回数据
        String secondCallbackInfo = restTemplate.getForObject(url, String.class);

        //正则表达式处理
        String regex = "\\{.*\\}";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(secondCallbackInfo);
        if (!matcher.find()){
            throw new RuntimeException("异常的回调值: " + secondCallbackInfo);
        }

        //调用jackson
        ObjectMapper objectMapper = new ObjectMapper();
        HashMap hashMap = objectMapper.readValue(matcher.group(0), HashMap.class);

        String openid = ((String) hashMap.get("openid"));
        return openid;
    }

    /**
     * 根据openid获取用户信息
     */
    public static JSONObject getUserInfo(String access_token, String OpenID, RestTemplate restTemplate) throws IOException{
        String APP_ID = LoginQQConstant.APP_ID;
        String url = String.format(LoginQQConstant.GET_USER_INFO + "?access_token=%s&oauth_consumer_key=%s&openid=%s",access_token,APP_ID,OpenID);
        JSONObject jsonObject = null;
        CloseableHttpClient client = HttpClients.createDefault();

        HttpGet httpGet = new HttpGet(url);
        HttpResponse response = client.execute(httpGet);
        HttpEntity entity = response.getEntity();


        if(entity != null){
            String result = EntityUtils.toString(entity,"UTF-8");
            jsonObject = JSONObject.parseObject(result);
        }

        httpGet.releaseConnection();

        return jsonObject;
    }
}
