package com.zhide.assist.services.implement;

import com.zhide.assist.common.EntityHelper;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbBgtechnology;
import com.zhide.assist.models.tbTechnicalField;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbBgtechnologyRepository;
import com.zhide.assist.repositorys.tbTechnicalFieldRepository;
import com.zhide.assist.services.define.ItbBgtechnologyService;
import com.zhide.assist.services.define.ItbTechnicalFieldService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Optional;
import java.util.UUID;

@Service
public class tbBgtechnologyServiceImpl implements ItbBgtechnologyService {

    @Autowired
    tbBgtechnologyRepository tbBgtechnologyRepository;

    @Transactional
    @Override
    public tbBgtechnology Save(@Param(value = "Data") tbBgtechnology tbBgtechnology,@Param(value = "Content") String Content) throws Exception {
        LoginUserInfo Info = CompanyContext.get();
        if (tbBgtechnology==null) throw new Exception("数据为空！");
        if (tbBgtechnology.getId()==null){
            tbBgtechnology.setContent(Content);
            tbBgtechnology.setUserId(Info.getUserIdValue());
            tbBgtechnology.setRowValue(Info.getRowValue());
        }else {
            Optional<tbBgtechnology> find = tbBgtechnologyRepository.findById(tbBgtechnology.getId());
            if (find.isPresent()){
                tbBgtechnology.setContent(Content);
                EntityHelper.copyObject(tbBgtechnology,find.get());
            }else throw new Exception("数据异常:" + Integer.toString(tbBgtechnology.getId()) + "无法获取到数据!");
        }

        tbBgtechnology bgte = tbBgtechnologyRepository.save(tbBgtechnology);
        return bgte;
    }
}
