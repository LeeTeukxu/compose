package com.zhide.assist.services.implement;

import com.zhide.assist.common.EntityHelper;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.TechMain;
import com.zhide.assist.models.TechSubject;
import com.zhide.assist.models.tbTruth;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.ApplicationInfoRepository;
import com.zhide.assist.repositorys.TechSubjectRepository;
import com.zhide.assist.repositorys.tbTruthRepository;
import com.zhide.assist.services.define.IApplicationInfoService;
import com.zhide.assist.services.define.ITechSubjectService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.Optional;

@Service
public class TechSubjectServiceImpl implements ITechSubjectService {

    @Autowired
    TechSubjectRepository techSubjectRepository;

    @Transactional(rollbackOn = Exception.class)
    @Override
    public TechSubject Save(@Param(value = "TechMainID") String TechMainID, @Param(value = "Data") TechSubject techSubject) throws Exception {
        LoginUserInfo loginUserInfo = CompanyContext.get();
        if (techSubject == null) throw new Exception("数据为空！");
        if (techSubject.getSubId() == null) {
            techSubject.setTechMainId(Integer.parseInt(TechMainID));
            techSubject.setCreateMan(loginUserInfo.getUserIdValue());
            techSubject.setCreateTime(new Date());
        }else {
            Optional<TechSubject> findOne = techSubjectRepository.findById(techSubject.getSubId());
            if (findOne.isPresent()) {
                EntityHelper.copyObject(techSubject, findOne.get());
            }else throw new Exception("数据异常：" + techSubject.getSubId() + "无法获取到数据！");
        }
        TechSubject subject = techSubjectRepository.save(techSubject);

        return subject;
    }
}
