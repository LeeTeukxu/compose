package com.zhide.assist.services.define;

import com.zhide.assist.models.TechSubject;
import com.zhide.assist.models.tbTechnicalField;

import javax.servlet.http.HttpSession;

public interface ItbTechnicalFieldService {
    tbTechnicalField Save(tbTechnicalField tbTechnicalField,String TechnicalField) throws Exception;
    tbTechnicalField SaveTruthField(tbTechnicalField tbTechnicalField, String TechMainID) throws Exception;
}
