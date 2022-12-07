package com.zhide.assist.services.define;

import com.zhide.assist.models.TechImproveDetail;
import com.zhide.assist.models.TechImproveMain;
import com.zhide.assist.models.TechImproveMainAndDetail;
import com.zhide.assist.models.TechMain;

public interface ISpecificService {
    TechImproveMainAndDetail Save(TechImproveMain main, String DetailData, String Worky, String TechMainID, String SpecificNum) throws Exception;
}
