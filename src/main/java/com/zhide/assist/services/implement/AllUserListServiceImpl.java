package com.zhide.assist.services.implement;

import com.zhide.assist.mapper.AllUserListMapper;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.services.define.IAllUserListService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

@Service
public class AllUserListServiceImpl implements IAllUserListService {
    @Autowired
    AllUserListMapper allUserListMapper;

    @Override
    public LoginUserInfo findUserInfoByAccount(String Account) {
        return allUserListMapper.findUserInfoByAccount(Account);
    }

    @Override
    public LoginUserInfo findUserInfoByWxOpenID(String Account) {
        return allUserListMapper.findUserInfoByWxOpenID(Account);
    }

    @Override
    public LoginUserInfo findUserInfoByQQOpenID(String Account) {
        return allUserListMapper.findUserInfoByQQOpenID(Account);
    }

    @Override
    public LoginUserInfo findUserInfoByUserID(Integer UserID) {
        return allUserListMapper.findUserInfoByUserID(UserID);
    }
}
