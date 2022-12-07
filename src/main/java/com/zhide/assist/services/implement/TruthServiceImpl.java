package com.zhide.assist.services.implement;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.EntityHelper;
import com.zhide.assist.common.FTPUtil;
import com.zhide.assist.common.pageObject;
import com.zhide.assist.mapper.TruthMapper;
import com.zhide.assist.mapper.TruthMemoMapper;
import com.zhide.assist.models.*;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.*;
import com.zhide.assist.services.MemoCreator;
import com.zhide.assist.services.define.ITruthService;
import com.zhide.assist.services.sqlParameterCreator;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.applet.Main;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class TruthServiceImpl implements ITruthService {

    @Autowired
    TruthMapper truthMapper;

    @Autowired
    TruthMemoMapper truthMemoMapper;

    @Autowired
    tbTruthRepository truthRepository;

    @Autowired
    ApplicationInfoRepository applicationInfoRepository;

    @Autowired
    TechSubjectRepository techSubjectRepository;

    @Autowired
    TechBackgroundRepository techBackgroundRepository;

    @Autowired
    tbAttachedRepository attachedRepository;

    @Autowired
    TechImproveMainRepository techImproveMainRepository;

    @Autowired
    TechImproveDetailRepository techImproveDetailRepository;

    @Autowired
    memoRepository memoRepository;

    @Autowired
    TechMainRepository techMainRepository;

    @Override
    public pageObject getData(HttpServletRequest request) throws Exception {
        pageObject object = new pageObject();
        Map<String,Object> params = getParams(request);
        List<Map<String,Object>> datas = truthMapper.getData(params);
        int Total = 0;
        List<Map<String,Object>> PP = new ArrayList<>();
        if (datas.size() > 0){
            Total = Integer.parseInt(datas.get(0).get("_TotalNum").toString());
            List<String> CIDS = datas.stream().map(f -> f.get("TruthID").toString()).collect(Collectors.toList());
            List<tbMemo> memos = truthMemoMapper.getAllByIds(CIDS);
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
        String TruthID = row.get("TruthID").toString();
        MemoCreator creator = new MemoCreator(memos);
        List<String> words = creator.Build(TruthID);
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
        params.put("CreateMan",Info.getUserIdValue());
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

    @Transactional(rollbackOn = Exception.class)
    @Override
    public void UpdateTime() throws Exception {
        LoginUserInfo Info = CompanyContext.get();
        Optional<tbTruth> findOne = truthRepository.findAllByTechMainId(Info.getTechMainID());
        tbTruth truth = new tbTruth();
        if (findOne.isPresent()) {
            EntityHelper.copyObject(truth, findOne.get());;
            truth.setUpdateTime(new Date());
        }
        truthRepository.save(truth);
    }

    @Transactional(rollbackOn = Exception.class)
    @Override
    public boolean remove(List<Integer> ids, String State) throws Exception{
        if (State.equals("1")) {
            List<tbTruth> list = truthRepository.findAllByTechMainIdIn(ids);
            list.stream().forEach(f -> {
                f.setState(2);
            });
            truthRepository.saveAll(list);
        }else {
            truthRepository.deleteAllByTechMainIdIn(ids);
            applicationInfoRepository.deleteAllByIdIn(ids);
            techSubjectRepository.deleteAllByTechMainIdIn(ids);
            techBackgroundRepository.deleteAllByTechMainIdIn(ids);
            attachedRepository.deleteAllByRowValueIn(ids);

            List<TechImproveMain> listImpMain = techImproveMainRepository.getAllByTechMainIdIn(ids);
            List<Integer> listImpMainID = new ArrayList<>();
            listImpMain.stream().forEach(f -> {
                listImpMainID.add(f.getSubId());
            });
            techImproveMainRepository.deleteAllByTechMainIdIn(ids);
            techImproveDetailRepository.deleteAllByMainIdIn(listImpMainID);
            List<String> id = ids.stream().map(String::valueOf).collect(Collectors.toList());
            memoRepository.removeAllByProductidIn(id);

            techMainRepository.deleteAllByIdIn(ids);

            List<tbAttached> listAtt = attachedRepository.findAllByRowValueIn(ids);
            if (listAtt.size() > 0) {
                for (tbAttached att : listAtt) {
                    File file = new File(att.getPath().trim());
                    String FileName = file.getName();
                    DelFile(FileName);
                }
            }
        }
        return true;
    }

    private static void DelFile(String FileName) {
        FTPUtil util = new FTPUtil();
        File folder = new File(util.getPath() + "/ImgFiles");
        File[] files = folder.listFiles();
        for (File file : files) {
            if (file.getName().equals(FileName)) {
                file.delete();
            }
        }
    }

    @Transactional(rollbackOn = Exception.class)
    @Override
    public boolean Copy(List<Integer> ids, List<Integer> TechMainIDS) throws Exception {
        List<TechMain> listTechMain = techMainRepository.findAllByIdIn(TechMainIDS);
        List<Map<String, Object>> listMap = new ArrayList<>();
        Map<String, Object> model = new HashMap<>();
        if (listTechMain.size() > 0) {
            for (TechMain techMain : listTechMain) {
                TechMain main = new TechMain();
                EntityHelper.copyObject(techMain, main);
                String Id = techMain.getId().toString();
                main.setId(null);
                techMainRepository.save(main);
                String value = main.getId().toString();
                model.put(Id, value);
            }
            listMap.add(model);
        }

        SaveTruth(ids, listMap);
        SaveSubject(TechMainIDS, listMap);
        SaveBackGround(TechMainIDS, listMap);
        SaveAttached(TechMainIDS, listMap);
        SaveTechImproveMain(TechMainIDS, listMap);

        return true;
    }

    public void SaveTruth(List<Integer> ids, List<Map<String, Object>> listMap) throws Exception {
        List<tbTruth> listTruth = truthRepository.findAllByTruthIdIn(ids);
        List<tbTruth> Truths = new ArrayList<>();
        if (listTruth.size() > 0) {
            listTruth.stream().forEach(f -> {
                try {
                    tbTruth truth = new tbTruth();
                    EntityHelper.copyObject(f, truth);
                    listMap.stream().forEach(x -> {
                        Iterator<Map.Entry<String, Object>> entries = x.entrySet().iterator();
                        while (entries.hasNext()) {
                            Map.Entry<String, Object> entry = entries.next();
                            if (Integer.parseInt(entry.getKey()) == f.getTechMainId()) {
                                truth.setTechMainId(Integer.parseInt(entry.getValue().toString()));
                            }
                        }
                    });
                    truth.setTruthId(null);
                    Truths.add(truth);
                }catch (Exception e) {
                    e.printStackTrace();
                }
            });
            truthRepository.saveAll(Truths);
        }
    }

    public void SaveSubject(List<Integer> TechMainIDS, List<Map<String, Object>> listMap) throws Exception {
        List<TechSubject> listSubject = techSubjectRepository.findAllByTechMainIdIn(TechMainIDS);
        List<TechSubject> techSubjects = new ArrayList<>();
        if (listSubject.size() > 0) {
            listSubject.stream().forEach(f -> {
                try{
                    TechSubject subject = new TechSubject();
                    EntityHelper.copyObject(f, subject);
                    listMap.stream().forEach(x -> {
                        Iterator<Map.Entry<String, Object>> entries = x.entrySet().iterator();
                        while (entries.hasNext()) {
                            Map.Entry<String, Object> entry = entries.next();
                            if (Integer.parseInt(entry.getKey()) == f.getTechMainId()) {
                                subject.setTechMainId(Integer.parseInt(entry.getValue().toString()));
                            }
                        }
                    });
                    subject.setSubId(null);
                    techSubjects.add(subject);
                }catch (Exception e) {
                    e.printStackTrace();
                }
            });
            techSubjectRepository.saveAll(techSubjects);
        }
    }

    public void SaveBackGround(List<Integer> TechMainIDS, List<Map<String, Object>> listMap) throws Exception {
        List<TechBackground> listBackGround = techBackgroundRepository.findAllByTechMainIdIn(TechMainIDS);
        List<TechBackground> backGrounds = new ArrayList<>();
        if (listBackGround.size() > 0) {
            listBackGround.stream().forEach(f -> {
                try{
                    TechBackground background = new TechBackground();
                    EntityHelper.copyObject(f, background);
                    listMap.stream().forEach(x -> {
                        Iterator<Map.Entry<String, Object>> entries = x.entrySet().iterator();
                        while (entries.hasNext()) {
                            Map.Entry<String, Object> entry = entries.next();
                            if (Integer.parseInt(entry.getKey()) == f.getTechMainId()) {
                                background.setTechMainId(Integer.parseInt(entry.getValue().toString()));
                            }
                        }
                    });
                    background.setSubId(null);
                    backGrounds.add(background);
                }catch (Exception e) {
                    e.printStackTrace();
                }
            });
            techBackgroundRepository.saveAll(backGrounds);
        }
    }

    public void SaveAttached(List<Integer> TechMainIDS, List<Map<String, Object>> listMap) throws Exception {
        List<tbAttached> listAttached = attachedRepository.findAllByRowValueIn(TechMainIDS);
        List<tbAttached> attacheds = new ArrayList<>();
        if (listAttached.size() > 0) {
            listAttached.stream().forEach(f -> {
                try{
                    tbAttached attached = new tbAttached();
                    EntityHelper.copyObject(f, attached);
                    listMap.stream().forEach(x -> {
                        try {
                            Iterator<Map.Entry<String, Object>> entries = x.entrySet().iterator();
                            while (entries.hasNext()) {
                                Map.Entry<String, Object> entry = entries.next();
                                if (Integer.parseInt(entry.getKey()) == f.getRowValue()) {
                                    attached.setRowValue(Integer.parseInt(entry.getValue().toString()));
                                    String GUID = UUID.randomUUID().toString();
                                    String path = attached.getPath();
                                    String[] exts = attached.getPath().split("\\.");
                                    String extName = exts[exts.length - 1];
                                    if (attached.getType().equals("Img")) {
                                        attached.setPath("/ImgFiles/" + GUID + "." + extName);
                                    } else attached.setPath("/ZipFiles/" + GUID + "." + extName);
                                    attached.setAttId(GUID);
                                    String out = "";
                                    FTPUtil util = new FTPUtil();
                                    String source = util.getPath() + path;
                                    if (attached.getType().equals("Img")){
                                        out = util.getPath() + "\\ImgFiles\\" + GUID + "." + extName;
                                    }else out = util.getPath() + "\\ZipFiles\\" + GUID + "." + extName;
                                    CopyPicture(source, out);
                                }
                            }
                        }catch (Exception e) {
                            e.printStackTrace();
                        }
                    });
                    attached.setId(null);
                    attacheds.add(attached);
                }catch (Exception e) {
                    e.printStackTrace();
                }
            });
            attachedRepository.saveAll(attacheds);
        }
    }

    public void SaveTechImproveMain(List<Integer> TechMainIDS, List<Map<String, Object>> listMap) throws Exception {
        List<Integer> MainIDS = new ArrayList<>();
        List<Map<String, Object>> maps = new ArrayList<>();
        Map<String, Object> model = new HashMap<>();
        List<TechImproveMain> listTechImproveMain = techImproveMainRepository.getAllByTechMainIdIn(TechMainIDS);
        if (listTechImproveMain.size() > 0) {
            listTechImproveMain.stream().forEach(f -> {
                try {
                    TechImproveMain techImproveMain = new TechImproveMain();
                    EntityHelper.copyObject(f, techImproveMain);
                    String Id = f.getSubId().toString();
                    listMap.stream().forEach(x -> {
                        Iterator<Map.Entry<String, Object>> entries = x.entrySet().iterator();
                        while (entries.hasNext()) {
                            Map.Entry<String, Object> entry = entries.next();
                            if (Integer.parseInt(entry.getKey()) == f.getTechMainId()) {
                                techImproveMain.setSubId(null);
                                techImproveMain.setTechMainId(Integer.parseInt(entry.getValue().toString()));
                                techImproveMainRepository.save(techImproveMain);
                                Integer Value = techImproveMain.getSubId();
                                model.put(Id, Value);
                                maps.add(model);
                                MainIDS.add(Integer.parseInt(Id));
                            }
                        }
                    });
                } catch (Exception e) {
                    e.printStackTrace();
                }
            });

            SaveTechImproveDetail(MainIDS, maps);
        }
    }
    public void SaveTechImproveDetail(List<Integer> MainIDS, List<Map<String, Object>> listMap) throws Exception {
        List<TechImproveDetail> listTechImproveDetail = techImproveDetailRepository.findAllByMainIdIn(MainIDS);
        List<TechImproveDetail> techImproveDetails = new ArrayList<>();
        if (listTechImproveDetail.size() > 0) {
            listTechImproveDetail.stream().forEach(f -> {
                try {
                    TechImproveDetail techImproveDetail = new TechImproveDetail();
                    EntityHelper.copyObject(f, techImproveDetail);
                    listMap.stream().forEach(x -> {
                        Iterator<Map.Entry<String, Object>> entries = x.entrySet().iterator();
                        while (entries.hasNext()) {
                            Map.Entry<String, Object> entry = entries.next();
                            if (Integer.parseInt(entry.getKey()) == f.getMainId()) {
                                techImproveDetail.setMainId(Integer.parseInt(entry.getValue().toString()));
                            }
                        }
                    });
                    techImproveDetail.setTinyId(null);
                    techImproveDetails.add(techImproveDetail);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            });
            techImproveDetailRepository.saveAll(techImproveDetails);
        }
    }


    @Override
    @Transactional(rollbackOn = Exception.class)
    public boolean reback(List<Integer> ids) {
        List<tbTruth> list = truthRepository.findAllByTruthIdIn(ids);
        list.stream().forEach(f -> {
            f.setState(1);
        });
        truthRepository.saveAll(list);
        return true;
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
