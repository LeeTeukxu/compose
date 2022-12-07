package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbBgtechnology")
public class tbBgtechnology implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer Id;
    @Column(name = "Content")
    private String content;
    @Column(name = "Exception")
    private String exception;
    @Column(name = "UserID")
    private Integer userId;
    @Column(name = "RowValue")
    private Integer rowValue;

    public Integer getId(){return Id;}
    public void setId(Integer Id){this.Id=Id;}

    public String getContent(){return content;}
    public void setContent(String content){this.content=content;}

    public String getException(){return exception;}
    public void setException(String exception){this.exception=exception;}

    public Integer getUserId(){return userId;}
    public void setUserId(Integer userId){this.userId=userId;}

    public Integer getRowValue(){return rowValue;}
    public void setRowValue(Integer rowValue){this.rowValue=rowValue;}
}
