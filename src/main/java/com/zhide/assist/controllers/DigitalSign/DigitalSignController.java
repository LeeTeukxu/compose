package com.zhide.assist.controllers.DigitalSign;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.PathUtils;
import com.zhide.assist.common.UploadUtils;
import com.zhide.assist.common.successResult;
import com.zhide.assist.common.uploadFileResult;
import com.zhide.assist.models.ListDrag;
import com.zhide.assist.models.tbAssitName;
import com.zhide.assist.models.tbAttached;
import com.zhide.assist.models.tbDigitalSign;
import com.zhide.assist.repositorys.tbAttachedRepository;
import com.zhide.assist.services.define.ItbDigitalSignService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.annotations.Mapper;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/DigitalSign")
public class DigitalSignController {
    @Autowired
    ItbDigitalSignService itbDigitalSignService;

    @RequestMapping("/save")
    @ResponseBody
    public successResult Save(HttpServletRequest request,HttpSession session){
        successResult result = new successResult();
        tbDigitalSign res = null;
        try {
            String Data = request.getParameter("Data");
            String DigitalSign = request.getParameter("DigitalSign");
            if (Strings.isEmpty(Data) == false){
                tbDigitalSign tbDigitalSign = JSON.parseObject(Data, tbDigitalSign.class);
                tbDigitalSign.setDigitalSign(DigitalSign);
                List<String> listQuantity= getQuantity(tbDigitalSign.getDigitalSign());
                List<String> listContent = getContent(tbDigitalSign.getDigitalSign());
                List<String> listReserveSplit = ReserveSplit(tbDigitalSign.getDigitalSign());
                Boolean repect = isRepect(listQuantity);
                Boolean contentRepect = conIsRepect(listContent);
                String r = GetDigitalSign(listContent);
                String a = GetReserveSplit(listReserveSplit);
                if (repect == false || contentRepect == false){
                    result.setSuccess(false);
                    result.setMessage("存在重复的数字标记或数字标记内容！");
                }else if(!a.equals("")){
                    result.setSuccess(false);
                    result.setMessage("（" + a + "）标记格式错误，标记内容中不能包含数字。请参照如下格式：1、机架；2、机身。");
                }else
                if(repect == true && contentRepect == true) {
                    res = itbDigitalSignService.Save(tbDigitalSign, session);
                    result.setData(res);
                }
            }else  throw new Exception("数据格式不正确！");
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    private List<String> ReserveSplit(String Data){
        List<String> list = new ArrayList<>();
        /*正则表达式：句子结束符*/
        String regEx="；";
        Pattern p =Pattern.compile(regEx);
        Matcher m = p.matcher(Data);

        /*按照句子结束符分割句子*/
        String[] words = p.split(Data);

        /*将句子结束符连接到相应的句子后*/
        if(words.length > 0)
        {
            int count = 0;
            while(count < words.length)
            {
                if(m.find())
                {
                    words[count] += m.group();
                }
                count++;
            }
        }

        /*输出结果*/
        for(int index = 0; index < words.length; index++)
        {
            list.add(words[index]);
        }
        return list;
    }

    private String GetDigitalSign(List<String> listContent){
        String result = "";
        tab: for (String Content : listContent) {
            char[] nu = Content.toCharArray();
            for (int i = 0; i < nu.length; i++) {
                if (Integer.valueOf(nu[i]) >= 48 && Integer.valueOf(nu[i]) <= 57) {
                    result += Content + "、";
                    break tab;
                }
            }
        }
        if (!result.equals("")) {
            result = result.substring(0, result.length() - 1);
        }
        return result;
    }

    private String GetReserveSplit(List<String> listReserveSplit){
        String result = "";
        tab: for (int i=0;i<listReserveSplit.size();i++){
            char[] nu = listReserveSplit.get(i).toCharArray();
            String tmp = "";
            int q = 0;
            for (int j=0;j<nu.length;j++) {
                if (Integer.valueOf(nu[j]) >= 48 && Integer.valueOf(nu[j]) <= 57) {
                    tmp += nu[j];
                }else {
                    if (!tmp.equals("")) {
                        int beginIndex = j;
                        int endIndex = j + 1;
                        if (q > 0){
                            if (!listReserveSplit.get(i).substring(j-tmp.length()-1,j-tmp.length()).equals("；")){
                                result += listReserveSplit.get(i) + "、";
                                break tab;
                            }
                        }
                        if (!listReserveSplit.get(i).substring(beginIndex, endIndex).equals("、")) {
                            result += listReserveSplit.get(i) + "、";
                            break tab;
                        }
                        q++;
                    }
                    tmp = "";
                }
            }
        }
        if (!result.equals("")) {
            result = result.substring(0, result.length() - 1);
        }
        return result;
    }

    public static List<String> getQuantity(String str){
        Pattern compile = Pattern.compile("\\d+\\、");
        Matcher matcher = compile.matcher(str);
        List<String> list = new ArrayList<>();
        while (matcher.find()) {
            list.add(matcher.group());
        }
        return list;
    }
    public static List<String> getContent(String str){
        List<String> list = new ArrayList<>();
        String[] strs = str.split("；");
        for (int i=0;i<strs.length;i++){
            String[] con = strs[i].split("、");
            if (con.length > 1) {
                list.add(con[1].replaceAll( "[\\pP+~$`^=|<>～｀＄＾＋＝｜＜＞￥×]" , ""));
            }else list.add("");
        }
        return list;
    }

    public static Boolean isRepect(List<String> list){
        Set<String> set = new HashSet<>(list);
        boolean result = list.size() == set.size() ? true:false;
        return result;
    }

    public static Boolean conIsRepect(List<String> list){
        List<String> lists;
        lists = list.stream().filter(f -> !f.equals("")).collect(Collectors.toList());
        Set<String> set = new HashSet<>(lists);
        boolean result = lists.size() == set.size() ? true:false;
        return result;
    }
}
