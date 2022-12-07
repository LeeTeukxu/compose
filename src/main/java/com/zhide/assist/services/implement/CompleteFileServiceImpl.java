package com.zhide.assist.services.implement;

import com.aspose.words.License;
import com.aspose.words.SaveFormat;
import com.zhide.assist.common.DocUtils;
import com.zhide.assist.common.FTPUtil;
import com.zhide.assist.models.*;
import com.zhide.assist.repositorys.*;
import com.zhide.assist.services.define.ICompleteService;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.*;

@Service
public class CompleteFileServiceImpl implements ICompleteService {

    @Autowired
    TechMainRepository techMainRepository;

    @Autowired
    TechSubjectRepository techSubjectRepository;

    @Autowired
    TechBackgroundRepository techBackgroundRepository;

    @Autowired
    TechImproveMainRepository techImproveMainRepository;

    @Autowired
    TechImproveDetailRepository techImproveDetailRepository;

    @Autowired
    tbTechnicalFieldRepository technicalFieldRepository;

    @Autowired
    tbAttachedRepository attachedRepository;

    @Override
    public void Generate(String TechMainID) throws Exception {
        Map<String, Object> model = new HashMap<>();
        Optional<TechMain> findMain = techMainRepository.findById(Integer.parseInt(TechMainID));
        Optional<TechSubject> findSub = techSubjectRepository.findByTechMainId(Integer.parseInt(TechMainID));
        Optional<tbTechnicalField> findTech = technicalFieldRepository.findByRowValue(Integer.parseInt(TechMainID));
        Optional<TechBackground> findBack = techBackgroundRepository.findByTechMainId(Integer.parseInt(TechMainID));
        Optional<TechImproveMain> findImpMain = techImproveMainRepository.findByTechMainId(Integer.parseInt(TechMainID));
        List<tbAttached> listAtt = attachedRepository.getAllByRowValueAndTypeOrderBySort(Integer.parseInt(TechMainID), "Img");
        if (findMain.isPresent()) {
            model.put("TechStatus", findMain.get().getTechStatus());
            model.put("ApplyTarget", findMain.get().getApplyTarget());
            model.put("ApplyType", findMain.get().getApplyType());
            model.put("SQR", findMain.get().getShenqingrxm());
            model.put("Writer", findMain.get().getWriter());
            model.put("LinkPhone", findMain.get().getLinkPhone());
            model.put("LinkMail", findMain.get().getLinkMail());
            model.put("Others", findMain.get().getOthers());
        }else {
            model.put("TechStatus", 0);
            model.put("ApplyTarget", 0);
            model.put("ApplyType", 0);
            model.put("SQR", "");
            model.put("Writer", "");
            model.put("LinkPhone", "");
            model.put("LinkMail", "");
            model.put("Others", "");
        }
        if (findSub.isPresent()) {
            model.put("SubName", findSub.get().getName());
        }else model.put("SubName", "");
        if (findTech.isPresent()) {
            model.put("TechnicalField", findTech.get().getTechnicalField());
        }else model.put("TechnicalField", "");
        if (findBack.isPresent()) {
            model.put("listBack", getBack(findBack.get().getTechContent()));
        }else model.put("listBack", "{}");
        if (findImpMain.isPresent()) {
            model.put("JSFAMain", findImpMain.get().getImprove());
            model.put("JSFAMD", findImpMain.get().getTarget());
            model.put("JSFAGZYL", findImpMain.get().getWorky());

            List<TechImproveDetail> listImpDetail = techImproveDetailRepository.findAllByMainIdOrderByCode(findImpMain.get().getSubId());
            if (listImpDetail.size() > 0) {
                model.put("listImpDetail", listImpDetail);
            }else {
                model.put("listImpDetail", "{}");
            }
        }else {
            model.put("JSFAMain", "");
            model.put("JSFAMD", "");
            model.put("JSFAGZYL", "");
            model.put("listImpDetail", "{}");
        }
        if (listAtt.size() > 0) {
            model.put("listAtt", listAtt);
        }else model.put("listAtt", "{}");
        export(model, TechMainID);
    }

    public void export(Map<String, Object> model, String TechMainID) {
        try {
            Configuration configuration = new Configuration();
            configuration.setDefaultEncoding("UTF-8");
            FTPUtil util = new FTPUtil();
            File file = new File(util.getPath() + "/truthdoc");
            if (!file.isDirectory()) {
                file.mkdirs();
            }
            configuration.setDirectoryForTemplateLoading(new File(file.getPath()));
            configuration.setTemplateExceptionHandler(TemplateExceptionHandler.IGNORE_HANDLER);
            File scFile = new File(file.getPath() + "/sc/" + TechMainID);
            if (!scFile.isDirectory()) {
                scFile.mkdirs();
            }
            File outFile = new File(scFile.getPath() + "/file.doc");
            Template template = configuration.getTemplate("template.xml","UTF-8");
            Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile), "UTF-8"), 10240);
            template.process(model, out);
            out.flush();
            out.close();

            WordToPDF(scFile.getPath() + "/file.doc", scFile.getPath() + "/file.pdf");
        }catch (IOException e) {
            e.printStackTrace();
        }catch (TemplateException e) {
            e.printStackTrace();
        }
    }

    public List<String> getBack(String Content) {
        List<String> list = new ArrayList<>();
        String[] Bgtechnologys = Content.replace("\n","\r").split("\r");
        for (int i=0;i<Bgtechnologys.length;i++){
            list.add(Bgtechnologys[i]);
        }
        return list;
    }

    private void WordToPDF(String SaveReplaceTextPath, String SavePDFPath) {
        delSpireTag(SaveReplaceTextPath);
        if (!getLicense()) {// 验证License 若不验证则转化出的pdf文档会有水印产生
            return;
        }
        try {
            File file = new File(SavePDFPath);  //新建一个空白pdf文档
            file.createNewFile();
            FileOutputStream os = new FileOutputStream(file);
            com.aspose.words.Document doc = new com.aspose.words.Document(SaveReplaceTextPath);                    //sourcerFile是将要被转化的word文档
            doc.save(os, SaveFormat.PDF);//全面支持DOC, DOCX, OOXML, RTF HTML, OpenDocument, PDF, EPUB, XPS, SWF 相互转换
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void delSpireTag(String path){
        try {
            InputStream is = new FileInputStream(path);
            XWPFDocument document1 = new XWPFDocument(is);
            document1.removeBodyElement(0);
            OutputStream os = new FileOutputStream(path);
            document1.write(os);
        }catch (Exception ax){
            ax.printStackTrace();
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
}
