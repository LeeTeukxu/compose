package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "tbTemplate")
public class tbTemplate implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer id;
    @Column(name = "TemplatePath")
    private String templatePath;
    @Column(name = "TemplateName")
    private String templateName;
    @Column(name = "TemplateDescription")
    private String templateDescription;
    @Column(name = "Level")
    private String level;
    @Column(name = "IsShare")
    private Integer isShare;
    @Column(name = "UploadUser")
    private String uploadUser;
    @Column(name = "UserID")
    private Integer userId;
    @Column(name = "UploadTime")
    private Date uploadTime;

    public Integer getId(){return id;}

    public void setId(Integer id){this.id=id;}

    public String getTemplatePath(){return templatePath;}

    public void setTemplatePath(String templatePath){this.templatePath=templatePath;}

    public String getTemplateName(){return templateName;}

    public void setTemplateName(String templateName){this.templateName=templateName;}

    public String getTemplateDescription(){return templateDescription;}

    public void setTemplateDescription(String templateDescription){this.templateDescription=templateDescription;}

    public String getLevel(){return level;}

    public void setLevel(String level){this.level=level;}

    public Integer getIsShare(){return isShare;}

    public void setIsShare(Integer isShare){this.isShare=isShare;}

    public String getUploadUser(){return uploadUser;}

    public void setUploadUser(String uploadUser){this.uploadUser=uploadUser;}

    public Integer getUserId(){return userId;}

    public void setUserId(Integer userId){this.userId=userId;}

    public Date getUploadTime(){return uploadTime;}

    public void setUploadTime(Date uploadTime){this.uploadTime=uploadTime;}
}
