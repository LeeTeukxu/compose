package com.zhide.assist.controllers.Template;

import com.alibaba.fastjson.JSON;
import com.aspose.words.*;
import com.zhide.assist.common.*;
import com.zhide.assist.controllers.Product.ProductNameController;
import com.zhide.assist.mapper.IndependenceMapper;
import com.zhide.assist.models.*;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.*;
import com.zhide.assist.services.define.ItbTemplateService;
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

@Controller("Templates")
@RequestMapping("/Template")
public class TemplateController {

    Logger logger = LoggerFactory.getLogger(ProductNameController.class);

    @Autowired
    ItbTemplateService itbTemplateService;

    @Autowired
    tbTemplateDownloadRepository templateDownloadRepository;

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

    @RequestMapping("/getData")
    @ResponseBody
    public pageObject getData(HttpServletRequest request){
        pageObject result = new pageObject();
        try {
            result = itbTemplateService.getData(request);
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping("/templatecenter")
    public String TemplateCenter(Map<String,Object> map){
        LoginUserInfo Info = CompanyContext.get();
        map.put("UserID",Info.getUserIdValue());
        return "/Template";
    }
    @RequestMapping("/setup")
    public String Setup(Map<String,Object> map, String ID, String Mode){
        Optional<tbTemplate> findOne = templateRepository.findById(Integer.parseInt(ID));
        List<tbTemplateConfig> findTwo = templateConfigRepository.findAllByTemplateId(Integer.parseInt(ID));
        map.put("TemplateData",JSON.toJSONString(findOne.get()));
        map.put("TemplateConfigData",JSON.toJSONString(findTwo));
        map.put("Mode",Mode);
        map.put("ID",ID);
        return "/setup";
    }


    @RequestMapping("/savedownloadtemplate")
    @ResponseBody
    public successResult SaveDownLoadTemplate(HttpServletRequest request){
        successResult result = new successResult();
        LoginUserInfo info = CompanyContext.get();
        try {
            String TemplateID = request.getParameter("TemplateID");
            String RowValue = request.getParameter("RowValue");
            tbTemplateDownload templateDownload = new tbTemplateDownload();
            templateDownload.setAssistNameId(Integer.parseInt(RowValue));
            templateDownload.setTemplateId(Integer.parseInt(TemplateID));
            templateDownload.setDownloadNum(0);
            templateDownload.setDownloadTime(new Date());
            templateDownload.setUserId(info.getUserIdValue());
            templateDownloadRepository.save(templateDownload);
        }catch (Exception ax){
            result.setSuccess(false);
            result.setMessage(ax.getMessage());
        }
        return result;
    }

    @RequestMapping("/getMyDownLoadData")
    @ResponseBody
    public pageObject GetMyDownLoadData(HttpServletRequest request){
        pageObject result = new pageObject();
        try {
            result = itbTemplateService.GetMyDownLoadData(request);
        }catch (Exception ax){
            logger.info(ax.getMessage());
        }
        return result;
    }


    @RequestMapping("/download")
    @ResponseBody
    public String DownLoad(HttpServletResponse response, Integer RowValue, String AssistName) throws Exception {
        SC(RowValue);
        FTPUtil util = new FTPUtil();
        String dirPath = util.getPath() + "/doc/sc/" + RowValue + "/Text.doc";
        File file = new File(dirPath);

        DownloadFile(file, AssistName + ".doc", response);
        return "";
    }

    private void SC(Integer RowValue){
        FTPUtil util = new FTPUtil();
        String TemplateFilePath = util.getPath() + "/doc/zlsqsTemplate.doc";
        DocUtils docUtils = new DocUtils();
        String dirFolder = util.getPath() + "/doc/sc/" + RowValue;
        String imgFloderPath = util.getPath();
        docUtils.SC(dirFolder, imgFloderPath, TemplateFilePath, RowValue, assistNameRepository, instructionRepository, technicalFieldRepository, independenceRepository, abstractAttachedRepository, attachedRepository, bgtechnologyRepository, digitalSignRepository, examplesRepository, templateConfigRepository,independenceMapper);
    }

    @RequestMapping("/uploaddowncount")
    @ResponseBody
    public successResult UploadDownCount(HttpServletRequest request){
        successResult result = new successResult();
        tbTemplateDownload templateDownload = new tbTemplateDownload();
        try {
            String ID = request.getParameter("ID");
            Optional<tbTemplateDownload> findOne = templateDownloadRepository.findById(Integer.parseInt(ID));
            if (findOne.isPresent()){
                templateDownload = findOne.get();
                Integer oldCount = templateDownload.getDownloadNum();
                templateDownload.setDownloadNum(oldCount+1);
                EntityHelper.copyObject(templateDownload,findOne.get());
            }
            templateDownloadRepository.save(templateDownload);
        }catch (Exception ax){
            result.setSuccess(false);
            result.setMessage(ax.getMessage());
        }
        return result;
    }

    @RequestMapping("/save")
    @ResponseBody
    public successResult Save(HttpServletRequest request){
        successResult result = new successResult();
        try {
            String Data = request.getParameter("Data");
            String TemplateData = request.getParameter("TemplateData");
            String KT = request.getParameter("KT");
            String JW = request.getParameter("JW");
            String TemplateID = request.getParameter("ID");
            String Mode = request.getParameter("Mode");
            TemplateConfig config = JSON.parseObject(Data,TemplateConfig.class);
            tbTemplate template = JSON.parseObject(TemplateData,tbTemplate.class);
            result.setData(itbTemplateService.Save(config,template,TemplateID,Mode,KT,JW));
        }catch (Exception ax){
            result.setSuccess(false);
            result.setMessage(ax.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/deltetemplate",method = RequestMethod.POST)
    @ResponseBody
    public successResult DelteTemplate(@RequestBody List<Integer> ids){
        successResult result = new successResult();
        try {
            List<tbAssitName> listAssitName = assistNameRepository.findAll();
            for (Integer id : ids){
                Optional<tbAssitName> findOne = listAssitName.stream().filter(f -> f.getTemplateId().equals(id)).findFirst();
                if (findOne.isPresent()){
                    result.setSuccess(false);
                    result.setMessage("您要删除的模板已被专利使用!");
                }else {
                    itbTemplateService.remove(id);
                }
            }
        }catch (Exception ax){
            result.setSuccess(false);
            result.setMessage(ax.getMessage());
        }
        return result;
    }

    @RequestMapping("/downloadfive")
    @ResponseBody
    public successResult DownLoadFive(HttpServletRequest request,HttpServletResponse response){
        successResult result = new successResult();
        try {
            FTPUtil util = new FTPUtil();
            String RowValue = request.getParameter("RowValue");
            String AssistName= request.getParameter("AssistName");
            SC(Integer.parseInt(RowValue));
            String FilePath = util.getPath() + "/doc/sc/" + RowValue + "/Text.doc";
            String SaveFilePath = util.getPath() + "/doc/sc/" + RowValue;
            String WordFolder = SaveFilePath + "/五书/word";
            String PdfFolder = SaveFilePath + "/五书/pdf";
            String WuShuFolder = SaveFilePath + "/五书";
            String ZipName = AssistName + "-五书.zip";
            String ZipPath = SaveFilePath + "/" + ZipName;
            File file1 = new File(WordFolder);
            File file2 = new File(PdfFolder);
            if (!file1.isDirectory()){
                file1.mkdirs();
            }
            if (!file2.isDirectory()){
                file2.mkdirs();
            }
            Document document = new Document(FilePath);
            String docName = "";
            for (int i=0;i<document.getSections().getCount();i++){
                boolean isPic = true;
                if (i == 1 || i == 4){
                    List<tbAttached> listAttached = attachedRepository.findAllByRowValue(Integer.parseInt(RowValue));
                    if (listAttached.size() == 0){
                        isPic = false;
                    }
                }
                Section section = document.getSections().get(i).deepClone();
                Document newDoc = new Document();
                newDoc.getSections().clear();
                Section newSection = (Section) newDoc.importNode(section,true);
                newDoc.getSections().add(newSection);
                docName = FiveName(i);
                if (isPic == true) {
                    newDoc.save(WordFolder + "/" + docName + ".doc");
                    String PdfFile = PdfFolder + "/" + docName + ".pdf";
                    WordToPDF(WordFolder + "/" + docName + ".doc", PdfFile);
                }
            }
            ZipFileUtils.zip(WuShuFolder,ZipPath,true);
            File file3 = new File(ZipPath);
            DownloadFile(file3,ZipName,response);
        }catch (Exception ax){

        }
        return result;
    }

    public static void WordToPDF(String inputFile, String pdfFile){
        try {
            Document originalDoc = new Document(inputFile);
            PdfSaveOptions pso = new PdfSaveOptions();
            pso.setCompliance(PdfCompliance.PDF_15);
            originalDoc.save(pdfFile,pso);
        }catch (Exception ax){

        }
    }

    private String FiveName(Integer Digitinal){
        String Name = "";
        switch (Digitinal){
            case 0:
                Name = "说明书摘要";
                break;
            case 1:
                Name = "摘要附图";
                break;
            case 2:
                Name = "权利要求书";
                break;
            case 3:
                Name = "说明书";
                break;
            case 4:
                Name = "说明书附图";
                break;
            default:
                break;
        }
        return Name;
    }

    private String DownloadFile(File file, String AssistName, HttpServletResponse response) throws Exception{
        if (file.exists() == true) {
//            response.setHeader("content-type", "application/octet-stream");
            response.setHeader("Set-Cookie","fileDownload=true; path=/");
//            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(AssistName, "UTF-8"));
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
            } catch (Exception e) {
                response.getWriter().write(e.getMessage());
                throw e;
            } finally {
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
        } else throw new Exception(file.getPath() + "不存在。");
    }

    @RequestMapping(value = "/enjoy",method = RequestMethod.POST)
    @ResponseBody
    public successResult EnJoy(@RequestBody List<Integer> ids){
        successResult result = new successResult();
        try {
            result.setData(itbTemplateService.EnJoy(ids));
        }catch (Exception ax){
            result.setSuccess(false);
            result.setMessage(ax.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/cancelenjoy",method = RequestMethod.POST)
    @ResponseBody
    public successResult CancelEnJoy(@RequestBody List<Integer> ids){
        successResult result = new successResult();
        try {
            result.setData(itbTemplateService.CancelEnJoy(ids));
        }catch (Exception ax){
            result.setSuccess(false);
            result.setMessage(ax.getMessage());
        }
        return result;
    }
}
