package com.zhide.assist.models;

import javax.persistence.*;
import javax.xml.crypto.Data;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "tbAttached")
public class tbAttached implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer Id;
    @Column(name = "Attached")
    private String attached;
    @Column(name = "Path")
    private String path;
    @Column(name = "PictureDescription")
    private String pictureDescription;
    @Column(name = "CnSort")
    private String cnSort;
    @Column(name = "Sort")
    private Integer sort;
    @Column(name = "AttID")
    private String attId;
    @Column(name = "UserID")
    private String userId;
    @Column(name = "RowValue")
    private Integer rowValue;
    @Column(name = "CreateMan")
    private String createMan;
    @Column(name = "CreateTime")
    private Date createTime;
    @Column(name = "Size")
    private Integer size;
    @Column(name = "Type")
    private String type;

    public Integer getId(){return Id;}
    public void setId(Integer Id){this.Id=Id;}

    public String getAttached(){return attached;}
    public void setAttached(String attached){this.attached=attached;}

    public String getPath(){return path;}
    public void setPath(String path){this.path=path;}

    public String getPictureDescription(){return pictureDescription;}
    public void setPictureDescription(String pictureDescription){this.pictureDescription=pictureDescription;}

    public String getCnSort(){return cnSort;}
    public void setCnSort(String cnSort){this.cnSort=cnSort;}

    public Integer getSort(){return sort;}
    public void setSort(Integer sort){this.sort=sort;}

    public String getAttId(){return attId;}
    public void setAttId(String attId){this.attId=attId;}

    public String getUserId(){return userId;}
    public void setUserId(String userId){this.userId=userId;}

    public Integer getRowValue(){return rowValue;}
    public void setRowValue(Integer rowValue){this.rowValue=rowValue;}

    public String getCreateMan() {
        return createMan;
    }

    public void setCreateMan(String createMan) {
        this.createMan = createMan;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
