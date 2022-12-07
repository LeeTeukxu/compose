package com.zhide.assist.models;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.io.Serializable;

public class TreeNode implements Serializable {
    private static final long serialVersionUID = 1L;

    private String FID;

    private String PID;

    private String AttID;

    private String Attached;

    private Integer Sort;

    private String Path;

    @JsonProperty("FID")
    public String getFID() {
        return FID;
    }

    public void setFID(String FID) {
        this.FID = FID;
    }

    @JsonProperty("PID")
    public String getPID() {
        return PID;
    }

    public void setPID(String PID) {
        this.PID = PID;
    }

    @JsonProperty("AttID")
    public String getAttID() {
        return AttID;
    }

    public void setAttID(String attID) {
        AttID = attID;
    }

    @JsonProperty("Attached")
    public String getAttached() {
        return Attached;
    }

    public void setAttached(String attached) {
        Attached = attached;
    }

    @JsonProperty("Sort")
    public Integer getSort() {
        return Sort;
    }

    public void setSort(Integer sort) {
        Sort = sort;
    }

    public String getPath() {
        return Path;
    }

    public void setPath(String path) {
        Path = path;
    }
}
