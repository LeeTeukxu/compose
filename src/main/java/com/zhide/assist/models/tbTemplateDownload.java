package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "tbTemplateDownload")
public class tbTemplateDownload implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer id;
    @Column(name = "AssistNameID")
    private Integer assistNameId;
    @Column(name = "TemplateID")
    private Integer templateId;
    @Column(name = "DownloadNum")
    private Integer downloadNum;
    @Column(name = "DownloadTime")
    private Date downloadTime;
    @Column (name = "UserID")
    private Integer userId;

    public Integer getId(){return id;}

    public void setId(Integer id){this.id=id;}

    public Integer getAssistNameId(){return assistNameId;}

    public void setAssistNameId(Integer assistNameId){this.assistNameId=assistNameId;}

    public Integer getTemplateId(){return templateId;}

    public void setTemplateId(Integer templateId){this.templateId=templateId;}

    public Integer getDownloadNum(){return downloadNum;}

    public void setDownloadNum(Integer downloadNum){this.downloadNum=downloadNum;}

    public Date getDownloadTime(){return downloadTime;}

    public void setDownloadTime(Date downloadTime){this.downloadTime=downloadTime;}

    public Integer getUserId(){return userId;}

    public void setUserId(Integer userId){this.userId=userId;}
}
