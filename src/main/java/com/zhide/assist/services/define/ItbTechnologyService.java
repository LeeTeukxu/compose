package com.zhide.assist.services.define;

import com.zhide.assist.models.tbTechnology;
import com.zhide.assist.models.tbTechnologyTemplate;

import java.util.List;
import java.util.Map;

public interface ItbTechnologyService {

    List<tbTechnology> getAll();

    boolean SaveAll(List<Map<String, Object>> datas);

    boolean RemoveAll(List<Integer> ids);

    tbTechnologyTemplate SaveTemplate(tbTechnologyTemplate technologyTemplate, String TechnologyID) throws Exception;
}
