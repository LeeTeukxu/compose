package com.zhide.assist.services.define;

import com.zhide.assist.models.TechBackground;

public interface ITechBackgroundService {
    TechBackground Save(String TechMainID, TechBackground techBackground) throws Exception;
}
