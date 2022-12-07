package com.zhide.assist.controllers;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.*;
import com.zhide.assist.models.*;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbAssistNameRepository;
import com.zhide.assist.repositorys.tbAttachedRepository;
import com.zhide.assist.repositorys.tbDigitalSignRepository;
import com.zhide.assist.repositorys.tbLoginUserRepository;
import com.zhide.assist.services.define.ItbMenuListService;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.*;
import java.util.stream.Collectors;

@Controller
public class HomeController {

    @Autowired
    ItbMenuListService itbMenuListService;

    @Autowired
    tbAssistNameRepository assistNameRepository;

    @Autowired
    tbLoginUserRepository loginUserRepository;

    @Autowired
    tbAttachedRepository attachedRepository;

    @Autowired
    tbDigitalSignRepository digitalSignRepository;

    Logger logger = LoggerFactory.getLogger(HomeController.class);

    @RequestMapping("/")
    public String FirstPage(HttpServletResponse response) throws Exception{
        Subject user= SecurityUtils.getSubject();
        if(user.isAuthenticated()) {
           return "location";
        }
        else {
            return "login";
        }
    }

    @RequestMapping("/index")
    public String Index(Map<String,Object> model, String Mode, HttpServletRequest request){
        List<tbMenuList>  firstMenu = getMenu();
        model.put("firsts",firstMenu);
        model.put("Mode",Mode);
        return "index";
    }

    @RequestMapping("/editAssistName")
    public String EditAssistName(int ID,Map<String,Object> model, HttpServletResponse response){
        List<tbMenuList>  firstMenu = getMenu();
        model.put("firsts",firstMenu);
        model.put("Mode","Edit");
        Optional<tbAssitName> findtb = assistNameRepository.findById(ID);
        if (findtb.isPresent()){
            model.put("LoadData", JSON.toJSONString(findtb.get()));
        }else model.put("LoadData","{}");
        ftpdowload(response);
        return "index";
    }

    //上传完图片从ftp下载到本地
    public successResult ftpdowload(HttpServletResponse response){
        successResult result = new successResult();
        try {
            LoginUserInfo Info = CompanyContext.get();
            List<tbAttached> listAtt = attachedRepository.findAllByRowValue(Info.getRowValue());
            if (listAtt.size() > 0) {
                for (tbAttached att : listAtt) {
                    FTPUtil util = new FTPUtil();
                    String saveFilePath = util.getPath() + "/Assist/" + att.getPath();
                    ftpConnect(att.getPath(), saveFilePath,att.getId());
                    //设置图片宽和高
//                    Thumbnails.of(saveFilePath).size(462,686).toFile(saveFilePath);
                }
            }
            FTPUtil util = new FTPUtil();
            String imgPath = util.getPath() + "/Assist";
            String strContent = OCRUtil.OCR(listAtt,imgPath,digitalSignRepository);
            strContent = strContent.replace(".","、；");
            Cookie cookie = new Cookie("OCRContent",strContent);
            cookie.setMaxAge(Integer.MAX_VALUE);
            response.addCookie(cookie);
        }catch (Exception ax){
            logger.info(ax.getMessage());
        }
        return result;
    }

    public void ftpConnect(String filePath,String saveFilePath,Integer attId) throws Exception{
        FTPUtil util = new FTPUtil();
        if (util.connect()==true) {
            File file = new File("C:\\AssistFtp\\Temp\\"+filePath.replace("/Assist/",""));
            if (file.exists()) {
                saveFilePath = saveFilePath.substring(0,saveFilePath.lastIndexOf(".")) + ".jpg";
                util.download(filePath, saveFilePath);
                tbAttached attached = new tbAttached();
                Optional<tbAttached> findOne = attachedRepository.findById(attId);
                if (findOne.isPresent()){
                    attached = findOne.get();
                    attached.setPath(attached.getPath().substring(0,attached.getPath().lastIndexOf("."))+".jpg");
                    EntityHelper.copyObject(attached,findOne.get());
                }
                attachedRepository.save(attached);
            }
        }else {
            logger.info("FTP登录失败!");
        }
    }

    @RequestMapping("/homegrid")
    public String Homegrid(Map<String,Object> model, HttpServletRequest request){
        String State = request.getParameter("State");
        model.put("State",State);
        return "Homegrid";
    }

    @RequestMapping("/accountsettings")
    public String AccountSettings(Map<String,Object> model){
        LoginUserInfo Info = CompanyContext.get();
        tbLoginUser loginUser = loginUserRepository.findAllByUserId(Info.getUserIdValue());
        model.put("WX",loginUser.getWxOpenId()!=null?loginUser.getWxOpenId():"");
        model.put("QQ",loginUser.getQqOpenId()!=null?loginUser.getQqOpenId():"");
        model.put("PHONE",loginUser.getLoginCode()!=null?loginUser.getLoginCode():"");
        model.put("WXName",loginUser.getWxNickName()!=null?loginUser.getWxNickName():"");
        model.put("QQName",loginUser.getQqNickName()!=null?loginUser.getQqNickName():"");
        return "AccountSettings";
    }

    @RequestMapping("/grid")
    public String Grid(Map<String,Object> model, String JumpPage, String Modal, String AlertInfo){
        model.put("JumpPage",JumpPage!=null?JumpPage:"");
        model.put("Modal",Modal!=null?Modal:"");
        model.put("AlertInfo",AlertInfo!=null?AlertInfo:"");
        return "grid";
    }

    @RequestMapping("/categorySelection")
    public String CategorySelection(Map<String, Object> model, String JumpPage, String Modal, String AlertInfo) {
        model.put("JumpPage", JumpPage!=null?JumpPage:"");
        model.put("Modal", Modal!=null?Modal:"");
        model.put("AlertInfo", AlertInfo!=null?Modal:"");
        return "CategorySelection";
    }

    @RequestMapping("/downloadtemplate")
    public String Downloadtemplate(String RowValue, Map<String,Object> model){
        model.put("RowValue", RowValue);
        model.put("Type", "DownLoad");
        return "/Template/downloadtemplate";
    }

    @RequestMapping("/browsetemplate")
    public String BrowseTemplate(Map<String,Object> model){
        LoginUserInfo Info = CompanyContext.get();
        model.put("RowValue", Info.getRowValue());
        model.put("Type", "Browse");
        return "/Template/downloadtemplate";
    }

    @RequestMapping("/mydownloads")
    public String MyDownloads(Map<String,Object> model){
        return "MyDownloads";
    }

    private List<tbMenuList> getMenu(){
        List<tbMenuList> allMenus = null;
        allMenus = itbMenuListService.getVisibleMenus();
        List<tbMenuList> childs = allMenus.stream().filter(f -> f.getPid()>0).collect(Collectors.toList());
        for (int i=0;i<childs.size();i++){
            tbMenuList child = childs.get(i);
            String url = child.getUrl();
            String pageName = child.getPageName();
            if (StringUtils.isEmpty(pageName) == false){
                if (url.indexOf("?") > -1){
                    url += "&pageName=" + pageName;
                }else url += "?pageName=" + pageName;
            }
            child.setUrl(url);
        }
        List<tbMenuList> firstMenu = allMenus.stream().
                filter(f -> f.getPid() > 0).
                collect(Collectors.toList());
        firstMenu.stream().forEach(f ->{
            String url = f.getUrl();
            if (url.indexOf("?") == -1) f.setUrl(url + "?MenuID=" + Integer.toString(f.getPid()));
            else f.setUrl(url + "&MenuID=" + Integer.toString(f.getFid()));
        });
        return firstMenu;
    }
}
