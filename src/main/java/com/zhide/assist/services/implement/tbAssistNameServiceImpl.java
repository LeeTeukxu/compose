package com.zhide.assist.services.implement;

import com.alibaba.fastjson.JSON;
import com.aspose.words.Row;
import com.zhide.assist.common.EntityHelper;
import com.zhide.assist.common.FTPUtil;
import com.zhide.assist.common.GUIDContext;
import com.zhide.assist.common.pageObject;
import com.zhide.assist.mapper.AssistNameMapper;
import com.zhide.assist.mapper.MemoMapper;
import com.zhide.assist.models.*;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.*;
import com.zhide.assist.services.MemoCreator;
import com.zhide.assist.services.define.ItbAssistNameService;
import com.zhide.assist.services.sqlParameterCreator;
import org.apache.ibatis.annotations.Param;
import org.apache.logging.log4j.util.Strings;
import org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import java.awt.*;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.UnsupportedFlavorException;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class tbAssistNameServiceImpl implements ItbAssistNameService {

    @Autowired
    tbAssistNameRepository tbAssistNameRepository;

    @Autowired
    AssistNameMapper assistNameMapper;

    @Autowired
    tbAttachedRepository tbAttachedRepository;

    @Autowired
    tbAbstractAttachedRepository tbAbstractAttachedRepository;

    @Autowired
    tbTechnicalFieldRepository tbTechnicalFieldRepository;

    @Autowired
    tbBgtechnologyRepository tbBgtechnologyRepository;

    @Autowired
    tbDqExamplesRepository tbDqExamplesRepository;

    @Autowired
    tbIndependenceRepository tbIndependenceRepository;

    @Autowired
    tbInstructionRepository tbInstructionRepository;

    @Autowired
    MemoMapper memoMapper;

    @Autowired
    tbTemplateConfigRepository templateConfigRepository;

    @Autowired
    tbDigitalSignRepository tbDigitalSignRepository;

    @Autowired
    memoRepository memoRepository;

    @Transactional
    @Override
    public tbAssitName Save(@Param(value = "Data") tbAssitName tbAssitName) throws Exception {
        LoginUserInfo loginUserInfo = CompanyContext.get();
        String Mode = "";
        if (tbAssitName==null) throw new Exception("数据为空！");
        if (tbAssitName.getId()==null){
            Mode = "Add";
            tbAssitName.setUserId(loginUserInfo.getUserId());
            tbAssitName.setAddTime(new Date());
            tbAssitName.setUpdateTime(new Date());
            tbAssitName.setDownloadNum(0);
            tbAssitName.setDownloadFiveNum(0);
            tbAssitName.setState(1);
            tbAssitName.setFontsize(15);
        }else {
            Mode = "Edit";
            Optional<tbAssitName> find = tbAssistNameRepository.findById(tbAssitName.getId());
            if (find.isPresent()){
                tbAssitName.setUpdateTime(new Date());
                EntityHelper.copyObject(tbAssitName,find.get());
            }else throw new Exception("数据异常:" + Integer.toString(tbAssitName.getId()) + "无法获取到数据!");
        }

        tbAssitName assist = tbAssistNameRepository.save(tbAssitName);

        //联动保存技术领域
        tbTechnicalField technicalField = new tbTechnicalField();
        if (Mode == "Add") {
            List<tbTemplateConfig> listTemplateConfig = templateConfigRepository.findAllByTemplateId(tbAssitName.getTemplateId());
            StringBuilder SbJJLYOne = new StringBuilder();
            listTemplateConfig.stream().forEach(x -> {
                if (x.getField().equals("JiShuLingYuOne")) {
                    SbJJLYOne.append(x.getFieldContent());
                }
            });
            if (SbJJLYOne.toString().equals("")){{
                SbJJLYOne.append("发明");
            }}
            technicalField.setTcOne("本" + SbJJLYOne.toString() + "涉及");
            technicalField.setTcTwo("领域，具体为" + tbAssitName.getAssistName());
            technicalField.setUserId(Integer.parseInt(loginUserInfo.getUserId()));
            technicalField.setRowValue(assist.getId());
        }else {
            Optional<tbTechnicalField> findNew = tbTechnicalFieldRepository.findByRowValue(assist.getId());
            if (findNew.isPresent()){
                EntityHelper.copyObject(findNew.get(),technicalField);
                technicalField.setTcTwo("领域,具体为" + assist.getAssistName());
            }else throw new Exception("数据异常:" + technicalField.getTechnicalField() + "无法获取到数据!");
        }
        technicalField = tbTechnicalFieldRepository.save(technicalField);
        return assist;
    }

    @Override
    public pageObject getData(HttpServletRequest request) throws Exception {
        pageObject object = new pageObject();
        Map<String,Object> params = getParams(request);
        List<Map<String,Object>> datas = assistNameMapper.getData(params);
        int Total = 0;
        List<Map<String,Object>> PP = new ArrayList<>();
        if (datas.size() > 0){
            Total = Integer.parseInt(datas.get(0).get("_TotalNum").toString());
            List<String> CIDS = datas.stream().map(f -> f.get("ID").toString()).collect(Collectors.toList());
            List<tbMemo> memos = memoMapper.getAllByIds(CIDS);
            for (int i=0;i<datas.size();i++){
                Map<String,Object> row = datas.get(i);
                Map<String,Object> newRow = eachSingleRow(row,memos);
            }
            object.setTotal(Total);
            object.setData(datas);
        }
        return object;
    }

    private Map<String, Object> eachSingleRow(
            Map<String, Object> row,
            List<tbMemo> memos) {
        row.remove("_TotalNum");
        String ProductID = row.get("ID").toString();
        MemoCreator creator = new MemoCreator(memos);
        List<String> words = creator.Build(ProductID);
        row.put("EDITMEMO", words.size() > 0 ? 1 : 0);
        if (words.size() > 0) {
            row.put("MEMO", String.join("<br/><br/>", words));
        } else {
            row.put("MEMO", "");
        }
        return row;
    }

    private Map<String,Object> getParams(HttpServletRequest request) throws Exception{
        LoginUserInfo Info = CompanyContext.get();
        int pageSize = Integer.parseInt(request.getParameter("pageSize"));
        int pageIndex = Integer.parseInt(request.getParameter("pageIndex"));
        String sortOrder = request.getParameter("sortOrder");
        if (sortOrder.isEmpty()) sortOrder = "Desc";
        String sortField = request.getParameter("sortField");
        if (sortField.isEmpty()) sortField = "ID";
        String State = request.getParameter("State");
        Map<String,Object> params = new HashMap<>();
        params.put("Begin",pageSize * pageIndex);
        params.put("End",pageSize * (pageIndex + 1));
        params.put("sortOrder",sortOrder);
        params.put("sortField",sortField);
        params.put("UserID",Info.getUserIdValue());
        params.put("State",State);
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
    @Transactional(rollbackOn = Exception.class)
    public boolean remove(List<Integer> ids, String State) {
        FTPUtil util = new FTPUtil();
        String FilePath =util.getPath() + "/Assist/";
        if (State.equals("1")) {
            List<tbAssitName> list = tbAssistNameRepository.findAllByIdIn(ids);
            list.stream().forEach(f -> {
                f.setState(2);
            });
            tbAssistNameRepository.saveAll(list);
        }else {
            tbAssistNameRepository.deleteAllByIdIn(ids);
            tbAttachedRepository.deleteAllByRowValueIn(ids);
            tbAbstractAttachedRepository.deleteAllByRowValueIn(ids);
            tbTechnicalFieldRepository.deleteAllByRowValueIn(ids);
            tbBgtechnologyRepository.deleteAllByRowValueIn(ids);
            tbIndependenceRepository.deleteAllByRowValueIn(ids);
            tbDqExamplesRepository.deleteAllByRowValueIn(ids);
            tbInstructionRepository.deleteAllByRowValueIn(ids);
            List<String> id = ids.stream().map(String::valueOf).collect(Collectors.toList());
            memoRepository.removeAllByProductidIn(id);

            List<tbAttached> listAtt = tbAttachedRepository.findAllByRowValueIn(ids);
            if (listAtt.size() > 0) {
                for (tbAttached att : listAtt) {
                    File file = new File(att.getPath().trim());
                    String FileName = file.getName();
                    DelFile(FilePath, FileName);
                }
            }
        }
        return false;
    }

    private static void DelFile(String FilePath,String FileName){
        FTPUtil util = new FTPUtil();
        File folder = new File(util.getPath() + "/Assist");
        File[] files = folder.listFiles();
        for (File file:files){
            if (file.getName().equals(FileName)){
                file.delete();
            }
        }
    }

    @Override
    @Transactional(rollbackOn = Exception.class)
    public boolean reback(List<Integer> ids) {
        List<tbAssitName> list = tbAssistNameRepository.findAllByIdIn(ids);
        list.stream().forEach(f -> {
            f.setState(1);
        });
        tbAssistNameRepository.saveAll(list);
        return true;
    }

    @Override
    @Transactional(rollbackOn = Exception.class)
    public boolean copy(List<Integer> ids) throws Exception {
        tbAssitName assitName = new tbAssitName();
        if (ids.size() > 0) {
            for (Integer id : ids) {
                Optional<tbAssitName> findAssistName = tbAssistNameRepository.findById(id);
                if (findAssistName.isPresent()) {
                    EntityHelper.copyObject(findAssistName.get(), assitName);
                    assitName.setId(null);
                    tbAssistNameRepository.save(assitName);

                    CopyOther(assitName.getId(), id);
                }
            }
        }
        return true;
    }

    private void CopyOther(Integer RowValue, Integer id) throws Exception{
        List<tbAttached> listAttached = tbAttachedRepository.findAllByRowValue(id);
        if (listAttached.size() > 0){
            for (tbAttached liAtt : listAttached){
                String GUID = UUID.randomUUID().toString();
                tbAttached newAttached = new tbAttached();
                tbAttached oldAttached = liAtt;
                newAttached.setAttached(oldAttached.getAttached());
                newAttached.setPath("/Assist/" + GUID + ".jpg");
                newAttached.setPictureDescription(oldAttached.getPictureDescription());
                newAttached.setCnSort(oldAttached.getCnSort());
                newAttached.setSort(oldAttached.getSort());
                newAttached.setAttId(GUID);
                newAttached.setUserId(oldAttached.getUserId());
                newAttached.setRowValue(RowValue);
                tbAttachedRepository.save(newAttached);
                FTPUtil util = new FTPUtil();
                String source =util.getPath() + oldAttached.getPath();
                String out = util.getPath() + "\\Assist\\"  + GUID + ".jpg";
                CopyPicture(source, out);
            }
        }

        tbAbstractAttached abstractAttached = new tbAbstractAttached();
        Optional<tbAbstractAttached> findAbstractAttached = tbAbstractAttachedRepository.findByRowValue(id);
        if (findAbstractAttached.isPresent()){
            EntityHelper.copyObject(findAbstractAttached.get(), abstractAttached);
            abstractAttached.setId(null);
            abstractAttached.setRowValue(RowValue);
            tbAbstractAttachedRepository.save(abstractAttached);
        }

        tbTechnicalField technicalField = new tbTechnicalField();
        Optional<tbTechnicalField> findTechnicalField = tbTechnicalFieldRepository.findByRowValue(id);
        if (findTechnicalField.isPresent()){
            EntityHelper.copyObject(findTechnicalField.get(), technicalField);
            technicalField.setId(null);
            technicalField.setRowValue(RowValue);
            tbTechnicalFieldRepository.save(technicalField);
        }

        tbBgtechnology bgtechnology = new tbBgtechnology();
        Optional<tbBgtechnology> findBgtechnolgy = tbBgtechnologyRepository.findByRowValue(id);
        if (findBgtechnolgy.isPresent()){
            EntityHelper.copyObject(findBgtechnolgy.get(), bgtechnology);
            bgtechnology.setId(null);
            bgtechnology.setRowValue(RowValue);
            tbBgtechnologyRepository.save(bgtechnology);
        }

        List<tbIndependence> listInde = tbIndependenceRepository.findAllByRowValue(id);
        if (listInde.size() > 0){
            for (tbIndependence inde : listInde){
                tbIndependence independence = new tbIndependence();
                independence.setDqObjectinvention(inde.getDqObjectinvention());
                independence.setDqTechnicalsolutions(inde.getDqTechnicalsolutions());
                independence.setDqBeneficialeffect(inde.getDqBeneficialeffect());
                independence.setDqExclusiveorder(inde.getDqExclusiveorder());
                independence.setDqNum(inde.getDqNum());
                independence.setDqExamples(inde.getDqExamples());
                independence.setUserId(inde.getUserId());
                independence.setRowValue(RowValue);
                independence.setOnlyId(inde.getOnlyId());
                tbIndependenceRepository.save(independence);
            }
        }

        List<tbDqExamples> listExa = tbDqExamplesRepository.findByRowValue(id);
        if (listExa.size() > 0){
            for (tbDqExamples exa : listExa){
                tbDqExamples examples = new tbDqExamples();
                examples.setDqExamples(exa.getDqExamples());
                examples.setUserId(exa.getUserId());
                examples.setRowValue(RowValue);
                examples.setOrderNum(exa.getOrderNum());
                examples.setInId(exa.getInId());
                tbDqExamplesRepository.save(examples);
            }
        }

        tbInstruction instruction = new tbInstruction();
        Optional<tbInstruction> findInstruction = tbInstructionRepository.findByRowValue(id);
        if (findInstruction.isPresent()){
            EntityHelper.copyObject(findInstruction.get(), instruction);
            instruction.setId(null);
            instruction.setRowValue(RowValue);
            tbInstructionRepository.save(instruction);
        }

        tbDigitalSign digitalSign = new tbDigitalSign();
        Optional<tbDigitalSign> findDigitalSign = tbDigitalSignRepository.findByRowValue(id);
        if (findDigitalSign.isPresent()){
            EntityHelper.copyObject(findDigitalSign.get(), digitalSign);
            digitalSign.setId(null);
            digitalSign.setRowValue(RowValue);
            tbDigitalSignRepository.save(digitalSign);
        }
    }

    //复制粘贴文件
    private void CopyPicture(String source, String target) throws Exception{
        FileInputStream in = new FileInputStream(source);
        FileOutputStream out = new FileOutputStream(target);
        int len = 0;
        byte[] bytes = new byte[1024];
        while ((len = in.read(bytes)) != -1){
            out.write(bytes, 0 , len);
        }
        in.close();
        out.close();
    }
}
