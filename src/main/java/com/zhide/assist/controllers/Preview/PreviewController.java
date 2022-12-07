package com.zhide.assist.controllers.Preview;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zhide.assist.common.PrivewUtils;
import com.zhide.assist.common.successResult;
import com.zhide.assist.mapper.IndependenceMapper;
import com.zhide.assist.models.*;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.zhide.assist.common.DocUtils.ClearBracket;

@Controller
@RequestMapping("/Preview")
public class PreviewController {
    @Autowired
    tbIndependenceRepository independenceRepository;

    @Autowired
    IndependenceMapper independenceMapper;

    @Autowired
    tbTechnicalFieldRepository technicalFieldRepository;

    @Autowired
    tbAssistNameRepository assistNameRepository;

    @Autowired
    tbBgtechnologyRepository bgtechnologyRepository;

    @Autowired
    tbTemplateConfigRepository templateConfigRepository;

    @Autowired
    tbDqExamplesRepository examplesRepository;

    @Autowired
    tbAttachedRepository attachedRepository;

    Logger logger = LoggerFactory.getLogger(PreviewController.class);

    @RequestMapping("/index")
    public String Index(Map<String,Object> map){
        LoginUserInfo Info = CompanyContext.get();
        Integer RowValue = Info.getRowValue();
        List<tbIndependence> listAllInde = independenceRepository.findAllByRowValue(RowValue);
        Long IndeAllNum = listAllInde.stream().count();
        Long AllDqNum = listAllInde.stream().filter(f -> f.getDqNum().equals("1")).count();
        map.put("IndeAllNum",IndeAllNum);
        map.put("AllDqNum",AllDqNum);

        /*专利名称 */
        List<tbAssitName> listAssitName = assistNameRepository.findAllById(RowValue);
        if (listAssitName.size() > 0){
            listAssitName.stream().forEach(f -> {
                map.put("AssistName",f.getAssistName());
            });
        }

        /*技术领域 */
        List<tbTechnicalField> listTech = technicalFieldRepository.findAllByRowValue(RowValue);
        if (listTech.size() > 0) {
            listTech.stream().forEach(f -> {
                map.put("TcOne", f.getTcOne());
                map.put("TechnicalField", f.getTechnicalField());
                map.put("TcTwo", f.getTcTwo());
            });
        }

        /*背景技术 */
        List<tbBgtechnology> listBgtechnology = bgtechnologyRepository.findAllByRowValue(RowValue);
        StringBuilder SBBgtechnology = new StringBuilder();
        String Bgtechnology = "";
        if (listBgtechnology.size()>0){
            Bgtechnology = listBgtechnology.get(0).getContent();
            String[] Bgtechnologys = Bgtechnology.replace("\n","<br />").split("<br />");
            for (int i=0;i<Bgtechnologys.length;i++){
                int length = Bgtechnologys[i].replaceAll("([ ]*).*", "$1").length();
                if (length > 0){
                    Bgtechnologys[i] = Bgtechnologys[i].substring(length);
                }
                if (Bgtechnologys.length == 1){
                    SBBgtechnology.append(Bgtechnologys[i]);
                }else if (i == 0) {
                    SBBgtechnology.append(Bgtechnologys[i]+ "<br />");
                }else if (i == Bgtechnologys.length-1){
                    SBBgtechnology.append(Bgtechnologys[i]);
                }else SBBgtechnology.append(Bgtechnologys[i] + "<br />");
            }
        }
        if (!SBBgtechnology.toString().equals("")){
            map.put("Bgtechnology",SBBgtechnology.toString());
        }else map.put("Bgtechnology","");

        /*发明内容 */
        List<tbIndependence> listFMNR = independenceMapper.findAllByRowValueOrderByDqExclusiveorderAsc(RowValue);
        int bianhao = 0;
        String strContent = "";
        StringBuilder FaMingContent = new StringBuilder();
        if (listFMNR.size()>0){
            for (int i=0;i<listFMNR.size();i++){
                bianhao++;
                if (!strContent.equals("")){
                    strContent = "";
                }
                tbIndependence ind = listFMNR.get(i);

                if (!ind.getDqObjectinvention().equals("")) {
                    if (i == 0) {
                        strContent += ClearBracket(ind.getDqObjectinvention());
                    } else strContent += "</br >" + ClearBracket(ind.getDqObjectinvention());
                }

                if (!ind.getDqTechnicalsolutions().equals("")) {
                    String DeleteKey = "";
                    StringBuilder SBContent = new StringBuilder();
                    String DqNum = ind.getDqNum();
                    tbAssitName assitName = listAssitName.stream().filter(x -> x.getId().equals(RowValue)).findFirst().get();
                    List<tbTemplateConfig> listTemplateConfig = templateConfigRepository.findAllByTemplateId(assitName.getTemplateId());
                    listTemplateConfig.stream().forEach(x ->{
                        if (DqNum.equals("1")) {
                            if (x.getField().equals("DuQuanJiShuFangAn")) {
                                SBContent.append(x.getFieldContent());
                            }
                        }else {
                            if (x.getField().equals("CongQuanJiShuFangAn")){
                                SBContent.append(x.getFieldContent());
                            }
                        }
                    });
                    String GetDeleteKey = GetDeleteKey(SBContent.toString() + ind.getDqTechnicalsolutions(),"其特征在于");

                    if (DqNum.equals("1")){
                        DeleteKey = DeleteDqKey(SBContent.toString() + ind.getDqTechnicalsolutions(),GetDeleteKey);
                    }else DeleteKey = DeleteCqKey(SBContent.toString() + ind.getDqTechnicalsolutions(),GetDeleteKey);

                    if (FaMingContent.toString().equals("") && strContent.equals("")) {
                        strContent += ClearBracket(DeleteKey.replace("所述的", ""));
                    } else {
                        strContent += "<br />" + ClearBracket(DeleteKey.replace("所述的", ""));
                    }
                }

                if (!ind.getDqBeneficialeffect().equals("")) {
                    if (FaMingContent.toString().equals("") && strContent.equals("")) {
                        strContent += ClearBracket(ind.getDqBeneficialeffect());
                    } else strContent += "<br />" + ClearBracket(ind.getDqBeneficialeffect());
                }

                FaMingContent.append(strContent);
                continue;
            }
        }
        if (!FaMingContent.toString().equals("")){
            map.put("FaMingContent",FaMingContent);
        }else map.put("FaMingContent","");

        /*附图说明 */
        StringBuilder FTSM = new StringBuilder();
        List<tbAttached> listAtt = attachedRepository.findAllByRowValue(RowValue);
        if (listAtt.size() > 0) {
            FTSM.append("【附图说明】<br />");
        }

        /*具体实施方式 */
        StringBuilder SBKaiTou = new StringBuilder();
        StringBuilder SBJieWei = new StringBuilder();
        StringBuilder SBAllShiShiLi = new StringBuilder();
        tbAssitName assitName = listAssitName.stream().filter(x -> x.getId().equals(RowValue)).findFirst().get();
        List<tbTemplateConfig> listTemplateConfig = templateConfigRepository.findAllByTemplateId(assitName.getTemplateId());
        listTemplateConfig.stream().filter(x -> x.getTemplateId().equals(assitName.getTemplateId())).forEach(x -> {
            if (x.getField().equals("JuTiShiShiFangShiKaiTou")){
                String KT = x.getFieldContent();
                String[] KTS = KT.replace("\n","\r").split("\r");
                for (int i=0;i<KTS.length;i++){
                    int length = KTS[i].replaceAll("([ ]*).*", "$1").length();
                    if (length > 0){
                        KTS[i] = KTS[i].substring(length);
                    }
                    if (KTS.length == 1){
                        SBKaiTou.append(KTS[i]);
                    }else if (i == 0) {
                        SBKaiTou.append(KTS[i]+ "\r");
                    }else if (i == KTS.length-1){
                        SBKaiTou.append("\t" + KTS[i]);
                    }else SBKaiTou.append("\t" + KTS[i] + "\r");
                }
            }
            if (x.getField().equals("JuTiShiShiFangShiJieWei")){
                String JW = x.getFieldContent();
                String[] JWS = JW.replace("\n","\r").split("\r");
                for (int i=0;i<JWS.length;i++){
                    int length = JWS[i].replaceAll("([ ]*).*", "$1").length();
                    if (length > 0){
                        JWS[i] = JWS[i].substring(length);
                    }
                    if (JWS.length == 1){
                        SBJieWei.append(JWS[i]);
                    }else if (i == 0) {
                        SBJieWei.append(JWS[i]+ "\r");
                    }else if (i == JWS.length-1){
                        SBJieWei.append("\t" + JWS[i]);
                    }else SBJieWei.append("\t" + JWS[i] + "\r");
                }
            }
        });
        List<tbIndependence> listInd = independenceMapper.findAllByRowValueOrderByDqExclusiveorderAsc(RowValue);
        int j = 1;
        if (listInd.size() > 0) {
            for (tbIndependence ind : listInd) {
                List<tbDqExamples> listExa = examplesRepository.findByRowValueAndInIdOrderByOrderNumAsc(RowValue,ind.getInId());
                if (listExa.size() > 0) {
                    for (int i=0;i<listExa.size();i++){
                        if (j == 1){
                            SBAllShiShiLi.append("实施例" + j + "：<br />");
                            SBAllShiShiLi.append(listExa.get(i).getDqExamples() + "<br />");
                        }else {
                            SBAllShiShiLi.append("\n实施例" + j + "：<br />");
                            SBAllShiShiLi.append(listExa.get(i).getDqExamples() + "<br />");
                        }
                        j++;
                    }
                }
            }
        }
        if (!SBKaiTou.toString().equals("")){
            map.put("KaiTou",SBKaiTou.toString());
        }else map.put("KaiTou","");

        if (!SBJieWei.toString().equals("")){
            map.put("JieWei",SBJieWei.toString());
        }else map.put("JieWei",SBJieWei.toString());

        if (!SBAllShiShiLi.toString().equals("")){
            map.put("AllShiShiLi",SBAllShiShiLi.toString());
        }else map.put("AllShiShiLi",SBAllShiShiLi.toString());
        return "/Claims/Preview";
    }

    @RequestMapping("/getTree")
    @ResponseBody
    public List<Map<String,Object>> GetTree(){
        LoginUserInfo Info = CompanyContext.get();
        List<Map<String,Object>> listInd = independenceMapper.GetTechAndExcByRowValueOrderByDqExclusiveorderAsc(Info.getRowValue());
        List<tbIndependence> listAllInde = independenceRepository.findAllByRowValue(Info.getRowValue());
        listInd.stream().forEach(f ->{
            Map<String,Object> map = f;
            if (f.get("DqNum").equals("1")){
                map.put("Pid","0");
            }else {
                String num = GetNum(f.get("DqTechnicalsolutions").toString());
                listAllInde.stream().filter(y -> y.getDqExclusiveorder().equals(num)).forEach(x ->{
                    map.put("Pid",x.getInId().toString());
                });
            }
        });
        return listInd;
    }

    private String GetNum(String str){
        if (str == null || str.length() == 0){
            return "";
        }

        String nownum = "";
        char[] nu = str.toCharArray();
        int j = 0;
        for (int i=0;i<nu.length;i++){
            if (Integer.valueOf(nu[i]) >= 48 && Integer.valueOf(nu[i]) <= 57){
                nownum = nownum + nu[i];
                j++;
            }else if (j > 0){
                break;
            }
        }
        return nownum;
    }

    private String DeleteDqKey(String Content,String Key){
        //独权删除其特征在于
        String result = "";
        if (Content.indexOf(Key) > 0) {
            Integer Index = Content.indexOf(Key);
            result =  Content.substring(0, Index) + Content.substring(Index + Key.length());
        }
        return result;
    }
    private String DeleteCqKey(String Content,String Key){
        String result = "";
        if (Content.indexOf(Key) > 0) {
            //从权删除其特征在于
            int firstLineIndex = Content.indexOf("：");
            int lastLineIndex = Content.indexOf(Key);
            result = Content.substring(0, firstLineIndex + 1) + Content.substring(lastLineIndex + Key.length());
        }
        return result;
    }
    private String GetDeleteKey(String Content, String Key){
        String Result = "";
        if (Content.indexOf(Key) > -1) {
            Integer Index = Content.indexOf(Key);
            Integer KeyIndex = Index + Key.length();
            String AfterResult = Content.substring(KeyIndex, KeyIndex + 1);
            if (AfterResult.trim().replaceAll("\\p{P}", "").length() == 0) {
                Result = Key + AfterResult;
            }else Result = Key;
        }
        return Result;
    }
}
