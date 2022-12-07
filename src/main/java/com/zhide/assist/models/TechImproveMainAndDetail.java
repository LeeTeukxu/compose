package com.zhide.assist.models;

import java.io.Serializable;
import java.util.List;


public class TechImproveMainAndDetail implements Serializable {
    TechImproveMain main;
    TechImproveDetail detail;
    List<TechImproveDetail> listDetail;

    public TechImproveMain getMain() {
        return main;
    }

    public void setMain(TechImproveMain main) {
        this.main = main;
    }

    public TechImproveDetail getDetail() {
        return detail;
    }

    public void setDetail(TechImproveDetail detail) {
        this.detail = detail;
    }

    public List<TechImproveDetail> getListDetail() {
        return listDetail;
    }

    public void setListDetail(List<TechImproveDetail> listDetail) {
        this.listDetail = listDetail;
    }
}

