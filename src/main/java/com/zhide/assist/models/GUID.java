package com.zhide.assist.models;

import java.io.Serializable;

public class GUID implements Serializable {
    private static final long serialVersionUID = 1L;
    private String guid;

    public String getGuid(){return guid;}
    public void setGuid(String guid){this.guid=guid;}
}
