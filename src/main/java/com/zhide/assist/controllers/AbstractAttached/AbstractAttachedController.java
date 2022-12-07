package com.zhide.assist.controllers.AbstractAttached;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.FTPUtil;
import com.zhide.assist.common.successResult;
import com.zhide.assist.models.*;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbAbstractAttachedRepository;
import com.zhide.assist.repositorys.tbAttachedRepository;
import com.zhide.assist.repositorys.tbDigitalSignRepository;
import com.zhide.assist.services.define.ItbAbstractAttachedService;
import com.zhide.assist.services.define.ItbBgtechnologyService;
import freemarker.core.XMLOutputFormat;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import org.apache.logging.log4j.util.Strings;
import org.omg.CORBA.OBJECT_NOT_EXIST;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/AbstractAttached")
public class AbstractAttachedController {

    @Autowired
    tbAbstractAttachedRepository abstractAttachedRepository;

    @Autowired
    ItbAbstractAttachedService itbAbstractAttachedService;

    @Autowired
    tbAttachedRepository attachedRepository;

    @Autowired
    tbDigitalSignRepository digitalSignRepository;

    @RequestMapping("/index")
    public String Index(HttpSession session,Map<String, Object> model){
        LoginUserInfo Info = CompanyContext.get();
        List<tbAttached> list = new ArrayList<>();
        Optional<tbAbstractAttached> findAbstractAttached = null;
        Optional<tbDigitalSign> findDigitalSign = null;
        if (Info.getRowValue() != 0){
            list = attachedRepository.getAllByRowValueOrderBySort(Info.getRowValue());
            findAbstractAttached = abstractAttachedRepository.findByRowValue(Info.getRowValue());
            findDigitalSign = digitalSignRepository.findByRowValue(Info.getRowValue());
        }
        model.put("RowValue",Info.getRowValue());
        model.put("Pictuers",list);
        if (findAbstractAttached!=null && findAbstractAttached.isPresent()) {
            model.put("AbstractAttached", JSON.toJSONString(findAbstractAttached.get()));

        }else {
            model.put("AbstractAttached", "{}");
        }
        if (findDigitalSign!=null && findDigitalSign.isPresent()) {
            model.put("DigitalSign", JSON.toJSONString(findDigitalSign.get()));
            model.put("DigitalSignid", findDigitalSign.get().getId());
        }else {
            model.put("DigitalSign", "{}");
            model.put("DigitalSignid", "{}");
        }
        model.put("PicNum",list.size());
        model.put("ListPic",JSON.toJSONString(list));
        model.put("userid", Info.getUserId());
        return "/AbstractAttached/index";
    }

    @RequestMapping(value = "/zhaiyao",method = RequestMethod.POST)
    @ResponseBody
    public successResult ZhaiYao(@RequestBody List<String> ids,HttpSession session){
        successResult result = new successResult();
        try {
            itbAbstractAttachedService.zhaiyao(ids,session);
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }
}
