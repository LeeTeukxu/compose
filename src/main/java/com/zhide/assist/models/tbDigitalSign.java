package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbDigitalSign")
public class tbDigitalSign implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer Id;
    @Column(name = "DigitalSign")
    private String digitalSign;
    @Column(name = "UserID")
    private String userId;
    @Column(name = "RowValue")
    private Integer rowValue;

    public Integer getId(){return Id;}
    public void setId(Integer Id){this.Id=Id;}

    public String getDigitalSign(){return digitalSign;}
    public void setDigitalSign(String digitalSign){this.digitalSign=digitalSign;}

    public String getUserId(){return userId;}
    public void setUserId(String userId){this.userId=userId;}

    public Integer getRowValue(){return rowValue;}
    public void setRowValue(Integer rowValue){this.rowValue=rowValue;}

}
