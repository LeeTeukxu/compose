package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "TechFiles")
public class TechFiles implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "SubID")
    private Integer subId;
    @Column(name = "TechMainID")
    private Integer techMainId;
    @Column(name = "AttID")
    private String attId;
    @Column(name = "Type")
    private Integer type;
    @Column(name = "Memo")
    private String memo;
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

    public String getAttId() {
        return attId;
    }

    public void setAttId(String attId) {
        this.attId = attId;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
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
