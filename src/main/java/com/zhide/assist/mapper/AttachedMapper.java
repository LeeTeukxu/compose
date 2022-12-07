package com.zhide.assist.mapper;

import com.zhide.assist.models.tbAttached;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Map;

@Mapper
public interface AttachedMapper {

    @Select(value = "SELECT ID AS FID,0 AS PID,AttID,Attached,Sort,Path FROM tbAttached WHERE RowValue=#{TechMainID} AND Type=#{Type}")
    List<Map<String, Object>> getAllAttsByTechMainIDAndType(Integer TechMainID, String Type);
}
