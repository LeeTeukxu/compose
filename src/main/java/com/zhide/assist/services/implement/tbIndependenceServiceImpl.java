package com.zhide.assist.services.implement;
import com.zhide.assist.common.EntityHelper;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbAttached;
import com.zhide.assist.models.tbIndependence;
import com.zhide.assist.models.tbClaimsType;
import com.zhide.assist.repositorys.tbClaimsTypeRepository;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbIndependenceRepository;
import com.zhide.assist.services.define.ItbIndependenceService;
import com.zhide.assist.repositorys.tbDqExamplesRepository;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;
import com.zhide.assist.common.pageObject;
import com.zhide.assist.mapper.IndependenceMapper;

@Service
public class tbIndependenceServiceImpl implements ItbIndependenceService {

    @Autowired
    tbIndependenceRepository tbIndependenceRepository;

    @Autowired
    IndependenceMapper IndependenceMapper;

    @Autowired
    tbDqExamplesRepository tbDqExamplesRepository;

    @Autowired
    tbClaimsTypeRepository tbClaimsTypeRepository;

    @Transactional
    @Override
    public tbIndependence Save(tbIndependence tbIndependence) throws Exception {
        LoginUserInfo Info = CompanyContext.get();
        if (tbIndependence == null) throw new Exception("数据为空！");
        if (tbIndependence.getInId() == null) {
            tbIndependence.setUserId(Integer.parseInt(Info.getUserId()));
            tbIndependence.setRowValue(Info.getRowValue());
        } else {
            Optional<tbIndependence> find = tbIndependenceRepository.findById(tbIndependence.getInId());
            if (find.isPresent()) {
                EntityHelper.copyObject(tbIndependence, find.get());
            } else throw new Exception("数据异常:" + Integer.toString(tbIndependence.getInId()) + "无法获取到数据!");
        }
        tbIndependence bgte = tbIndependenceRepository.save(tbIndependence);
        return bgte;
    }

/*
    @Transactional
    @Override
    public int deleteAllByGuid(String GUID) throws Exception {
        int bgte = tbIndependenceRepository.deleteAllByGuid(GUID);
        return bgte;
    }*/

    @Transactional
    @Override
    public Optional<tbIndependence> deleteByUserIdAndDqExclusiveorderAndRowValue(int UserID,String DqExclusiveorder,int RowValue,Integer InId)throws Exception{
        int DqExclusiveorderInt=Integer.parseInt(DqExclusiveorder);
        Optional<tbIndependence> bgte = tbIndependenceRepository.deleteByUserIdAndDqExclusiveorderAndRowValue(UserID, DqExclusiveorder,RowValue);
        List<tbIndependence> list = tbIndependenceRepository.getDqExclusiveorderByUserIDANDRowValueAndRowValue(UserID,DqExclusiveorderInt,RowValue);
        //删除该权利要求下的所属实施例
        tbDqExamplesRepository.deleteAllByInid(InId);
        for (int i=0;i<list.size();i++){
            int pa=Integer.parseInt(list.get(i).getDqExclusiveorder())-1;
            tbIndependenceRepository.UpdateDqExclusiveorderByUserIDANDDqExclusiveorder(UserID, pa,list.get(i).getDqExclusiveorder(),RowValue);
        }
        return bgte;
    }

    @Transactional
    @Override
    public Optional<tbIndependence> findByuserIdAndDqExclusiveorderAndRowValue(int UserID,String DqExclusiveorder,int RowValue) throws Exception {
        Optional<tbIndependence> bgte = tbIndependenceRepository.findByuserIdAndDqExclusiveorderAndRowValue(UserID, DqExclusiveorder,RowValue);
        return bgte;
    }

    @Transactional
    @Override
    public List<Map<String,Object>> getDqExorderlq(int UserID,int DqExclusiveorder,int RowValue)throws Exception{
        List<Map<String,Object>> bgte=tbIndependenceRepository.getDqExorderlq(UserID,DqExclusiveorder,UserID);
        return  bgte;
    }

    @Transactional
    @Override
    public pageObject getDataWindow(Integer UserID,Integer RowValue)throws Exception{
        pageObject object = new pageObject();
        List<Map<String, Object>> datas = tbIndependenceRepository.getDataWindow(UserID,RowValue);
        int total = 0;
        if (datas.size() > 0) {
            total = Integer.parseInt(datas.get(0).get("DqExclusiveorder").toString());
            object.setTotal(total);
            object.setData(datas);
        }
        return object;
    }

    @Transactional
    @Override
    public pageObject getClaimsType()throws Exception{
        pageObject object = new pageObject();
        List<tbClaimsType> datas = tbClaimsTypeRepository.findAll();
        int total = 0;
        if (datas.size() > 0) {
            total = Integer.parseInt(datas.get(0).getClaimsId().toString());
            object.setTotal(total);
            object.setData(datas);
        }
        return object;
    }

    @Transactional
    @Override
    public Integer MaxOnlyId(Integer UserID,Integer RowValue)throws Exception{
        Integer Max=tbIndependenceRepository.MaxOnlyId(UserID,RowValue);
        return Max;
    }

    @Transactional
    @Override
    public List<tbIndependence>findC(int UserID,int DqExclusiveorder,int RowValue)throws Exception{
        List<tbIndependence>Cxtj=tbIndependenceRepository.getDqExclusiveorderByUserIDANDRowValueAndRowValue(UserID,DqExclusiveorder,RowValue);
        return  Cxtj;
    }

    @Transactional
    @Override
    public void UpdateDqExclusiveorderByUserIDANDInId(int UserID,int InId,int XGDqExclusiveorder,String DqExclusiveorder,int RowValue)throws  Exception{
          tbIndependenceRepository.UpdateDqExclusiveorderByUserIDANDInId(UserID,InId,XGDqExclusiveorder,DqExclusiveorder,RowValue);
    }

   @Transactional
    @Override
    public void UpdateAttIDByGUIDANDDqExclusiveorder(int UserID,String DqObjectinvention, String DqTechnicalsolutions, String DqBeneficialeffect, String DqExclusiveorder,String DqNum,int RowValue) {
        tbIndependenceRepository.UpdateSortByUserIDANDDqExclusiveorder(UserID,DqObjectinvention, DqTechnicalsolutions, DqBeneficialeffect, DqExclusiveorder,DqNum,RowValue);
    }


}
