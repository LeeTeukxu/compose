package com.zhide.assist.mapper;

import com.zhide.assist.models.tbMemo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface TruthMemoMapper {
    @Select(value = "Select * from v_TruthMemo Where TruthID=#{TruthID}")
    List<Map<String, Object>> getData(Integer TruthID);

    List<tbMemo> getAllByIds(List<String> ids);
}
