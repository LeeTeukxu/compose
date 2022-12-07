package com.zhide.assist.services.define;
import com.zhide.assist.models.tbIndependence;
import com.zhide.assist.models.tbMenuList;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import com.zhide.assist.common.pageObject;

public interface ItbIndependenceService {
    Optional<tbIndependence> findByuserIdAndDqExclusiveorderAndRowValue(int UserID,String DqExclusiveorder,int RowValue)throws Exception;

    tbIndependence Save(tbIndependence tbIndependence) throws Exception;

    void UpdateAttIDByGUIDANDDqExclusiveorder(int UserID,String DqObjectinvention,String DqTechnicalsolutions, String DqBeneficialeffect, String DqExclusiveorder,String DqNum,int RowValue) throws Exception;

    Optional<tbIndependence> deleteByUserIdAndDqExclusiveorderAndRowValue(int UserID,String DqExclusiveorder,int RowValue,Integer InId)throws  Exception;

    pageObject getDataWindow(Integer UserID,Integer RowValue)throws Exception;

    pageObject getClaimsType()throws Exception;

    List<tbIndependence>findC(int UserID,int DqExclusiveorder,int RowValue)throws Exception;

    Integer MaxOnlyId(Integer UserID, Integer RowValue)throws Exception;


    void UpdateDqExclusiveorderByUserIDANDInId(int UserID,int InId,int XGDqExclusiveorder,String DqExclusiveorder,int RowValu)throws  Exception;

    List<Map<String,Object>> getDqExorderlq(int UserID,int DqExclusiveorder,int RowValue)throws Exception;
}

