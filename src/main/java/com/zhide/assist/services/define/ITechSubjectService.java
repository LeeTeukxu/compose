package com.zhide.assist.services.define;

import com.zhide.assist.models.TechSubject;

public interface ITechSubjectService {
    TechSubject Save(String TechMainID, TechSubject techSubject) throws Exception;
}
