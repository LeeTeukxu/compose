package com.zhide.assist.services.implement;

import com.zhide.assist.common.EntityHelper;
import com.zhide.assist.common.StringUtilTool;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbTechnology;
import com.zhide.assist.models.tbTechnologyTemplate;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbTechnologyRepository;
import com.zhide.assist.repositorys.tbTechnologyTemplateRepository;
import com.zhide.assist.services.define.ItbTechnologyService;
import freemarker.template.utility.StringUtil;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.swing.text.html.parser.Entity;
import java.util.*;

@Service
public class tbTechnologyServiceImpl implements ItbTechnologyService {

    @Autowired
    tbTechnologyRepository technologyRepository;

    @Autowired
    tbTechnologyTemplateRepository technologyTemplateRepository;

    @Override
    public List<tbTechnology> getAll() {
        return technologyRepository.findAll();
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean SaveAll(List<Map<String, Object>> datas) {
        Map<Integer, Integer> KeyHash = new HashMap<>();
        for (int i=0;i<datas.size();i++) {
            tbTechnology technology = new tbTechnology();
            Map<String, Object> data = datas.get(i);
            int technologyId = 0;
            Object techId;
            if (data.containsKey("technologyId") == false) {
                int Id = Integer.parseInt(data.get("_id").toString());
                techId = technologyRepository.getMax();
                if (techId == null) {
                    technologyId = 1;
                }else technologyId = Integer.parseInt(techId.toString());
                KeyHash.put(Id, technologyId);
            }else {
                technologyId = Integer.parseInt(data.get("technologyId").toString());
            }
            technology.setTechnologyId(technologyId);
            int pid = 0;
            if (data.containsKey("pid")) {
                pid = Integer.parseInt(data.get("pid").toString());
            }else {
                int ppId = Integer.parseInt(data.get("_pid").toString());
                if (KeyHash.containsKey(ppId)) pid = KeyHash.get(ppId);
            }
            technology.setPid(pid);
            technology.setCanUse(Boolean.parseBoolean(data.get("canUse").toString()));
            technology.setName(StringUtilTool.getValue(data.get("name")));
            technology.setMemo(StringUtilTool.getValue(data.get("memo")));
            technology.setSn(Integer.parseInt(data.get("sn").toString()));

            String pSort = StringUtil.leftPad(Integer.toString(pid), 6 ,"0");
            List<tbTechnology> parentInfos = technologyRepository.findAllByTechnologyId(pid);
            if (parentInfos.size() > 0) {
                tbTechnology parent = parentInfos.get(0);
                pSort = parent.getSort();
            }
            String dSort = StringUtil.leftPad(Integer.toString(technologyId), 6, "0");
            technology.setSort(pSort + dSort);

            technologyRepository.save(technology);
        }
        //RemoveAllKeys();
        return true;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public boolean RemoveAll(List<Integer> ids) {
        List<tbTechnology> listTechnology = technologyRepository.findAll();
        ids.stream().forEach(f -> {
            listTechnology.stream().filter(x -> x.getTechnologyId() == f).forEach(x -> {
                technologyRepository.delete(x);
            });
        });
        return true;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public tbTechnologyTemplate SaveTemplate(@Param(value = "Data") tbTechnologyTemplate technologyTemplate, @Param(value = "TechnologyID") String TechnologyID) throws Exception {
        LoginUserInfo Info = CompanyContext.get();
        if (technologyTemplate == null) throw new Exception("数据为空！");
        if (technologyTemplate.getTechnologyTemplateId() == null) {
            technologyTemplate.setTechnologyId(Integer.parseInt(TechnologyID));
            technologyTemplate.setCreateMan(Info.getUserIdValue());
            technologyTemplate.setCreateTime(new Date());
        }else {
            Optional<tbTechnologyTemplate> findOne = technologyTemplateRepository.findById(technologyTemplate.getTechnologyTemplateId());
            if (findOne.isPresent()) {
                EntityHelper.copyObject(technologyTemplate, findOne.get());
            }else throw new Exception("数据异常：" + technologyTemplate.getTechnologyTemplateId() + "无法获取到数据！");
        }
        tbTechnologyTemplate template = technologyTemplateRepository.save(technologyTemplate);
        return template;
    }
}
