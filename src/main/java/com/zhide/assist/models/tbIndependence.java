package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbIndependence")
public class tbIndependence implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "InId")
    private Integer Inid;
    @Column(name = "DqObjectinvention")
    private String dqObjectinvention;
    @Column(name = "DqTechnicalsolutions")
    private String dqTechnicalsolutions;
    @Column(name = "DqBeneficialeffect")
    private String dqBeneficialeffect;
    @Column(name = "DqExamples")
    private String dqExamples;
    @Column(name = "DqExclusiveorder")
    private String dqExclusiveorder;
    @Column(name = "DqNum")
    private String dqNum;
    @Column(name = "UserID")
    private Integer userId;
    @Column(name = "RowValue")
    private Integer rowValue;
    @Column(name = "OnlyId")
    private Integer onlyId;


    public Integer getInId(){return Inid;}
    public void setInId(Integer Inid){this.Inid=Inid;}

    public String getDqObjectinvention(){return dqObjectinvention;}
    public void setDqObjectinvention(String dqObjectinvention){this.dqObjectinvention=dqObjectinvention;}

    public String getDqTechnicalsolutions(){return dqTechnicalsolutions;}
    public void setDqTechnicalsolutions(String dqtechnicalsolutions){this.dqTechnicalsolutions=dqtechnicalsolutions;}

    public String getDqBeneficialeffect(){return dqBeneficialeffect;}
    public void setDqBeneficialeffect(String dqbeneficialeffect){this.dqBeneficialeffect=dqbeneficialeffect;}

    public String getDqExamples(){return dqExamples;}
    public void setDqExamples(String dqexamples){this.dqExamples=dqexamples;}

    public String getDqExclusiveorder(){return dqExclusiveorder;}
    public void setDqExclusiveorder(String dqExclusiveorder){this.dqExclusiveorder=dqExclusiveorder;}

    public String getDqNum(){return dqNum;}
    public void setDqNum(String dqNum){this.dqNum=dqNum;}

    public Integer getUserId(){return userId;}
    public void setUserId(Integer userId){this.userId=userId;}

    public Integer getRowValue(){return rowValue;}
    public void setRowValue(Integer rowValue){this.rowValue=rowValue;}

    public Integer getOnlyId(){return onlyId;}
    public void setOnlyId(Integer onlyId){this.onlyId=onlyId;}

}
