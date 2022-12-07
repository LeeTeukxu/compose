package com.zhide.assist.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.stereotype.Component;

import javax.persistence.*;
import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "tbLoginUser")
@JsonIgnoreProperties(value = {"hibernateLazyInitializer"})
public class tbLoginUser implements Serializable {
    @Id
    @Column(name = "UserID")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userId;
    @Column(name = "UserName")
    private String userNme;
    @Column(name = "WxOpenID")
    private String wxOpenId;
    @Column(name = "QQOpenID")
    private String qqOpenId;
    @Column(name = "LoginCode")
    private String loginCode;
    @Column(name = "Password")
    private String password;
    @Column(name = "WXNickName")
    private String wxNickName;
    @Column(name = "QQNickName")
    private String qqNickName;
    @Column(name = "CanLogin")
    private boolean canLogin;
    @Column(name = "CreateTime")
    private Date createTime;
    @Column(name = "LastLoginTime")
    private Date lastLoginTime;
    @Column(name = "LoginCount")
    private Integer loginCount;
    @Column(name = "RowValue")
    private Integer rowValue;
    @Column(name = "Timep")
    private String timep;
    @Column(name="Memo")
    private String memo;
    @Transient
    private String phoneCode;
    @Transient
    private String VerifyCode;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }


    public String getUserNme() {
        return userNme;
    }

    public void setUserNme(String userNme) {
        this.userNme = userNme;
    }

    public String getWxOpenId(){return wxOpenId;}

    public void setWxOpenId(String wxOpenId){this.wxOpenId = wxOpenId;}

    public String getQqOpenId(){return qqOpenId;}

    public void setQqOpenId(String qqOpenId){this.qqOpenId = qqOpenId;}

    public String getLoginCode() {
        return loginCode;
    }

    public void setLoginCode(String loginCode) {
        this.loginCode = loginCode;
    }


    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getWxNickName(){return wxNickName;}

    public void setWxNickName(String wxNickName){this.wxNickName=wxNickName;}

    public String getQqNickName(){return qqNickName;}

    public void setQqNickName(String qqNickName){this.qqNickName=qqNickName;}

    public boolean getCanLogin() {
        return canLogin;
    }

    public void setCanLogin(boolean canLogin) {
        this.canLogin = canLogin;
    }


    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }


    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLogIntegerime) {
        this.lastLoginTime = lastLogIntegerime;
    }


    public Integer getLoginCount() {
        return loginCount;
    }

    public void setLoginCount(Integer loginCount) {
        this.loginCount = loginCount;
    }

    public Integer getRowValue(){return rowValue;}

    public void setRowValue(Integer rowValue){this.rowValue=rowValue;}

    public String getTimep() {
        return timep;
    }

    public void setTimep(String timep) {
        this.timep = timep;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }

    public String getPhoneCode(){return phoneCode;}

    public void setPhoneCode(String phoneCode){this.phoneCode=phoneCode;}

    public String getVerifyCode(){return VerifyCode;}

    public void setVerifyCode(String VerifyCode){this.VerifyCode=VerifyCode;}
}
