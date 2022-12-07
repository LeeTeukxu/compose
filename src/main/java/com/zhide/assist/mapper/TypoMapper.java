package com.zhide.assist.mapper;

import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface TypoMapper {
    @Select(value = "Select * from v_Typo Where UserID=#{UserID}")
    List<Map<String, Object>> getData(Integer UserID);
}
