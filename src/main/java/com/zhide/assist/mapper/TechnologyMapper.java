package com.zhide.assist.mapper;


import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface TechnologyMapper {
    @Select(value = "SELECT * FROM View_TechnologyTemplate WHERE TechnologyID=#{TechnologyID}")
    Map<String, Object> getData(Integer TechnologyID);

    @Select(value = "SELECT * FROM View_TechnologyTree")
    List<Map<String, Object>> getDataTree();
}
