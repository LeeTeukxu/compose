package com.zhide.assist.controllers.Claims;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.zhide.assist.common.EntityHelper;
import com.zhide.assist.common.ValueComparator;
import com.zhide.assist.common.successResult;
import com.zhide.assist.models.*;

import com.zhide.assist.repositorys.*;
import com.zhide.assist.services.define.ItbTechnicalFieldService;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.zhide.assist.services.define.ItbIndependenceService;
import com.zhide.assist.services.define.ItbexpedientService;
import com.zhide.assist.repositorys.tbAssistNameRepository;
import com.zhide.assist.repositorys.tbDqExamplesRepository;
import com.zhide.assist.services.define.ItbDqExamplesService;
import com.zhide.assist.repositorys.tbTemplateConfigRepository;
import com.zhide.assist.models.tbTemplateConfig;


import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import com.zhide.assist.common.pageObject;
import com.zhide.assist.multitenancy.CompanyContext;
@Controller
@RequestMapping("/Claims")
public class ClaimsController {
    @Autowired
    tbIndependenceRepository tbIndependenceRepository;
    @Autowired
    tbAttachedRepository attachedRepository;
    @Autowired
    ItbIndependenceService ItbIndependenceService;
    @Autowired
    tbDqExamplesRepository tbDqExamplesRepository;
    @Autowired
    tbDigitalSignRepository digitalSignRepository;
    @Autowired
    ItbexpedientService itbexpedientService;
    @Autowired
    ItbDqExamplesService ItbDqExamplesService;

    @Autowired
    tbTechnicalFieldRepository technicalFieldRepository;

    @Autowired
    ItbTechnicalFieldService itbTechnicalFieldService;

    @Autowired
    tbTemplateConfigRepository tbTemplateConfigRepository;

    @Autowired
    tbAssistNameRepository assistNameRepository;

    @Autowired
    tbTypoRepository typoRepository;

    String GUID = "";

    @RequestMapping("/index")
    public String Index(Map<String,Object> model,HttpServletRequest request) throws Exception {
        LoginUserInfo Info = CompanyContext.get();
        List<tbAssitName> listAssistName= assistNameRepository.findAllById(Info.getRowValue());
        List<tbAttached> list = new ArrayList<>();

        Optional<tbDigitalSign> findDigitalSign = null;
        if (Info.getRowValue() != 0){
            list = attachedRepository.getAllByRowValueOrderBySort(Info.getRowValue());
            findDigitalSign = digitalSignRepository.findByRowValue(Info.getRowValue());

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
        if (listAssistName.size()>0){
            model.put("AssistName",listAssistName.get(0).getAssistName());
            model.put("Fontsize",listAssistName.get(0).getFontsize());
        }else model.put("AssistName","{}");
        model.put("PicNum",list.size());
        model.put("ListPic",JSON.toJSONString(list));
        model.put("userid", Info.getUserId());
        List<Map<String,Object>> findTypo = typoRepository.finByUID(Info.getUserIdValue());
        if (findTypo.size() > 0){
            model.put("TypoData",JSON.toJSONString(findTypo));
        }else model.put("TypoData","{}");
        return "/Claims/index";
    }

    @RequestMapping("/ArraySort")
    public successResult ArraySort(HttpServletRequest request){
        successResult result = new successResult();
        try {
            LoginUserInfo Info=CompanyContext.get();
            Integer s=Integer.parseInt(request.getParameter("DqExclusiveorder"));
            List<Map<String,Object>> OS=tbIndependenceRepository.getDqExorderlq(Integer.parseInt(Info.getUserId()),Integer.parseInt(request.getParameter("DqExclusiveorder")),Info.getRowValue());
            result.setData(OS);
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping("/choice")
    public String choice(Map<String,Object> model,HttpServletRequest request) throws Exception {
        LoginUserInfo loginUserInfo = CompanyContext.get();
        return "/Claims/choice";
    }


    @RequestMapping("/quoteclaims")
    public String Quoteclaims(Map<String,Object> model,HttpServletRequest request) throws Exception {
        LoginUserInfo loginUserInfo = CompanyContext.get();
        return "/Claims/quoteclaims";
    }

    @RequestMapping("/ClaimsType")
    public String ClaimsType(Map<String,Object> model,HttpServletRequest request) throws Exception {
        LoginUserInfo loginUserInfo = CompanyContext.get();
        return "/Claims/ClaimsType";
    }

    @RequestMapping("/save")
    @ResponseBody
    public successResult Save(HttpServletRequest request){
        successResult result = new successResult();
        tbIndependence res=null;
        Optional<tbIndependence> find =null;
        LoginUserInfo Info = CompanyContext.get();
        try {
                    find=ItbIndependenceService.findByuserIdAndDqExclusiveorderAndRowValue(Integer.parseInt(Info.getUserId()),
                            request.getParameter("DqExclusiveorder"),Info.getRowValue());
                    if (find!=null && find.isPresent()) {
                       ItbIndependenceService.UpdateAttIDByGUIDANDDqExclusiveorder(Integer.parseInt(Info.getUserId()),request.getParameter("DqObjectinvention"), request.getParameter("DqTechnicalsolutions"),
                       request.getParameter("DqBeneficialeffect"),request.getParameter("DqExclusiveorder"),request.getParameter("DqNum"),Info.getRowValue());
                    }
                    else
                    {
                        tbIndependence tbIndependence = new tbIndependence();
                        tbIndependence.setUserId(Integer.parseInt(Info.getUserId()));
                        tbIndependence.setDqObjectinvention(request.getParameter("DqObjectinvention"));
                        tbIndependence.setDqTechnicalsolutions(request.getParameter("DqTechnicalsolutions"));
                        tbIndependence.setDqBeneficialeffect(request.getParameter("DqBeneficialeffect"));
                        tbIndependence.setDqExclusiveorder(request.getParameter("DqExclusiveorder"));
                        tbIndependence.setDqNum(request.getParameter("DqNum"));
                        tbIndependence.setOnlyId(Integer.parseInt(request.getParameter("OnlyId")));
                        res = ItbIndependenceService.Save(tbIndependence);
                        result.setData(res);
                    }
        }
        catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping("/UpClaimsOrder")
    @ResponseBody
    public successResult UpClaimsOrder(HttpServletRequest request){
        successResult result = new successResult();
        LoginUserInfo Info = CompanyContext.get();
        try {
         List<tbIndependence>wow=ItbIndependenceService.findC(Integer.parseInt(Info.getUserId()),Integer.parseInt(request.getParameter("DqExclusiveorder")),
                    Info.getRowValue());
         for (int i=0;i<wow.size();i++){
             String Exclusiveorder=wow.get(i).getDqExclusiveorder();
             int Onlyid=wow.get(i).getOnlyId();
             int ExclusiveorderValSelf=Integer.parseInt(Exclusiveorder)+1;
             String UpExclusiveorderVal=Integer.toString(ExclusiveorderValSelf);
             tbIndependenceRepository.UpDqExclusiveorder(Integer.parseInt(Info.getUserId()),Exclusiveorder,Info.getRowValue(),UpExclusiveorderVal,Onlyid);
         }

        }
        catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping("/UpdateExamples")
    @ResponseBody
    public successResult UpdateExamples(HttpServletRequest request){
        successResult result = new successResult();
        try {
         ItbDqExamplesService.UpdateDqExamplesName(Integer.parseInt(request.getParameter("EpId")),request.getParameter("DqExamples"));
        }
        catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping("/AddExamples")
    @ResponseBody
    public successResult AddExamples(HttpServletRequest request){
        successResult result = new successResult();
        tbDqExamples res=null;
        LoginUserInfo Info = CompanyContext.get();
        Integer getMax=tbDqExamplesRepository.getMax(Integer.parseInt(Info.getUserId()),Info.getRowValue());
        try {
            tbDqExamples tbDqExamples=new tbDqExamples();
            tbDqExamples.setDqExamples(request.getParameter("DqExamples"));
            tbDqExamples.setUserId(Integer.parseInt(Info.getUserId()));
            tbDqExamples.setRowValue(Info.getRowValue());
            if (getMax==null){
            tbDqExamples.setOrderNum(1);
            }
            else
            {
            tbDqExamples.setOrderNum(getMax);
            }
            tbDqExamples.setInId(Integer.parseInt(request.getParameter("InId")));
            res=ItbDqExamplesService.Save(tbDqExamples);
            result.setData(res);
        }
        catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping("/findDqexampleszhyt")
    @ResponseBody
    public successResult findDqexampleszhyt(){
        successResult result = new successResult();
        try {
            List<Map<String,Object>> sO=  tbDqExamplesRepository.findDqexampleszhyt();
            result.setData(sO);
        }
        catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }


    @RequestMapping("/deleteAllByEpId")
    @ResponseBody
    public successResult deleteAllByEpId(HttpServletRequest request){
        successResult result = new successResult();
        try {
            Integer EPId=Integer.parseInt(request.getParameter("EpId"));
            ItbDqExamplesService.deleteByEpId(EPId);
        }
        catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/cxrowvalue")
    public successResult cxrowvalue(){
        successResult result = new successResult();
        try {
            LoginUserInfo Info=CompanyContext.get();
            List<Map<String,Object>> OS=tbIndependenceRepository.findByRowValue(Integer.parseInt(Info.getUserId()),Info.getRowValue());
            result.setData(OS);
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }



    @ResponseBody
    @RequestMapping("/getDqExorderlq")
    public successResult getDqExorderlq(HttpServletRequest request){
        successResult result = new successResult();
        try {
            LoginUserInfo Info=CompanyContext.get();
            Integer s=Integer.parseInt(request.getParameter("DqExclusiveorder"));
            List<Map<String,Object>> OS=tbIndependenceRepository.getDqExorderlq(Integer.parseInt(Info.getUserId()),Integer.parseInt(request.getParameter("DqExclusiveorder")),Info.getRowValue());
            result.setData(OS);
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }
    @ResponseBody
    @RequestMapping("/getDqExorderdy")
    public successResult getDqExorderdy(HttpServletRequest request){
        successResult result = new successResult();
        try {
            LoginUserInfo Info=CompanyContext.get();
            List<Map<String,Object>> OS=tbIndependenceRepository.getDqExorderdy(Integer.parseInt(Info.getUserId()),Integer.parseInt(request.getParameter("DqExclusiveorder")),Info.getRowValue());
            result.setData(OS);
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }



    @ResponseBody
    @RequestMapping("/findAllByTemplateId")
    public successResult findAllByTemplateId(){
        successResult result = new successResult();
        try {
            LoginUserInfo Info=CompanyContext.get();
            Integer findbyId=assistNameRepository.findbyId(Info.getRowValue());
            List<tbTemplateConfig> OS=tbTemplateConfigRepository.findAllByTemplateId(findbyId);
            result.setData(OS);
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/tbDqExamplescxInid")
    public successResult tbDqExamplescxInid(HttpServletRequest request){
        successResult result = new successResult();
        try {
            List<Map<String,Object>> OS=tbDqExamplesRepository.findByInid(Integer.parseInt(request.getParameter("InId")));
            result.setData(OS);
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    int[] n2;
    @ResponseBody
    @RequestMapping("/objListItem")
    public successResult objListItem(HttpServletRequest request){
        successResult result = new successResult();
       try {
          String s =  request.getParameter("selobj");
            String num="";                        //储存连续数字的字符串
            int n1=0,n3=0,n4=0;               //变量，用来进行简单计算
            char[] c_1=s.toCharArray();    //将字符串转化为字符数组
            for (int i = 0; i < c_1.length; i++) {
                int o=Character.getNumericValue(c_1[i]);      //字符转化为数字
                if (o>=0&&o<=9){
                    num=num+c_1[i];        //储存连续数字
                    n4=1;       //用来做下面的if判断

                    if(i!=(c_1.length-1)){       //判断，当达到最后一个时候，不再执行continue；
                       continue;
                    }
                }

                if(n4==1){         //-------------------当n4=1执行
                    n4=0;              //-------------------执行一次 还原为0
                    n1=Integer.parseInt(num);       //将连续数字字符串转化为整型
                    num="";                     //-----------------还原为空
                    int []n2 = new int[n3+1];       //--------创建局部的n2数组
                    if(n3!=0){                 //--------------------/第一次执行因为this.n2没有初始化，所以不执行操作
                        for (int i1 = 0; i1 < this.n2.length; i1++) {
                            n2[i1]=this.n2[i1];    //-------------------当this.n2的length！=0时，首先替换局部n2值
                        }
                    }
                    n2[n3]=n1;     //-----------将最后一个值 传入参数
                    this.n2=n2;    //----------------- 重新覆盖n2数组
                    n3++;
                }
            }
            result.setData(n2);
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }


    @ResponseBody
    @RequestMapping("/UpdateDqExclusiveorderByUserIDANDInId")
    public successResult UpdateDqExclusiveorderByUserIDANDInId(HttpServletRequest request){
        successResult result=new successResult();
        try {
            LoginUserInfo Info=CompanyContext.get();
            ItbIndependenceService.UpdateDqExclusiveorderByUserIDANDInId(Integer.parseInt(Info.getUserId()),Integer.parseInt(request.getParameter("InId")),
                    Integer.parseInt(request.getParameter("ReplaceDqExclus")),request.getParameter("eDqExclusiveorder"), Info.getRowValue());
            ItbIndependenceService.UpdateDqExclusiveorderByUserIDANDInId(Integer.parseInt(Info.getUserId()),Integer.parseInt(request.getParameter("ReplaceDqExclusInId")),
                    Integer.parseInt(request.getParameter("eDqExclusiveorder")),request.getParameter("ReplaceDqExclus"), Info.getRowValue());
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/UpdateFontsize")
    public successResult UpdateFontsize(HttpServletRequest request){
        successResult result=new successResult();
        try {
            LoginUserInfo Info=CompanyContext.get();
            assistNameRepository.UpdateFontsize(Integer.parseInt(request.getParameter("Fontsize")),Integer.parseInt(Info.getRowValue().toString()));
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }


    @ResponseBody
    @RequestMapping("/deleteqlyq")
    public successResult deleteqlyq(HttpServletRequest request){
        successResult result=new successResult();
        try {
            LoginUserInfo Info=CompanyContext.get();
            ItbIndependenceService.deleteByUserIdAndDqExclusiveorderAndRowValue(Integer.parseInt(Info.getUserId()),request.getParameter("DqExclusiveorder"),
                                                                                Info.getRowValue(),Integer.parseInt(request.getParameter("InId")));
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("Numbermatching")
    public successResult Numbermatching(HttpServletRequest request){
        successResult result=new successResult();
        try {
        String Num = "5sdff54sfds4分df545";
        char[] nu=Num.toCharArray();
        String nownum="";
        int j=0;
        for (int i = 0; i < nu.length; i++) {
            if(Integer.valueOf(nu[i])>=48&&Integer.valueOf(nu[i])<=57){
                nownum=nownum+nu[i];
                result.setData(nownum);
            }else{
                if (nownum!="") {
                    j++;
                    Num = Num.replace(nownum, "{" + j + "}");
                }
                nownum = "";
                result.setData(nownum);
            }
            String sp=nownum;
        }
        }catch (Exception ax){
            result.raiseException(ax);
        }

        return result;

    }

    @ResponseBody
    @RequestMapping("/getData")
    public pageObject getData() {
        pageObject result = new pageObject();
        LoginUserInfo Info = CompanyContext.get();
        try {
            result = ItbIndependenceService.getDataWindow(Integer.parseInt(Info.getUserId()),Info.getRowValue());
        } catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/getClaimsType")
    public pageObject getClaimsType() {
        pageObject result = new pageObject();
        try {
            result = ItbIndependenceService.getClaimsType();
        } catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/Claimsinsert")
    public successResult Claimsinsert(HttpServletRequest request) throws Exception {
        successResult result = new successResult();
        tbIndependence res=null;
        LoginUserInfo Info = CompanyContext.get();
        Integer findmaxonlyId=ItbIndependenceService.MaxOnlyId(Integer.parseInt(Info.getUserId()),Info.getRowValue());
        try {
                tbIndependence tbIndependence = new tbIndependence();
                tbIndependence.setUserId(Integer.parseInt(Info.getUserId()));
                tbIndependence.setRowValue(Info.getRowValue());
                tbIndependence.setDqTechnicalsolutions(request.getParameter("DqTechnicalsolutions"));
                tbIndependence.setDqExclusiveorder(request.getParameter("DqExclusiveorder"));
                tbIndependence.setDqNum(request.getParameter("DqNum"));
                tbIndependence.setDqObjectinvention(request.getParameter("DqObjectinvention"));
                tbIndependence.setDqBeneficialeffect(request.getParameter("DqBeneficialeffect"));
                tbIndependence.setOnlyId(findmaxonlyId);
                res = ItbIndependenceService.Save(tbIndependence);
                result.setData(res);
        }
        catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/updtbIndependence")
    public successResult updtbIndependence(HttpServletRequest request) throws Exception {
        successResult result = new successResult();
        try {
            String UpdateField=request.getParameter("UpdateField");
            String data=request.getParameter("data");
            Integer InId=Integer.parseInt(request.getParameter("InId"));
            if (UpdateField.indexOf("Technicalsolutions") > -1){
                tbIndependenceRepository.updateTec(data,InId);
            }else if (UpdateField.indexOf("Objectinvention") > -1){
                tbIndependenceRepository.updateObj(data,InId);
            }else if (UpdateField.indexOf("Beneficialeffect") > -1){
                tbIndependenceRepository.updateBen(data,InId);
            }
        }
        catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }
    @ResponseBody
    @RequestMapping("/updssl")
    public successResult updssl(HttpServletRequest request) throws Exception {
        successResult result = new successResult();
        try {
            String data=request.getParameter("data");
            Integer EpId=Integer.parseInt(request.getParameter("EpId"));
            tbDqExamplesRepository.updateExa(data,EpId);
        }
        catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }


    public void ArrayUpdate(String Data,Integer ID,String UpdateField){
        if (UpdateField.indexOf("Technicalsolutions") > -1){
            tbIndependenceRepository.updateTec(Data,ID);
        }else if (UpdateField.indexOf("Objectinvention") > -1){
            tbIndependenceRepository.updateObj(Data,ID);
        }else if (UpdateField.indexOf("Beneficialeffect") > -1){
            tbIndependenceRepository.updateBen(Data,ID);
        }
    }
    public successResult ArrayUpdateSSL(String Data,Integer ID){
        successResult result = new successResult();
        tbDqExamples dqExamples = new tbDqExamples();
        try {
            tbDqExamplesRepository.updateExa(Data,ID);
        }catch (Exception ax){
            result.setSuccess(false);
            result.setMessage(ax.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/taskquart",method = RequestMethod.POST)
    @ResponseBody
    public successResult TaskQuart(@RequestBody List<String> li, HttpServletRequest request){
        String DigitalSign = "";
        successResult result = new successResult();
        LoginUserInfo Info = CompanyContext.get();
        List<tbDigitalSign> listDigitalSign = digitalSignRepository.findAllByRowValue(Info.getRowValue());
        if (listDigitalSign.size() > 0) {
            for (tbDigitalSign digital : listDigitalSign) {
                DigitalSign = digital.getDigitalSign();
            }
            String regexx = "\\（\\d+\\）";//匹配小括号
            String DigitalContent = "";
            String df1 = request.getParameter("df1");
            String df2 = request.getParameter("df2");
            try {
                for (String Data : li) {
                    String[] Datas = Data.split("&&&");
                    Pattern comp = Pattern.compile(regexx);
                    Matcher mat = comp.matcher(Data);
                    if (mat.find()) {
                        List<String> list = new ArrayList<>();
                        while (mat.find()) {
                            String group = mat.group();
                            list.add(group);
                        }
                        if (list.size() > 0){
                            for (int i=0;i<list.size();i++){
                                String ReAfterContent = "";
                                String group = list.get(i);
                                //获取不带括号的数字
                                String NoQuart = group.trim().replace("（", "").replace("）", "");
                                //通过数字获取标记内容
                                String[] strAlls = df1.split(",");
                                if (strAlls.length > 0) {
                                    for (String strAll : strAlls) {
                                        String[] strCons = strAll.replace("。","").split("、");
                                        if (strCons.length > 0) {
                                            if (NoQuart.equals(strCons[0])) {
                                                String old = strCons[1] + "（" + NoQuart + "）";

                                                String[] strDfs = df2.split(",");
                                                if (strDfs.length > 0) {
                                                    for (String strDf : strDfs) {
                                                        String[] strConDfs = strDf.split("、");
                                                        if (strConDfs.length > 0) {
                                                            if (NoQuart.equals(strConDfs[0])) {
                                                                String news = strConDfs[1] + "（" + NoQuart + "）";
                                                                ReAfterContent = Datas[0].replace(old,news.replace("。",""));
                                                                Datas[0] = ReAfterContent;
                                                            }
                                                        }
                                                    }
                                                }
                                                if (Datas[2].indexOf("Technicalsolutions")>-1 || Datas[2].indexOf("Objectinvention")>-1 || Datas[2].indexOf("Beneficialeffect")>-1) {
                                                    ArrayUpdate(ReAfterContent.substring(0,ReAfterContent.length()-1), Integer.parseInt(Datas[1]), Datas[2]);
                                                }else ArrayUpdateSSL(ReAfterContent.substring(0,ReAfterContent.length()-1),Integer.parseInt(Datas[1]));
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }else {
                        List<String> list = GetDigitalSign(Data);
                        String ReAfterContent = "";
                        for (int i=0;i<list.size();i++) {
                            String NoQuart = list.get(i);
                            //通过数字获取标记内容
                            String[] strAlls = df1.split(",");
                            if (strAlls.length > 0) {
                                for (String strAll : strAlls) {
                                    String[] strCons = strAll.split("、");
                                    if (strCons.length > 0) {
                                        if (NoQuart.equals(strCons[0])) {
                                            String old = strCons[1].replace("。","")+ NoQuart;

                                            String[] strDfs = df2.split(",");
                                            if (strDfs.length > 0) {
                                                for (String strDf : strDfs) {
                                                    String[] strConDfs = strDf.split("、");
                                                    if (strConDfs.length > 0) {
                                                        if (NoQuart.equals(strConDfs[0])) {
                                                            String news = strConDfs[1].replace("。","") + NoQuart;
                                                            ReAfterContent = Datas[0].replace(old,news);
                                                            Datas[0] = ReAfterContent;
                                                        }
                                                    }
                                                }
                                            }
                                            if (Datas[2].indexOf("Technicalsolutions")>-1 || Datas[2].indexOf("Objectinvention")>-1 || Datas[2].indexOf("Beneficialeffect")>-1) {
                                                ArrayUpdate(ReAfterContent.substring(0,ReAfterContent.length()-1), Integer.parseInt(Datas[1]), Datas[2]);
                                            }else ArrayUpdateSSL(ReAfterContent.substring(0,ReAfterContent.length()-1),Integer.parseInt(Datas[1]));
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            } catch (Exception ax) {
                result.setSuccess(false);
                result.setMessage(ax.getMessage());
            }
        }
        return result;
    }

    private List<String> GetDigitalSign(String Datas){
        String[] Data = Datas.split("&&&");
        List<String> list = new ArrayList<>();
        char[] nu=Data[0].toCharArray();
        String nownum="";
        for (int i = 0; i < nu.length; i++) {
            if(Integer.valueOf(nu[i])>=48&&Integer.valueOf(nu[i])<=57){
                nownum=nownum+nu[i];
            }else{
                if (nownum!="") {
                    list.add(nownum);
                }
                nownum = "";
            }
        }
        return list;
    }
}
