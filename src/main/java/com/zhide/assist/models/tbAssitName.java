package com.zhide.assist.models;

import com.spire.ms.System.DateTime;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "tbAssitName")
public class tbAssitName implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer id;
    @Column(name = "AssistName")
    private String assistName;
    @Column(name = "Exception")
    private String exception;
    @Column(name = "TemplateID")
    private Integer templateId;
    @Column(name = "DownloadNum")
    private Integer downloadNum;
    @Column(name = "DownloadFiveNum")
    private Integer downloadFiveNum;
    @Column(name = "DownloadTime")
    private Date downloadTime;
    @Column(name = "State")
    private Integer state;
    @Column(name = "UserID")
    private String userId;
    @Column(name = "AddTime")
    private Date addTime;
    @Column(name = "UpdateTime")
    private Date updateTime;
    @Column(name = "Fontsize")
    private Integer fontsize;

    public Integer getId(){return id;}
    public void setId(Integer id){this.id=id;}

    public String getAssistName(){return assistName;}
    public void setAssistName(String assistName){this.assistName=assistName;}

    public Integer getTemplateId(){return templateId;}
    public void setTemplateId(Integer templateId){this.templateId=templateId;}

    public Integer getDownloadNum(){return downloadNum;}
    public void setDownloadNum(Integer downloadNum){this.downloadNum=downloadNum;}

    public Integer getDownloadFiveNum(){return downloadFiveNum;}
    public void setDownloadFiveNum(Integer downloadFiveNum){this.downloadFiveNum=downloadFiveNum;}

    public Date getDownloadTime(){return downloadTime;}
    public void setDownloadTime(Date downloadTime){this.downloadTime=downloadTime;}

    public Integer getState(){return state;}
    public void setState(Integer state){this.state=state;}

    public String getException(){return exception;}
    public void setException(String exception){this.exception=exception;}

    public String getUserId(){return userId;}
    public void setUserId(String userId){this.userId=userId;}

    public Date getAddTime(){return addTime;}
    public void setAddTime(Date addTime){this.addTime=addTime;}

    public Date getUpdateTime(){return updateTime;}
    public void setUpdateTime(Date updateTime){this.updateTime=updateTime;}

    public Integer getFontsize(){return fontsize;}
    public void setFontsize(Integer fontsize){this.fontsize=fontsize;}
}
