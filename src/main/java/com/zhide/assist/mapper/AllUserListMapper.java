package com.zhide.assist.mapper;

import com.zhide.assist.models.LoginUserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface AllUserListMapper {
    LoginUserInfo findUserInfoByAccount(@Param(value = "account") String account);
    LoginUserInfo findUserInfoByWxOpenID(@Param(value = "account") String account);
    LoginUserInfo findUserInfoByQQOpenID(@Param(value = "account") String account);
    LoginUserInfo findUserInfoByUserID(@Param(value = "UserID") Integer UserID);
    @Select(value="exec sp_syncUser N'${Account}'")
    void SyncUser(String CompanyID, String Account);
}
