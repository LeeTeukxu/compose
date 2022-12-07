package com.zhide.assist.mapper;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface InstructionMapper {

//    @Select(value = "SELECT (CAST(TcOne AS NVARCHAR(max))+CAST(TechnicalField AS NVARCHAR(MAX))+CAST(TcTwo AS NVARCHAR(MAX))) AS Instruction FROM tbTechnicalField WHERE RowValue=#{RowValue} UNION ALL select (CAST(DqObjectinvention AS NVARCHAR(max))+CAST(DqTechnicalsolutions AS NVARCHAR(max))+CAST(DqBeneficialeffect AS NVARCHAR(MAX))) AS Instruction from tbIndependence AS a WHERE RowValue=#{RowValue} AND DqNum=1 AND DqExclusiveorder=1")
//    List<Map<String,Object>> FindTechAndInde(Integer RowValue);

    @Select(value="exec [SP_CS] '${C1}','${C2}','${C3}','${C4}',${RowValue}")
    String FindTechAndInde(String C1, String C2, String C3, String C4, Integer RowValue);
}
