package com.zhide.assist.controllers.Bgtechnology;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.successResult;
import com.zhide.assist.models.*;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.*;
import com.zhide.assist.services.define.ItbBgtechnologyService;
import com.zhide.assist.services.define.ItbTechnicalFieldService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/Bgtechnology")
public class BgechnologyController {

    @Autowired
    ItbBgtechnologyService itbBgtechnologyService;

    @Autowired
    tbAttachedRepository attachedRepository;

    @Autowired
    tbDigitalSignRepository digitalSignRepository;

    @Autowired
    tbBgtechnologyRepository bgtechnologyRepository;

    @Autowired
    tbTypoRepository typoRepository;

    @RequestMapping("/index")
    public String Index(Map<String,Object> model){
        LoginUserInfo Info = CompanyContext.get();
        List<tbAttached> list = new ArrayList<>();
        Optional<tbBgtechnology> findBgtechnology = null;
        Optional<tbDigitalSign> findDigitalSign = null;
        if (Info.getRowValue() != 0){
            list = attachedRepository.getAllByRowValueOrderBySort(Info.getRowValue());
            findDigitalSign = digitalSignRepository.findByRowValue(Info.getRowValue());
            findBgtechnology = bgtechnologyRepository.findByRowValue(Info.getRowValue());
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
        if (findBgtechnology!=null && findBgtechnology.isPresent()){
            model.put("Bgtechnology",JSON.toJSONString(findBgtechnology.get()));
        }else model.put("Bgtechnology","{}");
        model.put("PicNum",list.size());
        model.put("ListPic",JSON.toJSONString(list));
        model.put("userid", Info.getUserId());
        List<Map<String,Object>> findTypo = typoRepository.finByUID(Info.getUserIdValue());
        if (findTypo.size() > 0){
            model.put("TypoData",JSON.toJSONString(findTypo));
        }else model.put("TypoData","{}");
        return "/Bgtechnology/index";
    }

    @RequestMapping("/save")
    @ResponseBody
    public successResult Save(HttpServletRequest request){
        successResult result = new successResult();
        tbBgtechnology res=null;
        tbBgtechnology tbBgtechnology = new tbBgtechnology();
        try {
            String Data = request.getParameter("Data");
            String Content = request.getParameter("Content");
            if (Strings.isEmpty(Data)==false){
                tbBgtechnology tbTechnicalField = JSON.parseObject(Data,tbBgtechnology.class);
                res = itbBgtechnologyService.Save(tbTechnicalField,Content);
                result.setData(res);
            } else throw new Exception("数据格式不正确！");
        }
        catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }
}
