package com.zhide.assist.repositorys;

import com.zhide.assist.models.tbLoginUser;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.swing.text.html.Option;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Repository
public interface tbLoginUserRepository extends JpaRepository<tbLoginUser, Integer> {

    tbLoginUser findAllByUserId(Integer UserId);

    tbLoginUser findAllByLoginCode(String loginCode);

    tbLoginUser findAllByLoginCodeAndQqOpenId(String LoginCode,String QQOpenID);

    tbLoginUser findAllByLoginCodeAndWxOpenId(String LoginCode,String WxOpenID);

    tbLoginUser findAllByLoginCodeAndUserIdIsNot(String loginCode, Integer userId);

    List<tbLoginUser> findAllByWxOpenId(String wxOpenId);

    List<tbLoginUser> findAllByQqOpenId(String qqOpenId);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbLoginUser SET WxOpenID=:WxOpenID,WXNickName=:WXNickName WHERE LoginCode=:LoginCode",nativeQuery = true)
    void UpdateWxOpenID(@Param("WxOpenID") String WxOpenID,
                        @Param("WXNickName") String WXNickName,
                        @Param("LoginCode") String LoginCode);
    @Transactional
    @Modifying
    @Query(value = "UPDATE tbLoginUser SET QQOpenID=:QQOpenID,QQNickName=:QQNickName WHERE LoginCode=:LoginCode",nativeQuery = true)
    void UpdateQQOpenID(@Param("QQOpenID") String QQOpenID,
                        @Param("QQNickName") String QQNickName,
                        @Param("LoginCode") String LoginCode);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbLoginUser SET WxOpenID=:WxOpenID,WXNickName=:WXNickName WHERE UserID=:UserID",nativeQuery = true)
    void UpdateWxOpenIDByUserID(@Param("WxOpenID") String WxOpenID,
                                @Param("WXNickName") String WXNickName,
                                @Param("UserID") Integer UserID);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbLoginUser SET QQOpenID=:QQOpenID,QQNickName=:QQNickName WHERE UserID=:UserID",nativeQuery = true)
    void UpdateQQOpenIDByUserID(@Param("QQOpenID") String QQOpenID,
                        @Param("QQNickName") String QQNickName,
                        @Param("UserID") Integer UserID);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbLoginUser SET LoginCode=:LoginCode WHERE UserID=:UserID",nativeQuery = true)
    void UpdateLoginCodeByUserID(@Param("LoginCode") String LoginCode,
                                 @Param("UserID") Integer UserID);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbLoginUser SET Password=:Password WHERE UserID=:UserID",nativeQuery = true)
    void UpdatePasswordByUserID(@Param("Password") String Password,
                                @Param("UserID") Integer UserID);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbLoginUser SET Password=:Password WHERE LoginCode=:LoginCode",nativeQuery = true)
    void UpdatePasswordByLoginCode(@Param("Password") String Password,
                                   @Param("LoginCode") String LoginCode);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbLoginUser SET WxOpenID=NULL,WXNickName=NULL WHERE UserID=:UserID",nativeQuery = true)
    void CancelBindWx(@Param("UserID") Integer UserID);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbLoginUser SET QQOpenID=NULL,QQNickName=NULL WHERE UserID=:UserID",nativeQuery = true)
    void CancelBindQQ(@Param("UserID") Integer UserID);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbLoginUser SET LoginCode=NULL WHERE UserID=:UserID",nativeQuery = true)
    void CancelBindPhone(@Param("UserID") Integer UserID);

    @Transactional
    @Modifying
    @Query(value = "UPDATE tbLoginUser SET RowValue=:RowValue WHERE UserID=:UserID",nativeQuery = true)
    void UpdateRowValue(@Param("RowValue") Integer RowValue,
            @Param("UserID") Integer UserID);
}

