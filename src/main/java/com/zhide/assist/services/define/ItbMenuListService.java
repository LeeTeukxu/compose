package com.zhide.assist.services.define;

import com.zhide.assist.models.tbMenuList;
import com.zhide.assist.models.tbTruthMenuList;

import java.util.List;

public interface ItbMenuListService {

    List<tbMenuList> getVisibleMenus();

    List<tbTruthMenuList> getVisibleTruthMenus();
}
