package com.zhide.assist.mapper;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface TruthMapper {
    List<Map<String, Object>> getData(Map<String, Object> arguments);
}
