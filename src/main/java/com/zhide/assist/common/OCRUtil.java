package com.zhide.assist.common;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbAttached;
import com.zhide.assist.models.tbDigitalSign;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbDigitalSignRepository;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class OCRUtil {

    static final String WEBOCR_URL = "http://webapi.xfyun.cn/v1/service/v1/ocr/general";

    static final String APPID = "2be7d50d";

    static final String API_KEY = "b771758a8ef8189ce90a6e8dddea787d";

    static final String LOCATION = "false";

    static final String LANGUAGE = "en";

    public static String OCR(List<tbAttached> list, String imgPath, tbDigitalSignRepository digitalSignRepository) throws IOException{
        LoginUserInfo Info = CompanyContext.get();
        StringBuilder strContent = new StringBuilder();
        for (tbAttached att : list) {
            Map<String, String> header = buildHttpHeader();
            byte[] imageByteArray = FileUtil.read(imgPath + att.getPath());
            String imageBase64 = new String(Base64.encodeBase64(imageByteArray), "UTF-8");
            String result = HttpUtil.doPost1(WEBOCR_URL, header, "image=" + URLEncoder.encode(imageBase64, "UTF-8"));
            System.out.println("OCR WebAPI 接口调用结果：" + result);
            JSONObject jsonObject = JSON.parseObject(result);
            JSONArray array = jsonObject.getJSONObject("data").getJSONArray("block").getJSONObject(0).getJSONArray("line");
            for (int i = 0; i < array.size(); i++) {
                String Content = ((JSONObject) array.get(i)).getJSONArray("word").getJSONObject(0).get("content").toString();
                char[] nu = Content.toCharArray();
                String nownum = "";
                int j = 0;
                for (int x=0;x<nu.length;x++){
                    if (Integer.valueOf(nu[x]) >= 48 && Integer.valueOf(nu[x]) <= 57){
                        nownum = nownum + nu[x];
                        j++;
                    }else {
                        if (j > 0){
                            nownum +=".";
                        }else nownum += "$";
                    }

                }
                nownum = nownum.replace("$","");
                if (!nownum.equals("")) {
                    if (nownum.charAt(nownum.length() - 1) != '.') {
                        nownum += ".";
                    }
                }
                strContent.append(nownum);
            }
        }
        //1.2.4.11.31.32.33.41.42.43.51.52.61.62.63.311.312.313.321.322.511.513.3131
        //1、桌脚；2、桌面；3、加热装置；4、控制盒；5、显示模块；6、电源线；15、可视区；1503、控制按钮。154、未知；
        String sqlDigital = "";
        String sqlDigitals = "";
        List<tbDigitalSign> listDigitalSign = digitalSignRepository.findAllByRowValue(Info.getRowValue());
        if (listDigitalSign.size() > 0){
            for (tbDigitalSign dig : listDigitalSign){
                sqlDigital = dig.getDigitalSign();
            }
        }
        if (sqlDigital != "") {
            String[] s = sqlDigital.split("；");
            for (int y = 0; y < s.length; y++) {
                String t = s[y];
                String[] r = t.split("、");
                sqlDigitals += r[0] + ".";
            }
        }
        String[] array1 = strContent.toString().split("[.]");
        String[] array2 = sqlDigitals.split("[.]");
        String strContentValue = "";
        Arrays.sort(array1);
        Arrays.sort(array2);
        int len = array1.length;
        for (int i = 0; i < len; i++)
        {
            int s = Arrays.binarySearch(array2, array1[i]);
            System.out.print(array1[i]+":"+s+" ");
            if ( s<0)
            {
                strContentValue += array1[i] + ".";
            }
        }
        strContentValue = strContentValue.substring(0,strContentValue.length()-1);
        String finalContent = contentSort(strContentValue);
        return finalContent;
    }

    private static String contentSort(String strContent){
        HashSet<Integer> set = new HashSet<Integer>();
        for (int i=0;i<strContent.split("[.]").length;i++){
            set.add(Integer.parseInt(strContent.split("[.]")[i]));
        }
        List<Integer> list = new ArrayList<>();
        list.addAll(set);
        Collections.sort(list);
        String finlList = StringUtils.join(list,".");
        return finlList;
    }

    private static Map<String,String> buildHttpHeader() throws UnsupportedEncodingException {
        String curTime = System.currentTimeMillis() / 1000L + "";
        String param = "{\"location\":\"" + LOCATION + "\",\"language\":\"" + LANGUAGE + "\"}";
        String paramBase64 = new String(Base64.encodeBase64(param.getBytes("UTF-8")));
        String checkSum = DigestUtils.md5Hex(API_KEY + curTime + paramBase64);
        Map<String,String> header = new HashMap<String, String>();
        header.put("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
        header.put("X-Param", paramBase64);
        header.put("X-CurTime", curTime);
        header.put("X-CheckSum", checkSum);
        header.put("X-Appid", APPID);
        return header;
    }
}
