package com.zhide.assist.services.implement;

import com.zhide.assist.common.EntityHelper;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbAssitName;
import com.zhide.assist.models.tbTechnicalField;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbAssistNameRepository;
import com.zhide.assist.repositorys.tbTechnicalFieldRepository;
import com.zhide.assist.services.define.ItbAssistNameService;
import com.zhide.assist.services.define.ItbTechnicalFieldService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.Optional;
import java.util.UUID;

@Service
public class tbTechnicalFieldServiceImpl implements ItbTechnicalFieldService {

    @Autowired
    tbTechnicalFieldRepository tbTechnicalFieldRepository;

    @Transactional
    @Override
    public tbTechnicalField Save(@Param(value = "Data") tbTechnicalField tbTechnicalField,@Param(value = "TechnicalField") String TechnicalField) throws Exception {
         LoginUserInfo Info = CompanyContext.get();
        if (tbTechnicalField==null) throw new Exception("数据为空！");
        if (tbTechnicalField.getId()==null){
            tbTechnicalField.setUserId(Info.getUserIdValue());
            tbTechnicalField.setRowValue(Info.getRowValue());
        }else {
            Optional<tbTechnicalField> find = tbTechnicalFieldRepository.findById(tbTechnicalField.getId());
            if (find.isPresent()){
                EntityHelper.copyObject(tbTechnicalField,find.get());
            }else throw new Exception("数据异常:" + Integer.toString(tbTechnicalField.getId()) + "无法获取到数据!");
        }

        tbTechnicalField tech = tbTechnicalFieldRepository.save(tbTechnicalField);
        return tech;
    }

    @Transactional(rollbackOn = Exception.class)
    @Override
    public tbTechnicalField SaveTruthField(tbTechnicalField tbTechnicalField, String TechMainID) throws Exception {
        LoginUserInfo Info = CompanyContext.get();
        if (tbTechnicalField == null) throw new Exception("数据为空！");
        if (tbTechnicalField.getId() == null) {
            tbTechnicalField.setRowValue(Integer.parseInt(TechMainID));
            tbTechnicalField.setUserId(Info.getUserIdValue());
        }else {
            Optional<tbTechnicalField> findOne = tbTechnicalFieldRepository.findById(tbTechnicalField.getId());
            if (findOne.isPresent()) {
                EntityHelper.copyObject(tbTechnicalField, findOne.get());
            }else throw new Exception("数据异常：" + tbTechnicalField.getId() + "无法获取到数据！");
        }
        tbTechnicalField field = tbTechnicalFieldRepository.save(tbTechnicalField);
        return field;
    }
}
