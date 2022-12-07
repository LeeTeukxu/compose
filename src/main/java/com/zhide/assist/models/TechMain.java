package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "TechMain")
public class TechMain implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer id;
    @Column(name = "Shenqingrxm")
    private String shenqingrxm;
    @Column(name = "Writer")
    private String writer;
    @Column(name = "LinkPhone")
    private String linkPhone;
    @Column(name = "LinkMail")
    private String linkMail;
    @Column(name = "TechStatus")
    private Integer techStatus;
    @Column(name = "ApplyTarget")
    private Integer applyTarget;
    @Column(name = "ApplyType")
    private Integer applyType;
    @Column(name = "Others")
    private String Others;
    @Column(name = "CreateMan")
    private Integer createMan;
    @Column(name = "CreateTime")
    private Date createTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getShenqingrxm() {
        return shenqingrxm;
    }

    public void setShenqingrxm(String shenqingrxm) {
        this.shenqingrxm = shenqingrxm;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getLinkPhone() {
        return linkPhone;
    }

    public void setLinkPhone(String linkPhone) {
        this.linkPhone = linkPhone;
    }

    public String getLinkMail() {
        return linkMail;
    }

    public void setLinkMail(String linkMail) {
        this.linkMail = linkMail;
    }

    public Integer getTechStatus() {
        return techStatus;
    }

    public void setTechStatus(Integer techStatus) {
        this.techStatus = techStatus;
    }

    public Integer getApplyTarget() {
        return applyTarget;
    }

    public void setApplyTarget(Integer applyTarget) {
        this.applyTarget = applyTarget;
    }

    public Integer getApplyType() {
        return applyType;
    }

    public void setApplyType(Integer applyType) {
        this.applyType = applyType;
    }

    public String getOthers() {
        return Others;
    }

    public void setOthers(String others) {
        Others = others;
    }

    public Integer getCreateMan() {
        return createMan;
    }

    public void setCreateMan(Integer createMan) {
        this.createMan = createMan;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}

