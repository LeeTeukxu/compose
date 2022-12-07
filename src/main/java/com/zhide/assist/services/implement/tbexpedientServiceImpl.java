package com.zhide.assist.services.implement;
import com.zhide.assist.common.EntityHelper;
import com.zhide.assist.models.tbIndependence;
import com.zhide.assist.models.tbexpedient;
import com.zhide.assist.repositorys.tbexpedientRepository;
import com.zhide.assist.services.define.ItbexpedientService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.Optional;
import java.util.UUID;

@Service
public class tbexpedientServiceImpl implements ItbexpedientService {

    @Autowired
    tbexpedientRepository tbexpedientRepository;

    @Transactional
    @Override
    public tbexpedient Save(tbexpedient tbexpedient, HttpSession session) throws Exception {
/*        if (tbexpedient == null) throw new Exception("数据为空！");
        if (tbexpedient.getexId() == null) {
            tbexpedient.setGuid(session.getAttribute("GUID").toString());
        } else {
            Optional<tbexpedient> find = tbexpedientRepository.findById(tbexpedient.getexId());
            if (find.isPresent()) {
                EntityHelper.copyObject(tbexpedient, find.get());
            } else throw new Exception("数据异常:" + Integer.toString(tbexpedient.getexId()) + "无法获取到数据!");
        }*/

        tbexpedient bgte = tbexpedientRepository.save(tbexpedient);
        return bgte;
    }

    @Transactional
    @Override
    public boolean deleteAllByGuid(String GUID) throws Exception {
        tbexpedientRepository.deleteAllByGuid(GUID);
        return true;
    }

    @Transactional
    @Override
    public  Optional<tbexpedient> findByGuidAndCqexpedientorder(String GUID, String CqExclusiveorder) throws Exception {
        Optional<tbexpedient> bgte = tbexpedientRepository.findByGuidAndCqexpedientorder(GUID, CqExclusiveorder);
        return bgte;
    }

/*    @Transactional
    @Override
    public void UpdateByGUIDANDCqexpedientorder(int InId,String GUID, String CqTechnicalsolutions, String CqBeneficialeffect, String CqExamples, String Cqexpedientorder) throws Exception{
        tbexpedientRepository.UpdateByGUIDANDCqexpedientorder(GUID,InId,CqTechnicalsolutions,CqBeneficialeffect,CqExamples,Cqexpedientorder);
    }*/
}
