package com.zhide.assist.services.define;

import com.zhide.assist.common.pageObject;
import com.zhide.assist.models.TemplateConfig;
import com.zhide.assist.models.tbTemplate;
import com.zhide.assist.models.tbTemplateConfig;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface ItbTemplateService {
    pageObject getData(HttpServletRequest request) throws Exception;

    pageObject GetMyDownLoadData(HttpServletRequest request) throws Exception;

    tbTemplateConfig Save(TemplateConfig templateConfig, tbTemplate template, String TemplateID, String Mode, String KT, String JW) throws Exception;

    boolean remove(Integer id);

    boolean EnJoy(List<Integer> ids) throws Exception;

    boolean CancelEnJoy(List<Integer> ids) throws Exception;
}
