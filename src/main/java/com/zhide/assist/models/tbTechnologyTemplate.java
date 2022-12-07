package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "tbTechnologyTemplate")
public class tbTechnologyTemplate implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "TechnologyTemplateID")
    private Integer technologyTemplateId;
    @Column(name = "TechnologyID")
    private Integer technologyId;
    @Column(name = "SubjectTemplate")
    private String subjectTemplate;
    @Column(name = "BackGroundTemplate")
    private String backGroundTemplate;
    @Column(name = "SpecificTemplate")
    private String specificTemplate;
    @Column(name = "CreateMan")
    private Integer createMan;
    @Column(name = "CreateTime")
    private Date createTime;

    public Integer getTechnologyTemplateId() {
        return technologyTemplateId;
    }

    public void setTechnologyTemplateId(Integer technologyTemplateId) {
        this.technologyTemplateId = technologyTemplateId;
    }

    public Integer getTechnologyId() {
        return technologyId;
    }

    public void setTechnologyId(Integer technologyId) {
        this.technologyId = technologyId;
    }

    public String getSubjectTemplate() {
        return subjectTemplate;
    }

    public void setSubjectTemplate(String subjectTemplate) {
        this.subjectTemplate = subjectTemplate;
    }

    public String getBackGroundTemplate() {
        return backGroundTemplate;
    }

    public void setBackGroundTemplate(String backGroundTemplate) {
        this.backGroundTemplate = backGroundTemplate;
    }

    public String getSpecificTemplate() {
        return specificTemplate;
    }

    public void setSpecificTemplate(String specificTemplate) {
        this.specificTemplate = specificTemplate;
    }

    public Integer getCreateMan() {
        return createMan;
    }

    public void setCreateMan(Integer createMan) {
        this.createMan = createMan;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}
