package com.zhide.assist.controllers.Truth;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.FTPUtil;
import com.zhide.assist.common.pageObject;
import com.zhide.assist.common.successResult;
import com.zhide.assist.models.*;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.ApplicationInfoRepository;
import com.zhide.assist.repositorys.tbTechnologyRepository;
import com.zhide.assist.repositorys.tbTechnologyTemplateRepository;
import com.zhide.assist.repositorys.tbTruthRepository;
import com.zhide.assist.services.define.ICompleteService;
import com.zhide.assist.services.define.ITruthService;
import com.zhide.assist.services.define.ItbMenuListService;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/Truth")
public class TruthController {

    Logger logger = LoggerFactory.getLogger(TruthController.class);

    @Autowired
    ITruthService iTruthService;

    @Autowired
    ItbMenuListService itbMenuListService;

    @Autowired
    ApplicationInfoRepository applicationInfoRepository;

    @Autowired
    ICompleteService completeService;

    @Autowired
    tbTruthRepository truthRepository;

    @Autowired
    tbTechnologyTemplateRepository technologyTemplateRepository;

    @RequestMapping("/hometruthgrid")
    public String TruthGrid(Map<String, Object> model, HttpServletRequest request) {
        String State = request.getParameter("State");
        model.put("State",State);
        return "/Truth/grid/Hometruthgrid";
    }

    @RequestMapping("/truthgird")
    public String TrtuhGrid(Map<String, Object> model, String JumpPage, String Modal, String AlertInfo) {
        model.put("JumpPage",JumpPage!=null?JumpPage:"");
        model.put("Modal",Modal!=null?Modal:"");
        model.put("AlertInfo",AlertInfo!=null?AlertInfo:"");
        return "/Truth/grid/Truthgrid";
    }

    @RequestMapping("/getData")
    @ResponseBody
    public pageObject getData(HttpServletRequest request){
        pageObject result = new pageObject();
        try {
            result = iTruthService.getData(request);
        }catch (Exception ax){
            logger.info(ax.getMessage());
        }
        return result;
    }

    @RequestMapping("/truthtemplateindex")
    public String TruthTemplateIndex(String Mode, String TechnologyID, Map<String, Object> model) {
        List<tbTruthMenuList> firstMenu = getMenu();
        model.put("firsts", firstMenu);
        model.put("Mode", Mode);
        model.put("TechMainID", "0");
        model.put("TechnologyID", TechnologyID);
        tbTechnologyTemplate technologyTemplate = technologyTemplateRepository.findAllByTechnologyId(Integer.parseInt(TechnologyID));
        model.put("TechnologyTemplate", JSON.toJSONString(technologyTemplate));
        return "/Truth/main/shared/index";
    }

    private List<tbTruthMenuList> getMenu(){
        List<tbTruthMenuList> allMenus = null;
        allMenus = itbMenuListService.getVisibleTruthMenus();
        List<tbTruthMenuList> childs = allMenus.stream().filter(f -> f.getPid()>0).collect(Collectors.toList());
        for (int i=0;i<childs.size();i++){
            tbTruthMenuList child = childs.get(i);
            String url = child.getUrl();
            String pageName = child.getPageName();
            if (StringUtils.isEmpty(pageName) == false){
                if (url.indexOf("?") > -1){
                    url += "&pageName=" + pageName;
                }else url += "?pageName=" + pageName;
            }
            child.setUrl(url);
        }
        List<tbTruthMenuList> firstMenu = allMenus.stream().
                filter(f -> f.getPid() > 0).
                collect(Collectors.toList());
        firstMenu.stream().forEach(f ->{
            String url = f.getUrl();
            if (url.indexOf("?") == -1) f.setUrl(url + "?MenuID=" + Integer.toString(f.getPid()));
            else f.setUrl(url + "&MenuID=" + Integer.toString(f.getFid()));
        });
        return firstMenu;
    }

    @RequestMapping(value = "/updateTime",method = RequestMethod.POST)
    @ResponseBody
    public successResult UpdateTime() {
        LoginUserInfo Info = CompanyContext.get();
        successResult result = new successResult();
        try {
            iTruthService.UpdateTime();
        }catch (Exception ax) {
            result.raiseException(ax);
            result.setSuccess(false);
        }
        return result;
    }

    @RequestMapping("/editTruth")
    public String EditTruth(int TechMainID, String TechnologyID, Map<String,Object> model) {
        List<tbTruthMenuList> firstMenu = getMenu();
        model.put("firsts", firstMenu);
        model.put("Mode", "Edit");
        model.put("TechMainID", TechMainID);
        model.put("TechnologyID", TechnologyID);
        tbTechnologyTemplate technologyTemplate = technologyTemplateRepository.findAllByTechnologyId(Integer.parseInt(TechnologyID));
        model.put("TechnologyTemplate", JSON.toJSONString(technologyTemplate));
        return "/Truth/main/shared/index";
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    @ResponseBody
    public successResult Remove(@RequestBody List<Integer> ids, HttpServletRequest request) {
        successResult result = new successResult();
        try {
            String State = request.getParameter("State");
            iTruthService.remove(ids, State);
        }catch (Exception ax) {
            result.setSuccess(false);
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping("/download")
    @ResponseBody
    public void DownLoad(String TechMainID, String Name, HttpServletResponse response) throws Exception {
        try {
            completeService.Generate(TechMainID);
            FTPUtil util = new FTPUtil();
            String path = util.getPath() + "/truthdoc/sc/" + TechMainID + "/file.doc";
            File file = new File(path);

            DownLoadFile(file, Name + ".doc", response);
        }catch (Exception ax) {
            try {
                response.getWriter().write(ax.getMessage());
            }catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    public String DownLoadFile(File file, String Name, HttpServletResponse response) throws Exception {
        if (file.exists() == true) {
            response.setHeader("Set-Cookie", "fileDownload=true; path=/");
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(Name, "UTF-8"));
            byte[] buffer = new byte[1024];
            FileInputStream fis = null;
            BufferedInputStream bis = null;
            try {
                fis = new FileInputStream(file);
                bis = new BufferedInputStream(fis);
                OutputStream os = response.getOutputStream();
                int i = bis.read(buffer);
                while (i != -1) {
                    os.write(buffer, 0, i);
                    i = bis.read(buffer);
                }
                return "";
            }catch (Exception e) {
                response.getWriter().write(e.getMessage());
                throw e;
            }finally {
                if (bis != null) {
                    try {
                        bis.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                if (fis != null) {
                    try {
                        fis.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }else throw new Exception(file.getPath() + "不存在。");
    }

    @RequestMapping("/updatedowncount")
    @ResponseBody
    public successResult UpdateDownCount(HttpServletRequest request) {
        successResult result = new successResult();
        tbTruth truth = new tbTruth();
        try {
            String TruthID = request.getParameter("TruthID");
            Optional<tbTruth> findOne = truthRepository.findById(Integer.parseInt(TruthID));
            if (findOne.isPresent()) {
                truth = findOne.get();
                Integer OldCount = truth.getDownloadNum();
                truth.setDownloadNum(OldCount+1);
                truth.setDownloadTime(new Date());
            }
            tbTruth tbTruth = truthRepository.save(truth);
            result.setData(tbTruth);
        }catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping("/copy")
    @ResponseBody
    public successResult Copy(HttpServletRequest request) {
        successResult result = new successResult();
        try {
            List<Integer> listTruthIDS = JSON.parseArray(request.getParameter("ids"), Integer.class);
            List<Integer> listTechsMainIDS = JSON.parseArray(request.getParameter("TechMainIDS"), Integer.class);
            iTruthService.Copy(listTruthIDS, listTechsMainIDS);
        }catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping(value = "/reback",method = RequestMethod.POST)
    @ResponseBody
    public successResult ReBack(@RequestBody List<Integer> ids){
        successResult result = new successResult();
        try {
            iTruthService.reback(ids);
        }catch (Exception ax){
            result.setSuccess(false);
            result.raiseException(ax);
        }
        return result;
    }
}
