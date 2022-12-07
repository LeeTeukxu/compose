package com.zhide.assist.services.implement;

import com.zhide.assist.mapper.AllUserListMapper;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbIndependence;
import com.zhide.assist.services.define.ItbDqExamplesService;
import org.springframework.beans.factory.annotation.Autowired;
import com.zhide.assist.repositorys.tbDqExamplesRepository;
import org.springframework.stereotype.Service;
import com.zhide.assist.models.tbDqExamples;

import java.util.List;
import java.util.Map;
import java.util.Optional;

@Service
public class tbDqExamplesServiceImpl implements ItbDqExamplesService {

    @Autowired
    tbDqExamplesRepository tbDqExamplesRepository;
   public void UpdateDqExamplesName(int EpId, String DqExamples){
       tbDqExamplesRepository.UpdateDqExamplesName(EpId,DqExamples);
    }
    public tbDqExamples Save(tbDqExamples tbDqExamples){
        tbDqExamples bgte = tbDqExamplesRepository.save(tbDqExamples);
        return  bgte;
    }

    public void deleteByEpId(Integer EpId){
       /*,Integer RowValue,Integer OrderNum*/
      tbDqExamplesRepository.deleteByEpId(EpId);
/*        List<tbDqExamples> list = tbDqExamplesRepository.finddeleorder(RowValue,OrderNum);
        for (int i=0;i<list.size();i++){
            int xgOrderNum=list.get(i).getOrderNum()-1;
            tbDqExamplesRepository.Updatedelhssl(xgOrderNum,list.get(i).getOrderNum(),RowValue);
        }*/
    }
}
