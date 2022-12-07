package com.zhide.assist.controllers.TechnicalField;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.successResult;
import com.zhide.assist.models.*;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.*;
import com.zhide.assist.services.define.ItbTechnicalFieldService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/TechnicalField")
public class TechnicalFieldController {

    @Autowired
    tbTechnicalFieldRepository technicalFieldRepository;

    @Autowired
    ItbTechnicalFieldService itbTechnicalFieldService;

    @Autowired
    tbAttachedRepository attachedRepository;

    @Autowired
    tbDigitalSignRepository digitalSignRepository;

    @Autowired
    tbAssistNameRepository assistNameRepository;

    @Autowired
    tbTemplateConfigRepository templateConfigRepository;

    @Autowired
    tbTypoRepository typoRepository;

    @RequestMapping("/index")
    public String Index(HttpSession session,Map<String,Object> model){
        LoginUserInfo Info = CompanyContext.get();
        List<tbAssitName> listAssistName= assistNameRepository.findAllById(Info.getRowValue());
        List<tbAttached> list = new ArrayList<>();
        Optional<tbTechnicalField> findTechnicalField = null;
        Optional<tbDigitalSign> findDigitalSign = null;
        if (Info.getRowValue() != 0){
            list = attachedRepository.getAllByRowValueOrderBySort(Info.getRowValue());
            findDigitalSign = digitalSignRepository.findByRowValue(Info.getRowValue());
            findTechnicalField = technicalFieldRepository.findByRowValue(Info.getRowValue());
        }
        model.put("RowValue", Info.getRowValue());
        model.put("Pictuers",list);
        if (findDigitalSign!=null && findDigitalSign.isPresent()) {
            model.put("DigitalSign", JSON.toJSONString(findDigitalSign.get()));
            model.put("DigitalSignid", findDigitalSign.get().getId());
        }else {
            model.put("DigitalSign", "{}");
            model.put("DigitalSignid", "{}");
        }
        if (findTechnicalField != null && findTechnicalField.isPresent()){
            model.put("TechnicalField",JSON.toJSONString(findTechnicalField.get()));
        }else model.put("TechnicalField","{}");
        if (listAssistName.size()>0){
            model.put("AssistName",listAssistName.get(0).getAssistName());
        }else model.put("AssistName","{}");
        model.put("PicNum",list.size());
        model.put("ListPic",JSON.toJSONString(list));
        tbAssitName assitName = listAssistName.stream().filter(x -> x.getId().equals(Info.getRowValue())).findFirst().get();
        List<tbTemplateConfig> listTemplateConfig = templateConfigRepository.findAllByTemplateId(assitName.getTemplateId());
        listTemplateConfig.stream().forEach(x -> {
            if (x.getField().equals("JiShuLingYuOne")){
                model.put("JiShuLingYuOne",x.getFieldContent());
            }else model.put("JiShuLingYuOne","发明");
        });
        List<Map<String,Object>> findTypo = typoRepository.finByUID(Info.getUserIdValue());
        if (findTypo.size() > 0){
            model.put("TypoData",JSON.toJSONString(findTypo));
        }else model.put("TypoData","{}");
        model.put("userid", Info.getUserId());

        return "/TechnicalField/index";
    }

    @RequestMapping("/save")
    @ResponseBody
    public successResult Save(HttpServletRequest request){
        successResult result = new successResult();
        tbTechnicalField res=null;
        try {
            String Data = request.getParameter("Data");
            String TcOne = request.getParameter("TcOne");
            String TechnicalField = request.getParameter("TechnicalField");
            String TcTwo = request.getParameter("TcTwo");
            if (Strings.isEmpty(Data)==false){
                tbTechnicalField tbTechnicalField = JSON.parseObject(Data,tbTechnicalField.class);
                tbTechnicalField.setTcOne(TcOne);
                tbTechnicalField.setTechnicalField(TechnicalField);
                tbTechnicalField.setTcTwo(TcTwo);
                res = itbTechnicalFieldService.Save(tbTechnicalField,TechnicalField);
                result.setData(res);
            } else throw new Exception("数据格式不正确！");
        }
        catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping("/saveTruthField")
    @ResponseBody
    public successResult SaveTruthField(HttpServletRequest request) {
        successResult result = new successResult();
        tbTechnicalField res = null;
        try {
            String Data = request.getParameter("Data");
            if (Strings.isEmpty(Data) == false) {
                tbTechnicalField technicalField = JSON.parseObject(Data, tbTechnicalField.class);
                String TechMainID = request.getParameter("TechMainID");
                res = itbTechnicalFieldService.SaveTruthField(technicalField, TechMainID);
                result.setData(res);
            }else throw new Exception("数据格式不正确！");
        }catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }
}
