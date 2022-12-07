package com.zhide.assist.multitenancy;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbIndependence;

public class CompanyContext {
    private static ThreadLocal<LoginUserInfo> currentTenant = new ThreadLocal<>();
    public static void set(LoginUserInfo info){
        currentTenant.set(info);
    }
    public static  LoginUserInfo get(){
        return currentTenant.get();
    }
    public static void clear(){
        currentTenant.set(null);
    }
}
