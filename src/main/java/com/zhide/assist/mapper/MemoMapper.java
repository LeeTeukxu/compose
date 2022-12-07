package com.zhide.assist.mapper;

import com.zhide.assist.models.tbMemo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface MemoMapper {
    @Select(value = "Select * from v_Memo Where ProductID=#{ProductID}")
    List<Map<String, Object>> getData(String ProductID);

    List<tbMemo> getAllByIds(List<String> ids);
}
