package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "TechImproveDetail")
public class TechImproveDetail implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "TinyID")
    private Integer tinyId;
    @Column(name = "MainID")
    private Integer mainId;
    @Column(name = "Code")
    private Integer code;
    @Column(name = "Improve")
    private String improve;
    @Column(name = "Target")
    private String target;
    @Column(name = "CreateTime")
    private Date createTime;
    @Column(name = "CreateMan")
    private Integer createMan;

    public Integer getTinyId() {
        return tinyId;
    }

    public void setTinyId(Integer tinyId) {
        this.tinyId = tinyId;
    }

    public Integer getMainId() {
        return mainId;
    }

    public void setMainId(Integer mainId) {
        this.mainId = mainId;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getImprove() {
        return improve;
    }

    public void setImprove(String improve) {
        this.improve = improve;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
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
