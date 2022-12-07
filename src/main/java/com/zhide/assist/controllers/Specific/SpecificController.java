package com.zhide.assist.controllers.Specific;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.successResult;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.TechImproveDetail;
import com.zhide.assist.models.TechImproveMain;
import com.zhide.assist.models.TechImproveMainAndDetail;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.TechImproveDetailRepository;
import com.zhide.assist.repositorys.TechImproveMainRepository;
import com.zhide.assist.services.define.ISpecificService;
import org.apache.logging.log4j.util.Strings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/Specific")
public class SpecificController {

    Logger logger = LoggerFactory.getLogger(SpecificController.class);

    @Autowired
    ISpecificService specificService;

    @Autowired
    TechImproveMainRepository mainRepository;

    @Autowired
    TechImproveDetailRepository detailRepository;

    @RequestMapping("/index")
    public String Index(String Mode, Integer TechMainID, Map<String, Object> model) {
        model.put("Mode", Mode);
        model.put("TechMainID", TechMainID);
        Optional<TechImproveMain> findMain = mainRepository.findByTechMainId(TechMainID);
        if (findMain.isPresent()) {
            model.put("MainData", JSON.toJSONString(findMain.get()));
            List<TechImproveDetail> findDetail = detailRepository.findByMainIdIn(findMain.get().getSubId());
            if (findDetail.size() > 0) {
                model.put("DetailData", JSON.toJSONString(findDetail));
                model.put("specificNum", findDetail.size());
            }else {
                model.put("DetailData", "{}");
                model.put("specificNum", 1);
            }
        }else {
            model.put("MainData", "{}");
            model.put("DetailData", "{}");
            model.put("specificNum", 1);
        }
        return "/Truth/main/specific/index";
    }

    @RequestMapping("/save")
    @ResponseBody
    public successResult Save(HttpServletRequest request) {
        successResult result = new successResult();
        TechImproveMainAndDetail res = null;
        try {
            String MainData = request.getParameter("MainData");
            String DetailData = request.getParameter("DetailData");
            String Worky = request.getParameter("Worky");
            String TechMainID = request.getParameter("TechMainID");
            String SpecificNum = request.getParameter("SpecificNum");
            if (Strings.isEmpty(MainData) == false && Strings.isEmpty(DetailData) == false) {
                TechImproveMain main = JSON.parseObject(MainData, TechImproveMain.class);
                res = specificService.Save(main, DetailData, Worky, TechMainID, SpecificNum);
                result.setData(res);
            }
        }catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }
}
