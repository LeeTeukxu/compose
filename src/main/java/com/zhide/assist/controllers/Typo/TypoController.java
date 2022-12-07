package com.zhide.assist.controllers.Typo;


import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.successResult;
import com.zhide.assist.mapper.TypoMapper;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbMemo;
import com.zhide.assist.models.tbTypo;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.services.define.ItbTypoService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/Typo")
public class TypoController {

    Logger logger = LoggerFactory.getLogger(TypoController.class);

    @Autowired
    TypoMapper typoMapper;

    @Autowired
    ItbTypoService typoService;

    @RequestMapping("/index")
    public String Index(Map<String,Object> model){
        LoginUserInfo Info = CompanyContext.get();
        model.put("UserID", Info.getUserId());
        return "/Typo/index";
    }

    @RequestMapping("/getTypoData")
    @ResponseBody
    public List<Map<String, Object>> getTypoData(Integer UserID) {
        return typoMapper.getData(UserID);
    }

    @RequestMapping("/saveTypo")
    @ResponseBody
    public successResult SaveTypo(String Data) {
        successResult result = new successResult();
        try {
            List<tbTypo> items = JSON.parseArray(Data, tbTypo.class);
            typoService.SaveAll(items);
        } catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/removeTypo")
    public successResult RemoveTypo(Integer UserID, Integer ID) {
        successResult result = new successResult();
        try {
            boolean X = typoService.Remove(UserID, ID);
            result.setSuccess(X);
        } catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }
}
