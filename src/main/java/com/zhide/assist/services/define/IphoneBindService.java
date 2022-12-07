package com.zhide.assist.services.define;

import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbLoginUser;

import javax.servlet.http.HttpServletRequest;

public interface IphoneBindService {
    tbLoginUser BindLogin(tbLoginUser tbLoginUser, String OpenID, String Type) throws Exception;

    tbLoginUser Save(tbLoginUser tbLoginUser, String Type, HttpServletRequest request) throws Exception;

    void UpdatePasswordYZ(tbLoginUser tbLoginUser) throws Exception;

    tbLoginUser UpdatePassword(tbLoginUser tbLoginUser) throws Exception;

    void UpdatePasswordByLoginCode(String Password, String LoginCode) throws Exception;
}
