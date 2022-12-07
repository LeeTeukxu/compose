package com.zhide.assist.models;

import java.io.Serializable;
import java.util.List;

public class LoginUserInfo implements Serializable {
    private static final long serialVersionUID = 1L;
    private String userId;
    private String userName;
    private String password;
    private  boolean canLogin;
    private String loginName;
    private Integer rowValue;
    private String TruthTemplateID;
    private Integer TechMainID;

    public List<Integer> getMyManager() {
        return myManager;
    }
    public Integer getUserIdValue(){
        return Integer.parseInt(userId);
    }
    public void setMyManager(List<Integer> myManager) {
        this.myManager = myManager;
    }

    private List<Integer> myManager;

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public boolean getIsCanLogin() {
        return canLogin;
    }

    public void setCanLogin(boolean canLogin) {
        this.canLogin = canLogin;
    }

    public Integer getRowValue(){return rowValue;}

    public void setRowValue(Integer rowValue){this.rowValue = rowValue;}

    public String getLoginName(){return loginName;}

    public void setLoginName(String loginName){this.loginName=loginName;}

    public String getTruthTemplateID() {
        return TruthTemplateID;
    }

    public void setTruthTemplateID(String truthTemplateID) {
        TruthTemplateID = truthTemplateID;
    }

    public Integer getTechMainID() {
        return TechMainID;
    }

    public void setTechMainId(Integer TechMainID) {
        TechMainID = TechMainID;
    }
}
