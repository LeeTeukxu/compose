package com.zhide.assist.controllers;

import com.aspose.words.*;
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.zhide.assist.common.DocUtils;
import com.zhide.assist.common.PathUtils;
import com.zhide.assist.common.ZipFileUtils;
import org.apache.commons.io.FileUtils;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/Tool")
public class ToolController {
    @RequestMapping(value = "/sendwushu",method = RequestMethod.POST)
    @ResponseBody
    public void SendWuShu(@RequestParam("file") MultipartFile file,  HttpServletResponse response){
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");//防止乱码
        try {
            String fileName = file.getOriginalFilename();
            String[] exts = fileName.split("\\.");
            String extName = exts[exts.length - 1];
            String uuId= UUID.randomUUID().toString();
            String uploadFileName =uuId + "." + extName;
            setNewcode();
            String RanCode = Integer.toString(getNewcode());
            String targetFile = PathUtils.getFullPath("/Tool/" + RanCode, uploadFileName);
            File fx = new File(targetFile);
            FileUtils.writeByteArrayToFile(fx, file.getBytes());
            if (fx.exists()){
                response.getWriter().print("suceess;");
                response.getWriter().print(exts[0] + ";");
                response.getWriter().print(extName + ";");
                response.getWriter().print(RanCode + ";");
                response.getWriter().print(fx.toString());
            }else {
                response.getWriter().print("false;");
                response.getWriter().print(fx.toString());
            }
        }catch (Exception ax){

        }
    }
    private String DownloadFile(File file, String FileName, HttpServletResponse response) throws Exception{
        if (file.exists() == true) {
//            response.setHeader("content-type", "application/octet-stream");
            response.setHeader("Set-Cookie","fileDownload=true; path=/");
//            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(FileName, "UTF-8"));
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

    @RequestMapping("/download")
    @ResponseBody
    private void DownloadFive(String FilePath, String FileName, String RanCode, HttpServletResponse response) throws Exception{
        if (!getLicense()){
            return;
        }
        String SaveFilePath = "C:/AssistFtp/Tool/" + RanCode;
        String WordFolder = SaveFilePath + "/五书/word";
        String PdfFolder = SaveFilePath + "/五书/pdf";
        String WuShuFolder = SaveFilePath + "/五书";
        String ZipName = FileName + "-五书.zip";
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
            Section section = document.getSections().get(i).deepClone();
            Document newDoc = new Document();
            newDoc.getSections().clear();
            Section newSection = (Section) newDoc.importNode(section,true);
            newSection.getBody().getFirstParagraph().getParagraphFormat().getStyle().getFont().setName("宋体");
            newDoc.getSections().add(newSection);
            docName = FiveName(i);
            String DocPath = WordFolder + "/" + docName + ".doc";
            newDoc.save(DocPath);
            String PdfFile = PdfFolder + "/" + docName + ".pdf";
            WordToPDF(WordFolder + "/" + docName + ".doc", PdfFile);
        }
        ZipFileUtils.zip(WuShuFolder,ZipPath,true);
        File file3 = new File(ZipPath);
        DownloadFile(file3, ZipName, response);
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

    public static void WordToPDF(String inputFile, String pdfFile){
//        ActiveXComponent app = null;
//        try {
//            app = new ActiveXComponent("Word.Application");
//            // 获得word中所有打开的文档
//            Dispatch documents = app.getProperty("Documents").toDispatch();
//            // 打开文档
//            Dispatch document = Dispatch.call(documents, "Open", inputFile, false, true).toDispatch();
//            // 另存为，将文档报错为pdf，其中word保存为pdf的格式宏的值是17
//            Dispatch.call(document, "SaveAs", pdfFile, 17);
//            // 关闭文档
//            Dispatch.call(document, "Close", false);
//        }catch (Exception ax){
//            ax.getMessage();
//        }finally {
//            app.invoke("Quit", 0);
//        }
        try {
            Document originalDoc = new Document(inputFile);
            PdfSaveOptions pso = new PdfSaveOptions();
            pso.setCompliance(PdfCompliance.PDF_15);
            originalDoc.save(pdfFile,pso);
        }catch (Exception ax) {

        }
    }

    protected static boolean getLicense(){
        boolean result = false;
        try {
            InputStream is = DocUtils.class.getClassLoader().getResourceAsStream("license.xml");
            License aposeLic = new License();
            aposeLic.setLicense(is);
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    private static int newcode;
    public static int getNewcode() {
        return newcode;
    }
    public static void setNewcode(){
        newcode = (int)(Math.random()*9999)+100;  //每次调用生成一次四位数的随机数
    }
}
