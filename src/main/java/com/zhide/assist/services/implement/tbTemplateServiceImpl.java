package com.zhide.assist.services.implement;

import com.alibaba.fastjson.JSON;
import com.spire.doc.Template;
import com.zhide.assist.common.EntityHelper;
import com.zhide.assist.common.pageObject;
import com.zhide.assist.mapper.TemplateMapper;
import com.zhide.assist.models.*;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbTemplateConfigRepository;
import com.zhide.assist.repositorys.tbTemplateRepository;
import com.zhide.assist.services.define.ItbTemplateService;
import com.zhide.assist.services.sqlParameterCreator;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.lang.reflect.Field;
import java.util.*;

@Service
public class tbTemplateServiceImpl implements ItbTemplateService {
    @Autowired
    TemplateMapper templateMapper;

    @Autowired
    tbTemplateConfigRepository templateConfigRepository;

    @Autowired
    tbTemplateRepository templateRepository;


    @Override
    public pageObject getData(HttpServletRequest request) throws Exception {
        pageObject object = new pageObject();
        Map<String,Object> params = getParams(request);
        List<Map<String,Object>> datas = templateMapper.getData(params);
        int Total = 0;
        List<Map<String,Object>> PP = new ArrayList<>();
        if (datas.size() > 0){
            Total = Integer.parseInt(datas.get(0).get("_TotalNum").toString());
            object.setTotal(Total);
            object.setData(datas);
        }
        return object;
    }

    private Map<String,Object> getParams(HttpServletRequest request) throws Exception{
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        String sortOrder = request.getParameter("sortOrder");
        if (sortOrder.isEmpty()) sortOrder = "Desc";
        String sortField = request.getParameter("sortField");
        if (sortField.isEmpty()) sortField = "ID";
        Map<String,Object> params = new HashMap<>();
        params.put("Begin",pageSize * pageIndex);
        params.put("End",pageSize * (pageIndex + 1));
        params.put("sortOrder",sortOrder);
        params.put("sortField",sortField);
        String queryText = request.getParameter("Query");
        if (Strings.isNotEmpty(queryText)) {
            List<sqlParameter> Vs = JSON.parseArray(queryText, sqlParameter.class);
            List<sqlParameter> OrItems = sqlParameterCreator.convert(Vs);
            params.put("orItems", OrItems);
        } else params.put("orItems", new ArrayList<>());
        String highText = request.getParameter("High");
        if (Strings.isNotEmpty(highText)) {
            List<sqlParameter> Ps = JSON.parseArray(highText, sqlParameter.class);
            List<sqlParameter> AndItems = sqlParameterCreator.convert(Ps);
            params.put("andItems", AndItems);
        } else params.put("andItems", new ArrayList<>());
        return params;
    }

    @Override
    public pageObject GetMyDownLoadData(HttpServletRequest request) throws Exception {
        pageObject object = new pageObject();
        Map<String,Object> params = getParams(request);
        List<Map<String,Object>> datas = templateMapper.GetMyDownLoadData(params);
        int Total = 0;
        List<Map<String,Object>> PP = new ArrayList<>();
        if (datas.size() > 0){
            Total = Integer.parseInt(datas.get(0).get("_TotalNum").toString());
            object.setTotal(Total);
            object.setData(datas);
        }
        return object;
    }

    @Override
    @Transactional
    public tbTemplateConfig Save(TemplateConfig config, tbTemplate template, String TemplateID, String Mode, String KT, String JW) throws Exception{
        LoginUserInfo Info = CompanyContext.get();
        List<tbTemplateConfig> list = new ArrayList<>();
        if (TemplateID.equals("1") || Mode.equals("Add")){
            template.setUploadTime(new Date());
            template.setUploadUser(Info.getLoginName());
            template.setUserId(Info.getUserIdValue());
            template.setLevel("自我设置");
            template.setIsShare(0);
            template.setId(0);
            tbTemplate t = templateRepository.save(template);
            Integer temId = t.getId();
            config.setJuTiShiShiFangShiKaiTou(KT);
            config.setJuTiShiShiFangShiJieWei(JW);
            list = SaveConfig(config,temId);
            templateConfigRepository.saveAll(list);
        }else if (Mode.equals("Edit")){
            templateConfigRepository.deleteAllByTemplateId(Integer.parseInt(TemplateID));
            Optional<tbTemplate> findOne = templateRepository.findById(Integer.parseInt(TemplateID));
            if (findOne.isPresent()){
                EntityHelper.copyObject(template,findOne.get());
            }
            tbTemplate t = templateRepository.save(template);
            config.setJuTiShiShiFangShiKaiTou(KT);
            config.setJuTiShiShiFangShiJieWei(JW);
            list = SaveConfig(config,t.getId());
            templateConfigRepository.saveAll(list);
        }
        return null;
    }

    private List<tbTemplateConfig> SaveConfig(TemplateConfig config, Integer TemplateID) throws Exception{
        List<tbTemplateConfig> list = new ArrayList<>();
        Class cls = config.getClass();
        Field[] fields = cls.getDeclaredFields();
        for (int i=0;i<fields.length;i++){
            tbTemplateConfig templateConfig = new tbTemplateConfig();
            Field f = fields[i];
            f.setAccessible(true);
            templateConfig.setField(toUppercase(f.getName()));
            templateConfig.setFieldContent(f.get(config).toString());
            templateConfig.setTemplateId(TemplateID);
            list.add(templateConfig);
        }
        return list;
    }

    public String toUppercase(String string) {
        char[] chars = string.toCharArray();
        if (chars[0] >= 'a' && chars[0] <= 'z') {
            chars[0] -= 32;
            return String.valueOf(chars);
        }
        return string;
    }

    @Override
    @org.springframework.transaction.annotation.Transactional(rollbackFor = Exception.class)
    public boolean remove(Integer id) {
        templateRepository.deleteById(id);
        templateConfigRepository.deleteAllByTemplateId(id);
        return false;
    }

    @Override
    public boolean EnJoy(List<Integer> ids) throws Exception {
        templateRepository.update(1,ids);
        return true;
    }

    @Override
    public boolean CancelEnJoy(List<Integer> ids) throws Exception {
        LoginUserInfo Info = CompanyContext.get();
        templateRepository.update(0, ids);
        return true;
    }
}
