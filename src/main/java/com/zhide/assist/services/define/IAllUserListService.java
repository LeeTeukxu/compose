package com.zhide.assist.services.define;

import com.zhide.assist.models.LoginUserInfo;
import org.springframework.stereotype.Service;

@Service
public interface IAllUserListService {
     LoginUserInfo findUserInfoByAccount(String Account);

     LoginUserInfo findUserInfoByWxOpenID(String Account);

     LoginUserInfo findUserInfoByQQOpenID(String Account);

     LoginUserInfo findUserInfoByUserID(Integer UserID);
}
