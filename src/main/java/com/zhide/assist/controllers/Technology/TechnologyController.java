package com.zhide.assist.controllers.Technology;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.successResult;
import com.zhide.assist.mapper.TechnologyMapper;
import com.zhide.assist.models.*;
import com.zhide.assist.repositorys.tbTechnologyRepository;
import com.zhide.assist.services.define.ItbTechnologyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Controller
@RequestMapping("/Technology")
@SimplePageName(name = "tbTechnology")
public class TechnologyController {

    @Autowired
    ItbTechnologyService itbTechnologyService;

    @Autowired
    TechnologyMapper technologyMapper;

    @Autowired
    tbTechnologyRepository technologyRepository;

    @RequestMapping("/edit")
    public String Edit(Map<String, Object> model) {
        return "/Truth/technology/edit";
    }

    @RequestMapping("/addTechnology")
    public String AddTechnology(String Mode, Map<String, Object> model) {
        List<Map<String, Object>> map = technologyMapper.getDataTree();
        model.put("Mode", Mode);
        model.put("DataTree", JSON.toJSONString(map));
        return "/Truth/technology/TechnologyField";
    }

    @RequestMapping("/getAll")
    @ResponseBody
    public List<tbTechnology> getAll() {
        return itbTechnologyService.getAll();
    }

    @Allow(permission = PermissionType.Save)
    @RequestMapping(value = "/saveAll", method = RequestMethod.POST)
    @ResponseBody
    public successResult SaveAll(@RequestBody List<Map<String, Object>> datas) {
        successResult result = new successResult();
        try {
            itbTechnologyService.SaveAll(datas);
        }catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping(value = "/removeAll", method = RequestMethod.POST)
    @ResponseBody
    public successResult RemoveAll(@RequestBody List<Integer> ids) {
        successResult result = new successResult();
        try {
            itbTechnologyService.RemoveAll(ids);
        }catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping("/editTemplate")
    public String EditTemplate(String TechnologyID, String Name, Map<String, Object> model) {
        Map<String, Object> map = technologyMapper.getData(Integer.parseInt(TechnologyID));
        model.put("Mode", "Edit");
        model.put("TechnologyID", TechnologyID);
        if (map != null && map.size() > 0) {
            model.put("Data", JSON.toJSONString(map));
        }else model.put("Data", "{}");
        return "/Truth/technology/template";
    }

    @RequestMapping("/saveTemplate")
    @ResponseBody
    public successResult SaveTemplate(HttpServletRequest request) {
        successResult result = new successResult();
        try {
            String Data = request.getParameter("Data");
            String TechnologyID = request.getParameter("TechnologyID");
            tbTechnologyTemplate technologyTemplate = JSON.parseObject(Data, tbTechnologyTemplate.class);
            tbTechnologyTemplate template = itbTechnologyService.SaveTemplate(technologyTemplate, TechnologyID);
            result.setData(template);
        }catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }
}
