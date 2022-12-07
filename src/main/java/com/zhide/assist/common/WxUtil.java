package com.zhide.assist.common;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class WxUtil {
    private static String WX_OPEN_REDIRECT_URL = "http://www.zfbip.cn/callback";
    private static String WX_OPEN_APP_ID = "wx0077b1d6e2649008";

    public static String qrCode() throws UnsupportedEncodingException {
        String baseUrl = "https://open.weixin.qq.com/connect/qrconnect" +
                "?appid=%s" +
                "&redirect_uri=%s" +
                "&response_type=code" +
                "&scope=snsapi_login" +
                "&state=%s" +
                "&connect_redirect=1#wechat_redirect";
        //转化路径中的\\，符合微信二维码路径标准
        String redirectUrl = URLEncoder.encode(WX_OPEN_REDIRECT_URL, "UTF-8");

        //自己设置的
        String state = "zfb";

        //给上面路径中的%s占位符赋值
        String retUrl = String.format(baseUrl, WX_OPEN_APP_ID, redirectUrl, state);

        //将结果返回，就可以生成二维码
        return "redirect:" + retUrl;
    }

    public static JSONObject GetWxLoginInfo(String code){
        /*start 获取微信用户基本信息*/
        //第二步：通过code换取网页授权access_token
        String url = "https://api.weixin.qq.com/sns/oauth2/access_token?"
                + "appid=" + HttpClientUtil.APPID
                + "&secret=" + HttpClientUtil.APPSECRET
                + "&code=" + code
                + "&grant_type=authorization_code";

        String result = HttpClientUtil.doGet(url);
        JSONObject jsonObject = JSON.parseObject(result);
        /*
         {   "access_token":"ACCESS_TOKEN",
            "expires_in":7200,
            "refresh_token":"REFRESH_TOKEN",
            "openid":"OPENID",
            "scope":"SCOPE"
           }
         */
        String openid = jsonObject.getString("openid");
        String access_token = jsonObject.getString("access_token");
        System.out.println("通过code换取网页授权openid:"+openid);
        System.out.println("通过code换取网页授权access_token:"+access_token);

        //第三步验证access_token是否失效；
        String chickUrl = "https://api.weixin.qq.com/sns/auth?access_token="
                + access_token + "&openid=" + openid;
        String resultInfo = HttpClientUtil.doGet(chickUrl);
        JSONObject chickuserInfo = JSON.parseObject(resultInfo);
        System.out.println(chickuserInfo.toString());
        if (!"0".equals(chickuserInfo.getString("errcode"))){
            String refreshInfo1 = HttpClientUtil.doGet(chickUrl);
            JSONObject refreshInfo = JSON.parseObject(refreshInfo1);
            /*
              { "access_token":"ACCESS_TOKEN",
                "expires_in":7200,
                "refresh_token":"REFRESH_TOKEN",
                "openid":"OPENID",
                "scope":"SCOPE" }
             */
            access_token = refreshInfo.getString("access_token");
        }
        System.out.println("第三步验证access_token是否失效:"+access_token);

        // 第四步：拉取用户信息
        String infoUrl = "https://api.weixin.qq.com/sns/userinfo?access_token=" + access_token
                + "&openid=" + openid
                + "&lang=zh_CN";
        JSONObject userInfo = JSON.parseObject(HttpClientUtil.doGet(infoUrl));
        /*
         {  "openid":" OPENID",
            "nickname": NICKNAME,
            "sex":"1",
            "province":"PROVINCE"
            "city":"CITY",
            "country":"COUNTRY",
            "headimgurl": "http://wx.qlogo.cn/mmopen/g3MonUZtNHkdmzicIlibx6iaFqAc56vxLSUfpb6n5WKSYVY0ChQKkiaJSgQ1dZuTOgvLLrhJbERQQ4eMsv84eavHiaiceqxibJxCfHe/46",
            "privilege":[ "PRIVILEGE1" "PRIVILEGE2"     ],
            "unionid": "o6_bmasdasdsad6_2sgVt7hMZOPfL"
           }
         */
        System.out.println("拉取用户信息:"+access_token);
        System.out.println("拉取用户信息openid:"+userInfo.get("openid").toString());
        return userInfo;
    }
}
