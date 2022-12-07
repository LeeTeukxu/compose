package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbexpedient")
public class tbexpedient implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "exId")
    private Integer exId;
    @Column(name = "InId")
    private Integer Inid;
    @Column(name = "GUID")
    private String guid;
    @Column(name = "CqTechnicalsolutions")
    private String cqTechnicalsolutions;
    @Column(name = "CqBeneficialeffect")
    private String cqBeneficialeffect;
    @Column(name = "CqExamples")
    private String cqExamples;
    @Column(name = "Cqexpedientorder")
    private String cqexpedientorder;

    public Integer getexId(){return exId;}
    public void setexId(Integer exId){this.exId=exId;}

    public Integer getInId(){return Inid;}
    public void setInId(Integer Inid){this.Inid=Inid;}

    public String getGuid(){return guid;}
    public void setGuid(String guid){this.guid=guid;}

    public String getCqTechnicalsolutions(){return cqTechnicalsolutions;}
    public void setCqTechnicalsolutions(String cqtechnicalsolutions){this.cqTechnicalsolutions=cqtechnicalsolutions;}

    public String getCqBeneficialeffect(){return cqBeneficialeffect;}
    public void setCqBeneficialeffect(String cqbeneficialeffect){this.cqBeneficialeffect=cqbeneficialeffect;}

    public String getCqExamples(){return cqExamples;}
    public void setCqExamples(String cqExamples){this.cqExamples=cqExamples;}

    public String getCqexpedientorder(){return cqexpedientorder;}
    public void setCqexpedientorder(String cqexpedientorder){this.cqexpedientorder=cqexpedientorder;}
}
