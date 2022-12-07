package com.zhide.assist.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbTechnology")
@JsonIgnoreProperties(value = {"hibernateLazyInitializer"})
public class tbTechnology implements Serializable {
    @Id
    @Column(name = "TechnologyID")
    private Integer technologyId;
    @Column(name = "SN")
    private Integer sn;
    @Column(name = "PID")
    private Integer pid;
    @Column(name = "Name")
    private String name;
    @Column(name = "CanUse")
    private boolean canUse;
    @Column(name = "Memo")
    private String memo;
    @Column(name = "Timep")
    private String timep;
    @Column(name = "Sort")
    private String sort;
    @Transient
    private Integer num;

    public Integer getSn() {
        return sn;
    }

    public void setSn(Integer sn) {
        this.sn = sn;
    }


    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }


    public Integer getTechnologyId() {
        return technologyId;
    }

    public void setTechnologyId(Integer technologyId) {
        this.technologyId = technologyId;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public boolean getCanUse() {
        return canUse;
    }

    public void setCanUse(boolean canUse) {
        this.canUse = canUse;
    }


    public String getMemo() {
        return memo;
    }

    public void setMemo(String memo) {
        this.memo = memo;
    }


    public String getTimep() {
        return timep;
    }

    public void setTimep(String timep) {
        this.timep = timep;
    }


    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }

    public Integer getNum() {
        if(num==null)num=0;
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }
}
