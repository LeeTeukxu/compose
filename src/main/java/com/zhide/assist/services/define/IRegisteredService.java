package com.zhide.assist.services.define;

import com.zhide.assist.models.tbLoginUser;

public interface IRegisteredService {
    tbLoginUser Save(tbLoginUser tbLoginUser) throws Exception;
}
