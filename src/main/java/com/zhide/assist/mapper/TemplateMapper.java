package com.zhide.assist.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface TemplateMapper {
    List<Map<String, Object>> getData(Map<String, Object> arguments);

    List<Map<String, Object>> GetMyDownLoadData(Map<String, Object> arguments);
}
