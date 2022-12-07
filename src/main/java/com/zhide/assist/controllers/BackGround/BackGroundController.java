package com.zhide.assist.controllers.BackGround;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.successResult;
import com.zhide.assist.models.TechBackground;
import com.zhide.assist.models.TechSubject;
import com.zhide.assist.repositorys.TechBackgroundRepository;
import com.zhide.assist.repositorys.TechSubjectRepository;
import com.zhide.assist.services.define.ITechBackgroundService;
import com.zhide.assist.services.define.ITechSubjectService;
import org.apache.logging.log4j.util.Strings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/BackGround")
public class BackGroundController {

    @Autowired
    TechBackgroundRepository techBackgroundRepository;

    @Autowired
    ITechBackgroundService iTechBackgroundService;

    Logger logger = LoggerFactory.getLogger(BackGroundController.class);

    @RequestMapping("/index")
    public String Index(String Mode, Integer TechMainID, Map<String, Object> model) {
        model.put("Mode", Mode);
        model.put("TechMainID", TechMainID);
        Optional<TechBackground> findOne = techBackgroundRepository.findByTechMainId(TechMainID);
        if (findOne.isPresent()) {
            model.put("LoadData", JSON.toJSONString(findOne.get()));
        }else model.put("LoadData", "{}");
        return "/Truth/main/background/index";
    }

    @RequestMapping("/save")
    @ResponseBody
    public successResult Save(HttpServletRequest request) {
        successResult result = new successResult();
        TechBackground background = null;
        try {
            String Data = request.getParameter("Data");
            if (Strings.isEmpty(Data) == false) {
                String TechMainID = request.getParameter("TechMainID");
                TechBackground techBackground = JSON.parseObject(Data, TechBackground.class);
                background = iTechBackgroundService.Save(TechMainID, techBackground);
                result.setData(background);
            }else throw new Exception("数据格式不正确！");
        }catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }

}
