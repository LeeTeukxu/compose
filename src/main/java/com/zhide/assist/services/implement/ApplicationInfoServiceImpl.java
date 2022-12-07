package com.zhide.assist.services.implement;

import com.zhide.assist.common.EntityHelper;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.TechMain;
import com.zhide.assist.models.tbTruth;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.ApplicationInfoRepository;
import com.zhide.assist.repositorys.tbTruthRepository;
import com.zhide.assist.services.define.IApplicationInfoService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.text.html.Option;
import javax.transaction.Transactional;
import java.util.Date;
import java.util.Optional;

@Service
public class ApplicationInfoServiceImpl implements IApplicationInfoService {

    @Autowired
    ApplicationInfoRepository applicationInfoRepository;

    @Autowired
    tbTruthRepository truthRepository;

    @Transactional(rollbackOn = Exception.class)
    @Override
    public TechMain Save(@Param(value = "Data") TechMain techMain, @Param(value = "TechnologyID") String TechnologyID) throws Exception {
        LoginUserInfo loginUserInfo = CompanyContext.get();
        if (techMain == null) throw new Exception("数据为空！");
        if (techMain.getId() == null) {
            techMain.setCreateMan(loginUserInfo.getUserIdValue());
            techMain.setCreateTime(new Date());
        }else {
            Optional<TechMain> findOne = applicationInfoRepository.findById(techMain.getId());
            if (findOne.isPresent()) {
                EntityHelper.copyObject(techMain, findOne.get());
            }else throw new Exception("数据异常：" + techMain.getId() + "无法获取到数据！");
        }
        TechMain main = applicationInfoRepository.save(techMain);

        tbTruth truth = new tbTruth();
        Optional<tbTruth> findTruth = truthRepository.findAllByTechMainId(main.getId());
        if (findTruth.isPresent()){
            truth = findTruth.get();
            truth.setUpdateTime(new Date());
        }else {
            truth.setDownloadNum(0);
            truth.setState(1);
            truth.setTechMainId(main.getId());
            truth.setTemplateId(Integer.parseInt(TechnologyID));
        }
        truthRepository.save(truth);
        return techMain;
    }
}
