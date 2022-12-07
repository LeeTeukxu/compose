package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "TechImproveMain")
public class TechImproveMain implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "SubID")
    private Integer subId;
    @Column(name = "TechMainID")
    private Integer techMainId;
    @Column(name = "Improve")
    private String improve;
    @Column(name = "Target")
    private String target;
    @Column(name = "Worky")
    private String worky;
    @Column(name = "CreateTime")
    private Date createTime;
    @Column(name = "CreateMan")
    private Integer createMan;

    public Integer getSubId() {
        return subId;
    }

    public void setSubId(Integer subId) {
        this.subId = subId;
    }

    public Integer getTechMainId() {
        return techMainId;
    }

    public void setTechMainId(Integer techMainId) {
        this.techMainId = techMainId;
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

    public String getWorky() {
        return worky;
    }

    public void setWorky(String worky) {
        this.worky = worky;
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
