package com.zhide.assist.controllers.CompleteFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.zhide.assist.common.*;
import com.zhide.assist.mapper.IndependenceMapper;
import com.zhide.assist.models.*;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.*;
/*import com.zhuozhengsoft.pageoffice.FileSaver;
import com.zhuozhengsoft.pageoffice.OpenModeType;
import com.zhuozhengsoft.pageoffice.PageOfficeCtrl;*/
import com.zhide.assist.services.define.ICompleteService;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.html.Option;
import java.io.*;
import java.net.InetAddress;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/CompleteFile")
public class CompleteFileController {

    @Autowired
    tbAssistNameRepository assistNameRepository;

    @Autowired
    tbInstructionRepository instructionRepository;

    @Autowired
    tbTechnicalFieldRepository technicalFieldRepository;

    @Autowired
    tbIndependenceRepository independenceRepository;

    @Autowired
    tbAbstractAttachedRepository abstractAttachedRepository;

    @Autowired
    tbAttachedRepository attachedRepository;

    @Autowired
    tbBgtechnologyRepository bgtechnologyRepository;

    @Autowired
    tbDigitalSignRepository digitalSignRepository;

    @Autowired
    tbDqExamplesRepository examplesRepository;

    @Autowired
    tbTemplateRepository templateRepository;

    @Autowired
    tbTemplateConfigRepository templateConfigRepository;

    @Autowired
    IndependenceMapper independenceMapper;

    @Autowired
    ICompleteService completeService;

    @Value("${posyspath}")
    private String poSysPath;

    @Value("${pdfpath}")
    private String PdfPath;

    Logger logger = LoggerFactory.getLogger(CompleteFileController.class);

    @RequestMapping("/index")
    public String Index(Map<String, Object> model){
        LoginUserInfo Info = CompanyContext.get();
//        String TemplateFilePath = this.getClass().getClassLoader().getResource("static").getPath() + "/doc/zlsqsTemplate.doc";
//        DocUtils docUtils = new DocUtils();
//        String dirFolder = this.getClass().getClassLoader().getResource("static").getPath() + "/doc/sc/" + Info.getRowValue();
//        String imgFloderPath = this.getClass().getClassLoader().getResource("static").getPath() + "/AssistImg";
//        docUtils.SC(dirFolder, imgFloderPath.substring(1), TemplateFilePath.substring(1), Info.getRowValue(), assistNameRepository, instructionRepository, technicalFieldRepository, independenceRepository, abstractAttachedRepository, attachedRepository, bgtechnologyRepository, digitalSignRepository, examplesRepository, templateConfigRepository);

        String IPAddress = getIPAddress();
        model.put("IPAddress",IPAddress);
        model.put("RowValue", Info.getRowValue());
        model.put("PdfPath", PdfPath);
        return "/CompleteFile/index";
    }

    @RequestMapping("/responsefile")
    @ResponseBody
    public successResult ResponseFile(HttpServletResponse response){
        successResult result = new successResult();
        try {
            LoginUserInfo Info = CompanyContext.get();
            FTPUtil util = new FTPUtil();
            String TemplateFilePath = util.getPath() + "/doc/zlsqsTemplate.doc";
            DocUtils docUtils = new DocUtils();
            String dirFolder = util.getPath() + "/doc/sc/" + Info.getRowValue();
            String imgFloderPath = util.getPath();
            docUtils.SC(dirFolder, imgFloderPath, TemplateFilePath, Info.getRowValue(), assistNameRepository, instructionRepository, technicalFieldRepository, independenceRepository, abstractAttachedRepository, attachedRepository, bgtechnologyRepository, digitalSignRepository, examplesRepository, templateConfigRepository,independenceMapper);
        }catch (Exception ax){
            result.setSuccess(false);
            result.setMessage(ax.getMessage());
        }
        return result;
    }

    @RequestMapping("/templatebrowse")
    public ModelAndView TemplateBrowse(Map<String,Object> model, String TemplateID, Integer RowValue){
        tbTemplate template = templateRepository.findAllById(Integer.parseInt(TemplateID));
        String TemplateFilePath = template.getTemplatePath();
        DocUtils docUtils = new DocUtils();
        FTPUtil util = new FTPUtil();
        String dirFolder = util.getPath() + "/doc/sc/" + RowValue;
        String imgFloderPath = util.getPath() + "/Assist";
        docUtils.SC(dirFolder, imgFloderPath, TemplateFilePath, RowValue, assistNameRepository, instructionRepository, technicalFieldRepository, independenceRepository, abstractAttachedRepository, attachedRepository, bgtechnologyRepository, digitalSignRepository, examplesRepository, templateConfigRepository,independenceMapper);

        String IPAddress = getIPAddress();
        model.put("IPAddress",IPAddress);
        model.put("RowValue",RowValue);
        model.put("PDF",dirFolder+ "/finalPDF.pdf");
        ModelAndView mv = new ModelAndView("/CompleteFile/index");
        return mv;
    }

    public String getIPAddress(){
        InetAddress netAddress = null;
        try {
            netAddress = InetAddress.getLocalHost();
        }catch (Exception ax){
            logger.info(ax.getMessage());
        }
        return netAddress.getHostAddress();
    }


    @RequestMapping("/pdfisexists")
    @ResponseBody
    public successResult PdfIsExists(){
        successResult result = new successResult();
        LoginUserInfo Info = CompanyContext.get();
        try {
            FTPUtil util = new FTPUtil();
            String Folder = util.getPath() + "/doc/sc/" + Info.getRowValue() + "/finalPDF.pdf";
            File file = new File(Folder);
            if (file.exists()){
                result.setData("true");
            }else result.setData("false");
        }catch (Exception ax){
            result.setSuccess(false);
            result.setMessage("生成预览文件失败,请重新生成!");
        }
        return result;
    }

    /**

     * 添加PageOffice的服务器端授权程序Servlet（必须）

     * @return

     */

/*    @Bean

    public ServletRegistrationBean servletRegistrationBean() {

        com.zhuozhengsoft.pageoffice.poserver.Server poserver = new com.zhuozhengsoft.pageoffice.poserver.Server();

        //设置PageOffice注册成功后,license.lic文件存放的目录

        poserver.setSysPath(poSysPath);

        ServletRegistrationBean srb = new ServletRegistrationBean(poserver);

        srb.addUrlMappings("/poserver.zz");
        srb.addUrlMappings("/posetup.exe");
        srb.addUrlMappings("/pageoffice.js");
        srb.addUrlMappings("/jquery.min.js");
        srb.addUrlMappings("/pobstyle.css");
        srb.addUrlMappings("/sealsetup.exe");

        return srb;//

    }

    @RequestMapping(value="/word", method= RequestMethod.GET)
    public ModelAndView showWord(HttpServletRequest request, Map<String,Object> model){

        PageOfficeCtrl poCtrl=new PageOfficeCtrl(request);
        poCtrl.setServerPage("/poserver.zz");//设置服务页面
        poCtrl.addCustomToolButton("保存","Save",1);//添加自定义保存按钮、
        poCtrl.setSaveFilePage("/save");//设置处理文件保存的请求方法
        //打开word
        poCtrl.webOpen("e:\\test.doc",OpenModeType.docAdmin,"张三");
        model.put("pageoffice",poCtrl.getHtmlCode("PageOfficeCtrl1"));

        ModelAndView mv = new ModelAndView("/CompleteFile/Word");
        return mv;
    }

    @RequestMapping("/save")
    public void saveFile(HttpServletRequest request, HttpServletResponse response){
        FileSaver fs = new FileSaver(request, response);
        fs.saveToFile("d:\\" + fs.getFileName());
        fs.close();
    }*/

    @RequestMapping("/truthComplete")
    public String TruthComplete(String TechMainID, Map<String, Object> model) throws Exception {
        model.put("TechMainID", TechMainID);
        model.put("PdfPath", PdfPath);
        completeService.Generate(TechMainID);
        return "/Truth/main/complete/index";
    }
}
