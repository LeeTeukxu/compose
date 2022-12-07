package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbDqExamples")
public class tbDqExamples implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "EpId")
    private Integer epId;

    @Column(name = "DqExamples")
    private String dqExamples;

    @Column(name = "UserID")
    private Integer userId;

    @Column(name = "RowValue")
    private Integer rowValue;

    @Column(name = "InId")
    private Integer inId;

    @Column(name = "OrderNum")
    private Integer orderNum;

    public Integer getEpId(){return epId;}
    public void setEpId(Integer epId){this.epId=epId;}

    public String getDqExamples(){return dqExamples;}
    public void setDqExamples(String dqexamples){this.dqExamples=dqexamples;}

    public Integer getUserId(){return userId;}
    public void setUserId(Integer userId){this.userId=userId;}

    public Integer getRowValue(){return rowValue;}
    public void setRowValue(Integer rowValue){this.rowValue=rowValue;}

    public Integer getInId(){return inId;}
    public void setInId(Integer inId){this.inId=inId;}

    public Integer getOrderNum(){return orderNum;}
    public void setOrderNum(Integer orderNum){this.orderNum=orderNum;}
}

