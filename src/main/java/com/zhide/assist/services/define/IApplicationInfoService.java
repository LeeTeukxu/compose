package com.zhide.assist.services.define;

import com.zhide.assist.models.TechMain;

public interface IApplicationInfoService {
    TechMain Save(TechMain techMain, String TechnologyID) throws Exception;
}
