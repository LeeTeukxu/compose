package com.zhide.assist.services.implement;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.EntityHelper;
import com.zhide.assist.models.*;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.ApplicationInfoRepository;
import com.zhide.assist.repositorys.TechImproveDetailRepository;
import com.zhide.assist.repositorys.TechImproveMainRepository;
import com.zhide.assist.repositorys.tbTruthRepository;
import com.zhide.assist.services.define.IApplicationInfoService;
import com.zhide.assist.services.define.ISpecificService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class SpecificServiceImpl implements ISpecificService {

    @Autowired
    TechImproveMainRepository mainRepository;

    @Autowired
    TechImproveDetailRepository detailRepository;

    @Transactional(rollbackOn = Exception.class)
    @Override
    public TechImproveMainAndDetail Save(@Param(value = "MainData") TechImproveMain main, @Param(value = "DetailData") String DetailData, @Param(value = "Worky") String Worky, @Param(value = "TechMainID") String TechMainID, @Param(value = "SpecificNum") String SpecificNum) throws Exception {
        TechImproveMainAndDetail techImproveMainAndDetail = new TechImproveMainAndDetail();
        LoginUserInfo Info = CompanyContext.get();
        if (main == null || DetailData == null) throw new Exception("数据为空！");
        if (main.getSubId() == null) {
            main.setTechMainId(Integer.parseInt(TechMainID));
            main.setWorky(Worky);
            main.setCreateMan(Info.getUserIdValue());
            main.setCreateTime(new Date());
        }else {
            Optional<TechImproveMain> findOne = mainRepository.findBySubId(main.getSubId());
            if (findOne.isPresent()) {
                EntityHelper.copyObject(main, findOne.get());
                main.setWorky(Worky);
            }else throw new Exception("数据异常：" + main.getSubId() + "无法获取到数据！");
        }
        TechImproveMain techImproveMain = mainRepository.save(main);

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Map<String, Object> map = JSON.parseObject(DetailData);
        List<TechImproveDetail> listDetail = new ArrayList<>();
        for (int i=1;i<=Integer.parseInt(SpecificNum);i++) {
            TechImproveDetail detail = new TechImproveDetail();
            if (map.get("tinyId&" + i).equals("")) {
                detail.setImprove(map.get("improve&" + i).toString());
                detail.setTarget(map.get("target&" + i).toString());
                detail.setCode(i);
                detail.setMainId(techImproveMain.getSubId());
                detail.setCreateMan(Info.getUserIdValue());
                detail.setCreateTime(new Date());
                listDetail.add(detail);
            }else {
                Optional<TechImproveDetail> findOne = detailRepository.findByTinyId(Integer.parseInt(map.get("tinyId&" + i).toString()));
                if (findOne.isPresent()){
                    detail = findOne.get();
                    detail.setTinyId(Integer.parseInt(map.get("tinyId&" + i).toString()));
                    detail.setMainId(Integer.parseInt(map.get("mainId&" + i).toString()));
                    detail.setImprove(map.get("improve&" + i).toString());
                    detail.setTarget(map.get("target&" + i).toString());
                    detail.setCode(findOne.get().getCode());
                    detail.setCreateMan(Integer.parseInt(map.get("createMan&" + i).toString()));
                    detail.setCreateTime(simpleDateFormat.parse(map.get("createTime&" + i).toString()));
                    listDetail.add(detail);
                }else throw new Exception("数据异常：" + detail.getTinyId() + "无法获取到数据！");
            }
        }
        List<TechImproveDetail> listTechImproveDetail = detailRepository.saveAll(listDetail);
        techImproveMainAndDetail.setMain(techImproveMain);
        techImproveMainAndDetail.setListDetail(listTechImproveDetail);
        return techImproveMainAndDetail;
    }
}
