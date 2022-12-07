package com.zhide.assist.mapper;

import com.zhide.assist.models.IndeTypo;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbIndependence;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

@Mapper
public interface IndependenceMapper {
    @Select(value = "select * from tbIndependence where GUID=#{GUID}")
    List<Map<String,Object>> ByGuid(String GUID);

    @Select(value = "SELECT * FROM tbIndependence WHERE RowValue=#{RowValue} ORDER BY CONVERT(INT,DqExclusiveorder) ASC")
    List<tbIndependence> findAllByRowValueOrderByDqExclusiveorderAsc(Integer RowValue);

    @Select(value = "SELECT InId,DqTechnicalsolutions,DqExclusiveorder,DqNum FROM tbIndependence WHERE RowValue=#{RowValue} ORDER BY CONVERT(INT,DqExclusiveorder) ASC")
    List<Map<String,Object>> GetTechAndExcByRowValueOrderByDqExclusiveorderAsc(Integer RowValue);
}
