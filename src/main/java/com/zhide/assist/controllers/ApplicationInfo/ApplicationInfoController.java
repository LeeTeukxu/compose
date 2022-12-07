package com.zhide.assist.controllers.ApplicationInfo;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.successResult;
import com.zhide.assist.models.TechMain;
import com.zhide.assist.repositorys.ApplicationInfoRepository;
import com.zhide.assist.services.define.IApplicationInfoService;
import org.apache.logging.log4j.util.Strings;
import org.apache.xpath.operations.Mod;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/ApplicationInfo")
public class ApplicationInfoController {

    Logger logger = LoggerFactory.getLogger(ApplicationInfoController.class);

    @Autowired
    IApplicationInfoService applicationInfoService;

    @Autowired
    ApplicationInfoRepository applicationInfoRepository;

    @RequestMapping("/index")
    public String Index(String Mode, Integer TechMainID, String TechnologyID, Map<String, Object> model) {
        model.put("Mode", Mode);
        Optional<TechMain> findOne = applicationInfoRepository.findById(TechMainID);
        if (findOne.isPresent()) {
            model.put("LoadData", JSON.toJSONString(findOne.get()));
        }else model.put("LoadData", "{}");
        model.put("TechnologyID", TechnologyID);
        return "/Truth/main/applicationInfo/index";
    }

    @RequestMapping("/save")
    @ResponseBody
    public successResult Save(HttpServletRequest request, HttpSession session) {
        successResult result = new successResult();
        TechMain main = null;
        try {
            String Data = request.getParameter("Data");
            String TechnologyID = request.getParameter("TechnologyID");
            if (Strings.isEmpty(Data) == false) {
                TechMain techMain = JSON.parseObject(Data, TechMain.class);
                main = applicationInfoService.Save(techMain, TechnologyID);
                result.setData(main);
            }else throw new Exception("数据格式不正确！");
        }catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }
}
