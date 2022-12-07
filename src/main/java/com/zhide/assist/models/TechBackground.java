package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "TechBackground")
public class TechBackground implements Serializable {
    @Column(name = "TechMainID")
    private Integer techMainId;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "SubID")
    private Integer subId;
    @Column(name = "TechContent")
    private String techContent;
    @Column(name = "CreateMan")
    private Integer createMan;
    @Column(name = "CreateTime")
    private Date createTime;

    public Integer getTechMainId() {
        return techMainId;
    }

    public void setTechMainId(Integer techMainId) {
        this.techMainId = techMainId;
    }

    public Integer getSubId() {
        return subId;
    }

    public void setSubId(Integer subId) {
        this.subId = subId;
    }

    public String getTechContent() {
        return techContent;
    }

    public void setTechContent(String techContent) {
        this.techContent = techContent;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getCreateMan() {
        return createMan;
    }

    public void setCreateMan(Integer createMan) {
        this.createMan = createMan;
    }
}

