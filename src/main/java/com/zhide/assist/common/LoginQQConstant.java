package com.zhide.assist.common;

public final class LoginQQConstant {
    private LoginQQConstant(){}

    /**
     * 登录处理回调地址，可自定义
     */
    public static final String CALLBACK_URL ="http://www.zfbip.cn/systems/qqLogin/callback";
    public static final String CALLBACK_BINDURL ="http://www.zfbip.cn/systems/qqLogin/bcb";

    /**
     * appID和appKey
     */
    public static final String APP_ID = "101970238";
    public static final String APP_KEY = "e485755ba32cbae27cea9d528db2e70c";

    /**
     * 获取Authorization Code
     */
    public static final String GET_AUTHORIZATION_CODE = "https://graph.qq.com/oauth2.0/authorize";

    /**
     * 通过Authorization Code获取Access Token
     */
    public static final String GET_ACCESS_TOKEN = "https://graph.qq.com/oauth2.0/token";

    /**
     * 获取用户openId
     */
    public static final String GET_OPEN_ID = "https://graph.qq.com/oauth2.0/me";

    /**
     * 获取用户信息
     */
    public static final String GET_USER_INFO = "https://graph.qq.com/user/get_user_info";
}
