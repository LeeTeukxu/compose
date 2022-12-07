package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbAbstractAttached")
public class tbAbstractAttached implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer Id;
    @Column(name = "AttID")
    private String attid;
    @Column(name = "RowValue")
    private Integer rowValue;

    public Integer getId(){return Id;}
    public void setId(Integer Id){this.Id=Id;}

    public String getAttid(){return attid;}
    public void setAttid(String attid){this.attid=attid;}

    public Integer getRowValue(){return rowValue;}
    public void setRowValue(Integer rowValue){this.rowValue=rowValue;}
}
