package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "TechSubject")
public class TechSubject implements Serializable {
    @Column(name = "TechMainID")
    private Integer techMainId;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "SubID")
    private Integer subId;
    @Column(name = "Name")
    private String name;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

