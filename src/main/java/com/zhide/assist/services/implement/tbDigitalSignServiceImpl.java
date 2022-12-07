package com.zhide.assist.services.implement;

import com.zhide.assist.common.EntityHelper;
import com.zhide.assist.models.GUID;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbDigitalSign;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbDigitalSignRepository;
import com.zhide.assist.services.define.ItbDigitalSignService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class tbDigitalSignServiceImpl implements ItbDigitalSignService {

    @Autowired
    tbDigitalSignRepository tbDigitalSignRepository;

    @Transactional
    @Override
    public tbDigitalSign Save(@Param(value = "Data") tbDigitalSign tbDigitalSign,HttpSession session) throws Exception {
        LoginUserInfo Info = CompanyContext.get();
        if (tbDigitalSign==null) throw new Exception("数据为空！");
        if (tbDigitalSign.getId()==null){
            tbDigitalSign.setRowValue(Info.getRowValue());
            tbDigitalSign.setUserId(Info.getUserId());
        }else {
            Optional<tbDigitalSign> find = tbDigitalSignRepository.findById(tbDigitalSign.getId());
            if (find.isPresent()){
                EntityHelper.copyObject(tbDigitalSign,find.get());
            }else throw new Exception("数据异常:" + Integer.toString(tbDigitalSign.getId()) + "无法获取到数据!");
        }

        tbDigitalSign digitalSign = tbDigitalSignRepository.save(tbDigitalSign);
        return digitalSign;
    }
}
