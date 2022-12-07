package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbTechnicalField")
public class tbTechnicalField implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer Id;
    @Column(name = "TechnicalField")
    private String technicalField;
    @Column(name = "TcOne")
    private String tcOne;
    @Column(name = "TcTwo")
    private String tcTwo;
    @Column(name = "UserID")
    private Integer userId;
    @Column(name = "RowValue")
    private Integer rowValue;

    public Integer getId(){return Id;}
    public void setId(Integer Id){this.Id=Id;}

    public String getTechnicalField(){return technicalField;}
    public void setTechnicalField(String technicalField){this.technicalField=technicalField;}

    public String getTcOne(){return tcOne;}
    public void setTcOne(String tcOne){this.tcOne=tcOne;}

    public String getTcTwo(){return tcTwo;}
    public void setTcTwo(String tcTwo){this.tcTwo=tcTwo;}

    public Integer getUserId(){return userId;}
    public void setUserId(Integer userId){this.userId=userId;}

    public Integer getRowValue(){return rowValue;}
    public void setRowValue(Integer rowValue){this.rowValue=rowValue;}
}
