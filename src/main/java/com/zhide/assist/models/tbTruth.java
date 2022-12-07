package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "tbTruth")
public class tbTruth implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "TruthID")
    private Integer truthId;
    @Column(name = "DownloadNum")
    private Integer downloadNum;
    @Column(name = "DownloadTime")
    private Date downloadTime;
    @Column(name = "State")
    private Integer state;
    @Column(name = "UpdateTime")
    private Date updateTime;
    @Column(name = "FontSize")
    private Integer fontSize;
    @Column(name = "TechMainID")
    private Integer techMainId;
    @Column(name = "TemplateID")
    private Integer templateId;

    public Integer getTruthId() {
        return truthId;
    }

    public void setTruthId(Integer truthId) {
        this.truthId = truthId;
    }

    public Integer getDownloadNum() {
        return downloadNum;
    }

    public void setDownloadNum(Integer downloadNum) {
        this.downloadNum = downloadNum;
    }

    public Date getDownloadTime() {
        return downloadTime;
    }

    public void setDownloadTime(Date downloadTime) {
        this.downloadTime = downloadTime;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Integer getFontSize() {
        return fontSize;
    }

    public void setFontSize(Integer fontSize) {
        this.fontSize = fontSize;
    }

    public Integer getTechMainId() {
        return techMainId;
    }

    public void setTechMainId(Integer techMainId) {
        this.techMainId = techMainId;
    }

    public Integer getTemplateId() {
        return templateId;
    }

    public void setTemplateId(Integer templateId) {
        this.templateId = templateId;
    }
}
