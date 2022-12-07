package com.zhide.assist.models;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "tbTemplateConfig")
public class tbTemplateConfig implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID")
    private Integer id;
    @Column(name = "TemplateID")
    private Integer templateId;
    @Column(name = "Field")
    private String field;
    @Column(name = "FieldContent")
    private String fieldContent;

    public Integer getId(){return id;}

    public void setId(Integer id){this.id=id;}

    public Integer getTemplateId(){return templateId;}

    public void setTemplateId(Integer templateId){this.templateId=templateId;}

    public String getField(){return field;}

    public void setField(String field){this.field=field;}

    public String getFieldContent(){return fieldContent;}

    public void setFieldContent(String fieldContent){this.fieldContent=fieldContent;}
}
