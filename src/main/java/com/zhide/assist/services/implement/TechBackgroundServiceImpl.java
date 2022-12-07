package com.zhide.assist.services.implement;

import com.zhide.assist.common.EntityHelper;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.TechBackground;
import com.zhide.assist.models.TechSubject;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.TechBackgroundRepository;
import com.zhide.assist.repositorys.TechSubjectRepository;
import com.zhide.assist.services.define.ITechBackgroundService;
import com.zhide.assist.services.define.ITechSubjectService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Date;
import java.util.Optional;

@Service
public class TechBackgroundServiceImpl implements ITechBackgroundService {

    @Autowired
    TechBackgroundRepository techBackgroundRepository;

    @Transactional(rollbackOn = Exception.class)
    @Override
    public TechBackground Save(@Param(value = "TechMainID") String TechMainID, @Param(value = "Data") TechBackground techBackground) throws Exception {
        LoginUserInfo loginUserInfo = CompanyContext.get();
        if (techBackground == null) throw new Exception("数据为空！");
        if (techBackground.getSubId() == null) {
            techBackground.setTechMainId(Integer.parseInt(TechMainID));
            techBackground.setCreateMan(loginUserInfo.getUserIdValue());
            techBackground.setCreateTime(new Date());
        }else {
            Optional<TechBackground> findOne = techBackgroundRepository.findById(techBackground.getSubId());
            if (findOne.isPresent()) {
                EntityHelper.copyObject(techBackground, findOne.get());
            }else throw new Exception("数据异常：" + techBackground.getSubId() + "无法获取到数据！");
        }
        TechBackground background = techBackgroundRepository.save(techBackground);

        return background;
    }
}
