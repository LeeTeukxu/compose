package com.zhide.assist.common;

import com.zhide.assist.models.GUID;
import org.springframework.stereotype.Component;

@Component
public class GUIDContext {
    private static ThreadLocal<GUID> currentTenant = new ThreadLocal<>();

    public static GUID get(){
        return currentTenant.get();
    }

    public static void set(GUID guid){currentTenant.set(guid);}

    public static void clear(){currentTenant.set(null);}
}
