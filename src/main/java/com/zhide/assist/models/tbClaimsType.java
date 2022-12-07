package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbClaimsType")
public class tbClaimsType implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ClaimsId")
    private Integer claimsId;
    @Column(name = "TypeName")
    private String typeName;

    public Integer getClaimsId(){return claimsId;}
    public void setClaimsId(Integer claimsId){this.claimsId=claimsId;}

    public String getTypeName(){return typeName;}
    public void setTypeName(String typeName){this.typeName=typeName;}

}
