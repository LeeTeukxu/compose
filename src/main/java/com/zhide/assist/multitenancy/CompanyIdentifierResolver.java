package com.zhide.assist.multitenancy;

import com.zhide.assist.common.GlobalContext;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.common.GlobalContext;
import com.zhide.assist.models.LoginUserInfo;
import org.hibernate.context.spi.CurrentTenantIdentifierResolver;
import org.springframework.stereotype.Component;

@Component
public class CompanyIdentifierResolver implements CurrentTenantIdentifierResolver {
    @Override
    public String resolveCurrentTenantIdentifier() {
        LoginUserInfo Info=CompanyContext.get();
        if(Info==null) return GlobalContext.Default;
        else return "Assist";
    }

    @Override
    public boolean validateExistingCurrentSessions() {
        return true;
    }
}
