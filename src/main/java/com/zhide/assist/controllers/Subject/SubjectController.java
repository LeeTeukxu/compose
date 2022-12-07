package com.zhide.assist.controllers.Subject;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.successResult;
import com.zhide.assist.models.TechSubject;
import com.zhide.assist.models.tbTechnicalField;
import com.zhide.assist.repositorys.TechSubjectRepository;
import com.zhide.assist.repositorys.tbTechnicalFieldRepository;
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
@RequestMapping("/Subject")
public class SubjectController {

    @Autowired
    TechSubjectRepository techSubjectRepository;

    @Autowired
    tbTechnicalFieldRepository technicalFieldRepository;

    @Autowired
    ITechSubjectService iTechSubjectService;

    Logger logger = LoggerFactory.getLogger(SubjectController.class);

    @RequestMapping("/index")
    public String Index(String Mode, Integer TechMainID, Map<String, Object> model) {
        model.put("Mode", Mode);
        model.put("TechMainID", TechMainID);
        Optional<TechSubject> findOne = techSubjectRepository.findByTechMainId(TechMainID);
        if (findOne.isPresent()) {
            model.put("LoadData", JSON.toJSONString(findOne.get()));
        }else model.put("LoadData", "{}");
        Optional<tbTechnicalField> findTech = technicalFieldRepository.findByRowValue(TechMainID);
        if (findTech.isPresent()) {
            model.put("TechData", JSON.toJSONString(findTech.get()));
        }else model.put("TechData", "{}");
        return "/Truth/main/subject/index";
    }

    @RequestMapping("/save")
    @ResponseBody
    public successResult Save(HttpServletRequest request) {
        successResult result = new successResult();
        TechSubject subject = null;
        try {
            String Data = request.getParameter("Data");
            if (Strings.isEmpty(Data) == false) {
                String TechMainID = request.getParameter("TechMainID");
                TechSubject techSubject = JSON.parseObject(Data, TechSubject.class);
                subject = iTechSubjectService.Save(TechMainID, techSubject);
                result.setData(subject);
            }else throw new Exception("数据格式不正确！");
        }catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }
}
