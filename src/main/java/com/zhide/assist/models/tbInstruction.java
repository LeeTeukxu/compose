package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbInstruction")
public class tbInstruction implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer Id;
    @Column(name = "Instruction")
    private String instruction;
    @Column(name = "UserID")
    private Integer userId;
    @Column(name = "RowValue")
    private Integer rowValue;

    public Integer getId(){return Id;}
    public void setId(Integer Id){this.Id=Id;}

    public String getInstruction(){return instruction;}
    public void setInstruction(String instruction){this.instruction=instruction;}

    public Integer getUserId(){return userId;}
    public void setUserId(Integer userId){this.userId=userId;}

    public Integer getRowValue(){return rowValue;}
    public void setRowValue(Integer rowValue){this.rowValue=rowValue;}
}
