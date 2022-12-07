package com.zhide.assist.common;

import java.awt.*;
import java.io.*;
import java.text.DecimalFormat;
import java.util.*;
import java.util.List;

import com.aspose.words.*;
import com.aspose.words.Document;
import com.aspose.words.Font;
import com.spire.doc.FileFormat;
import com.spire.doc.documents.CommentMark;
import com.spire.doc.documents.CommentMarkType;
import com.spire.doc.documents.Paragraph;
import com.spire.doc.documents.TextSelection;
import com.spire.doc.fields.Comment;
import com.spire.doc.fields.TextRange;
import com.zhide.assist.mapper.IndependenceMapper;
import com.zhide.assist.models.*;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.*;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.docx4j.openpackaging.exceptions.Docx4JException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.swing.*;
import javax.xml.soap.Text;

@Component
public class DocUtils {

    public static void replaceWord(String srcPath, String destPath, Map<String,String> map) throws Exception{
        String key = "";
        String value = "";
        Document document = new Document(srcPath);
        FindReplaceOptions options = new FindReplaceOptions();
        for(Map.Entry<String, String> entry : map.entrySet()) {
            if (entry.getValue() == null) {
                entry.setValue("  ");
                break;
            }
            else {
                key = entry.getKey();
                value = entry.getValue();
            }

            document.getRange().replace(key,value,options);
        }
        document.save(destPath);

//        com.spire.doc.Document doc = new com.spire.doc.Document();
//        doc.loadFromFile(destPath.substring(1));

        //添加注解
        //查找指定字符串
//        if (bjjs == "") {
//              SectionCollection sec = doc.getSections();
//                for (int j=0;j<sec.get(3).getParagraphs().getCount();j++){
//                    String a = "1";
//
//                }
//        }else{
//            TextSelection[] selections = doc.findAllString(bjjs, true, false);
//
//            //获取关键字符串所在段落
//            com.spire.doc.documents.Paragraph para = selections[0].getAsOneRange().getOwnerParagraph();
//            int index = para.getChildObjects().indexOf(selections[0].getAsOneRange());
//
//            //添加批注ID
//            CommentMark start = new CommentMark(doc);
//            start.setCommentId(1);
//            start.setType(CommentMarkType.Comment_Start);
//            CommentMark end = new CommentMark(doc);
//            end.setType(CommentMarkType.Comment_End);
//            end.setCommentId(1);
//
//            //添加批注内容
//            String str = "给指定字符串添加批注";
//            com.spire.doc.fields.Comment comment = new Comment(doc);
//            comment.getFormat().setCommentId(1);
//            comment.getBody().addParagraph().appendText(str);
//            comment.getFormat().setAuthor("作者：");
//            comment.getFormat().setInitial("CM");
//            para.getChildObjects().insert(index, start);
//            para.getChildObjects().insert(index + 1, selections[0].getAsOneRange());
//            para.getChildObjects().insert(index + 2, end);
//            para.getChildObjects().insert(index + 3, comment);
//
//            //保存文档
//            doc.saveToFile(destPath, FileFormat.Docx_2013);
//            doc.dispose();
//        }
//        searchExceptionInfo(destPath,destPath,atRepository,bgtechnologyRepository);
        //去除spire.doc警告信息水印

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

    private static void ChangeFont(String path, List<tbIndependence> listAllJiShuFangAn){
        com.spire.doc.Document doc = new com.spire.doc.Document();
        //加载Word文档
        doc.loadFromFile(path);
        //获取第三节
        com.spire.doc.Section section1 = doc.getSections().get(2);
        int j = 0;
        if (section1.getParagraphs().getCount()> 0) {
            for (int i=0;i<section1.getParagraphs().getCount();i++) {
                //获取第三节中的第一个段落
                Paragraph p1 = section1.getParagraphs().get(i);
                for (int x=0;x<listAllJiShuFangAn.size();x++) {
                    String bianhao = (j + 1) + ".";
                    TextSelection selection = p1.find(bianhao, true, true);
                    if (selection != null) {
                        TextRange range = selection.getAsOneRange();
                        range.getCharacterFormat().setFontName("Times New Roman");
                        range.getCharacterFormat().setBold(true);
                        j++;
                    }
                }
            }
        }

        //获取第四节
        com.spire.doc.Section section2 = doc.getSections().get(3);

        //更改"附图说明"字体
        if (section2.getParagraphs().getCount() > 0){
            for (int z=0;z<section2.getParagraphs().getCount();z++){
                Paragraph p1 = section2.getParagraphs().get(z);
                TextSelection selection = p1.find("附图说明",true,true);
                if (selection != null){
                    TextRange range = selection.getAsOneRange();
                    range.getCharacterFormat().setBold(true);
                }
            }
        }

        //更改专利名称内容字体
        //获取第四节第一个段落
        Paragraph p2 = section2.getParagraphs().get(1);
        //遍历第一个段落的所有对象
        for (int i = 0; i < p2.getChildObjects().getCount(); i++){
            //更改文本的字体大小
            if ( p2.getChildObjects().get(i) instanceof TextRange){
                TextRange tr = (TextRange) p2.getChildObjects().get(i);
                tr.getCharacterFormat().setFontSize(18);
                tr.getCharacterFormat().setBold(true);
            }
        }

        //获取第四节第九段及第九段以后的段落
//        Paragraph p3 = section2.getParagraphs().get(7);
//        p3.getFormat().setFirstLineIndent(20);

        doc.saveToFile(path, FileFormat.Docx_2013);
    }

    //查找异常信息
    private void searchExceptionInfo(String destPath,String SaveFilePath,tbAssistNameRepository atRepository,tbBgtechnologyRepository bgtechnologyRepository){
        int i = 0;
        LoginUserInfo Info = CompanyContext.get();

        List<tbAssitName> listAssitName = atRepository.findAllById(Info.getRowValue());
        if (listAssitName.size() > 0){
            i++;
            for (tbAssitName assitName : listAssitName) {
                addExceptionAnnotation(destPath,assitName.getAssistName(),1,i,SaveFilePath,assitName.getException(),Info.getUserName());
            }
        }

        List<tbBgtechnology> listBgtechnology = bgtechnologyRepository.findAllByRowValue(Info.getRowValue());
        if (listBgtechnology.size() > 0){
            i++;
            for (tbBgtechnology bgtechnology : listBgtechnology){
                addExceptionAnnotation(destPath,bgtechnology.getContent().replace("\r","\u000B"),0,i,SaveFilePath,bgtechnology.getException(),Info.getUserName());
            }
        }
    }

    /**
     * doc: 文档对象
     * KeyWord: 要添加批注的关键字
     * SubScript: 关键字下标
     * CommentID: 批注ID
     * SaveFilePath: 保存地址
     * CommentContent: 批注内容
     * Inital: 作者名称
     **/
    //添加异常批注
    private void addExceptionAnnotation(String destPath,String KeyWord,Integer SubScript,Integer CommentID,String SaveFilePath,String CommentContent,String Inital){
        com.spire.doc.Document doc = new com.spire.doc.Document();
        doc.loadFromFile(destPath);
        TextSelection[] selections = doc.findAllString(KeyWord, true, false);

        //获取关键字符串所在段落
        com.spire.doc.documents.Paragraph para = selections[SubScript].getAsOneRange().getOwnerParagraph();
        int index = para.getChildObjects().indexOf(selections[SubScript].getAsOneRange());

        //添加批注ID
        CommentMark start = new CommentMark(doc);
        start.setCommentId(CommentID);
        start.setType(CommentMarkType.Comment_Start);
        CommentMark end = new CommentMark(doc);
        end.setType(CommentMarkType.Comment_End);
        end.setCommentId(CommentID);

        //添加批注内容
        String str = CommentContent;
        com.spire.doc.fields.Comment comment = new Comment(doc);
        comment.getFormat().setCommentId(CommentID);
        comment.getBody().addParagraph().appendText(str);
        comment.getFormat().setAuthor("作者：");
        comment.getFormat().setInitial(Inital);
        para.getChildObjects().insert(index, start);
        para.getChildObjects().insert(index + 1, selections[SubScript].getAsOneRange());
        para.getChildObjects().insert(index + 2, end);
        para.getChildObjects().insert(index + 3, comment);

        //保存文档
        doc.saveToFile(SaveFilePath, FileFormat.Docx_2013);
        doc.dispose();
    }

    public static void insertImg(String DocPath, String imgPath, String WordPath, String Type, List<tbAttached> listAttahced){
        try {
            if (Type == "ShuoMingShuFuTu") {
                if (listAttahced.size() > 0) {
                    InsertSMSFT(WordPath, listAttahced, imgPath);
                }
            }else {
                InsertZYFT(DocPath,imgPath,WordPath);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }catch (Docx4JException ax){
            ax.printStackTrace();
        }catch (Exception ex){
            ex.printStackTrace();
        }
    }

    private static void InsertZYFT(String DocPath,String imgPath,String WordPath) throws Exception{
        if (!getLicense()){
            return;
        }
//        Thumbnails.of(imgPath.substring(1)).size(462,686).toFile(imgPath.substring(1));
        com.aspose.words.Document doc = new com.aspose.words.Document(DocPath);
        if (!imgPath.equals("")) {
            DocumentBuilder builder = new DocumentBuilder(doc);
            builder.moveToBookmark("ZYFT");
            builder.moveToCell(0, 0, 0, 0);
//            ImageIcon imageIcon = new ImageIcon(imgPath);
//            double displayWidth = 452;
//            double zoomRate = displayWidth / imageIcon.getIconWidth();
//            double displayHeigth = imageIcon.getIconHeight() * zoomRate;
//            builder.insertImage(imgPath, displayWidth, displayHeigth);
            builder.insertImage(imgPath);
        }
        doc.save(WordPath);
    }
    private static void InsertSMSFT(String WordPath,List<tbAttached> listAttahced, String imgPath) throws Exception{
        if (!getLicense()) {// 验证License 若不验证则转化出的pdf文档会有水印产生
            return;
        }
        com.aspose.words.Document doc = new com.aspose.words.Document(WordPath);
        com.aspose.words.Table table = (com.aspose.words.Table)doc.getChild(NodeType.TABLE,1,true);
        DocumentBuilder builder = new DocumentBuilder(doc);
        List<String> list = new ArrayList<>();
        for (tbAttached attached : listAttahced){
            File file = new File(imgPath + attached.getPath());
            if (file.exists()) {
                list.add((imgPath + attached.getPath()));
            }
        }
        com.aspose.words.Range range = null;
        if (list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                Node deepClone = table.getRows().get(i).deepClone(true);//复制第一行
                table.getRows().insert(i, deepClone);//将复制的行放在后面
            }
//        table.getRows().get(0).remove();
            for (int i = 0; i < list.size(); i++) {
                builder.moveToBookmark("SMSFT");
                builder.moveToCell(0, 0 + i, 0, 0);
                String imageURL = list.get(i);
//                ImageIcon imageIcon = new ImageIcon(imageURL);
//                double displayWidth = 462;
//                double zoomRate = displayWidth / imageIcon.getIconWidth();
//                double displayHeigth = imageIcon.getIconHeight() * zoomRate;
//                builder.insertImage(imageURL, displayWidth, displayHeigth);
                builder.insertImage(imageURL);
                builder.write("\n图" + (i + 1));
            }
            table.getLastRow().remove();
            doc.save(WordPath);
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

    public static void WordToPDF(String inputFile, String pdfFile){
        delSpireTag(inputFile);
        if (!getLicense()) {// 验证License 若不验证则转化出的pdf文档会有水印产生
            return;
        }
        try {
            File file = new File(pdfFile);  //新建一个空白pdf文档
            file.createNewFile();
            FileOutputStream os = new FileOutputStream(file);
            com.aspose.words.Document doc = new com.aspose.words.Document(inputFile);                    //sourcerFile是将要被转化的word文档
            doc.save(os, SaveFormat.PDF);//全面支持DOC, DOCX, OOXML, RTF HTML, OpenDocument, PDF, EPUB, XPS, SWF 相互转换
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void SC(String dirFolder, String imgFloderPath, String TemplateFilePath, Integer RowValue, tbAssistNameRepository assistNameRepository, tbInstructionRepository instructionRepository, tbTechnicalFieldRepository technicalFieldRepository, tbIndependenceRepository independenceRepository, tbAbstractAttachedRepository abstractAttachedRepository, tbAttachedRepository attachedRepository, tbBgtechnologyRepository bgtechnologyRepository, tbDigitalSignRepository digitalSignRepository, tbDqExamplesRepository examplesRepository, tbTemplateConfigRepository templateConfigRepository, IndependenceMapper independenceMapper){
        //预览PDF和下载word时先删除再创建
        File f = new File(dirFolder);
        deleteDir(f);
        String AssistName = "";
        String Instruction = "";
        String Bgtechnology = "";
        String TechnicalField = "";
        String TcOne = "";
        String TcTwo = "";
        String ZhaiYaoFuTu= "";
        String PictureCnSortAndDes = "";
        String DigitalSign = "";
        String strContent = "";
        String AllJiShuFangAn = "";
        String FuTuShuoMing = "";
        StringBuilder FaMingContent = new StringBuilder();
        StringBuilder SBDigitalSign = new StringBuilder();
        StringBuilder SBKaiTou = new StringBuilder();
        StringBuilder SBJieWei = new StringBuilder();
        StringBuilder SBAllShiShiLi = new StringBuilder();

        DecimalFormat decimalFormat = new DecimalFormat("0000");
        int bianhao = 0;
        List<tbAssitName> listAssitName = assistNameRepository.findAllById(RowValue);
        if (listAssitName.size()>0){
            AssistName = listAssitName.get(0).getAssistName();
        }
        List<tbTechnicalField> listTechnicalField = technicalFieldRepository.findAllByRowValue(RowValue);
        if (listTechnicalField.size()>0){
            bianhao++;
            String Numbering = "[" + decimalFormat.format(bianhao) + "]";
            TechnicalField = listTechnicalField.get(0).getTechnicalField();
            TcOne = listTechnicalField.get(0).getTcOne();
            TcTwo = listTechnicalField.get(0).getTcTwo();
        }
        List<tbBgtechnology> listBgtechnology = bgtechnologyRepository.findAllByRowValue(RowValue);
        StringBuilder SBBgtechnology = new StringBuilder();
        if (listBgtechnology.size()>0){
            bianhao++;
            String Numbering = "[" + decimalFormat.format(bianhao) + "]";
            Bgtechnology = listBgtechnology.get(0).getContent();
            String[] Bgtechnologys = Bgtechnology.replace("\n","\r").split("\r");
            for (int i=0;i<Bgtechnologys.length;i++){
                int length = Bgtechnologys[i].replaceAll("([ ]*).*", "$1").length();
                if (length > 0){
                    Bgtechnologys[i] = Bgtechnologys[i].substring(length);
                }
                if (Bgtechnologys.length == 1){
                    SBBgtechnology.append(Bgtechnologys[i]);
                }else if (i == 0) {
                    SBBgtechnology.append(Bgtechnologys[i]+ "\r");
                }else if (i == Bgtechnologys.length-1){
                    SBBgtechnology.append("\t" + Bgtechnologys[i]);
                }else SBBgtechnology.append("\t" + Bgtechnologys[i] + "\r");
            }
        }

        List<tbIndependence> listFMNR = independenceMapper.findAllByRowValueOrderByDqExclusiveorderAsc(RowValue);
        if (listFMNR.size()>0){
            for (int i=0;i<listFMNR.size();i++){
                bianhao++;
                String Numbering = "";
                if (!strContent.equals("")){
                    strContent = "";
                }
                tbIndependence ind = listFMNR.get(i);

                if (!ind.getDqObjectinvention().equals("")) {
                    if (i == 0) {
                        strContent += ClearBracket(ind.getDqObjectinvention());
                    } else strContent += "\n" + ClearBracket(ind.getDqObjectinvention());
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
                        strContent += "\n" + ClearBracket(DeleteKey.replace("所述的", ""));
                    }
                }

                if (!ind.getDqBeneficialeffect().equals("")) {
                    if (FaMingContent.toString().equals("") && strContent.equals("")) {
                        strContent += ClearBracket(ind.getDqBeneficialeffect());
                    } else strContent += "\n" + ClearBracket(ind.getDqBeneficialeffect());
                }

                FaMingContent.append(strContent);
                continue;
            }
        }

        List<tbDigitalSign> listDigitalSign = digitalSignRepository.findAllByRowValue(RowValue);
        List<tbAttached> listAttached = attachedRepository.getAllByRowValueOrderBySort(RowValue);
        if (listAttached.size()>0){
            FaMingContent.append("\r" + "附图说明");
            listAttached.stream().forEach(x -> {
                FaMingContent.append("\n" + x.getCnSort() + "为" + x.getPictureDescription());
            });
            if (listDigitalSign.size() > 0){
                listDigitalSign.stream().forEach(q -> {
                    listAssitName.stream().filter(w -> w.getId().equals(RowValue)).forEach(w -> {
                        List<tbTemplateConfig> listTemplateConfig = templateConfigRepository.findAllByTemplateId(w.getTemplateId());
                        listTemplateConfig.stream().filter(e -> e.getTemplateId().equals(w.getTemplateId())).forEach(e -> {
                            if (e.getField().equals("FuTuShuoMingSheZhi")){
                                FaMingContent.append("\n" + e.getFieldContent() + q.getDigitalSign());
                            }
                        });
                    });
                });
            }
            DigitalSign = SBDigitalSign.toString();
        }

        List<tbInstruction> listInstruction = instructionRepository.findAllByRowValue(RowValue);
        if (listInstruction.size()>0){
            Instruction = ClearBracket(listInstruction.get(0).getInstruction());
        }
        List<tbIndependence> listAllJiShuFangAn = independenceMapper.findAllByRowValueOrderByDqExclusiveorderAsc(RowValue);
        if (listAllJiShuFangAn.size() > 0){
            for (int i=0;i<listAllJiShuFangAn.size();i++){
                int j = i+1;
                if (i==0){
                    AllJiShuFangAn += (j)+"."+listAllJiShuFangAn.get(i).getDqTechnicalsolutions();
                }else AllJiShuFangAn += "\n"+(j)+"."+listAllJiShuFangAn.get(i).getDqTechnicalsolutions();
            }
        }
        List<tbAbstractAttached> listAbstractAttached = abstractAttachedRepository.findAllByRowValue(RowValue);
        if (listAbstractAttached.size()>0){
            for (int i=0;i<listAbstractAttached.size();i++){
                tbAbstractAttached abs = listAbstractAttached.get(i);
                ZhaiYaoFuTu = abs.getAttid();
            }
        }
//        List<tbDigitalSign> listDigitalSign = digitalSignRepository.findAllByRowValue(Integer.parseInt(RowValue));
//        List<tbAttached> listAttached = attachedRepository.getAllByRowValueOrderBySort(Integer.parseInt(RowValue));
//        if (listAttached.size()>0){
//            FuTuShuoMing += "附图说明";
//            for (int i=0;i<listAttached.size();i++){
//                tbAttached att = listAttached.get(i);
//                if (i == 0){
//                    PictureCnSortAndDes += att.getCnSort() + "为" + att.getPictureDescription();
//                }else PictureCnSortAndDes += "\n" + att.getCnSort() + "为" + att.getPictureDescription();
//            }
//            if (listDigitalSign.size() > 0){
//                for (tbDigitalSign dig : listDigitalSign) {
//                    tbAssitName assitName = listAssitName.stream().filter( x -> x.getId().equals(Integer.parseInt(RowValue))).findFirst().get();
//                    List<tbTemplateConfig> listTemplateConfig = templateConfigRepository.findAllByTemplateId(assitName.getTemplateId());
//                    listTemplateConfig.stream().filter(x -> x.getTemplateId().equals(assitName.getTemplateId())).forEach(x -> {
//                        if (x.getField().equals("FuTuShuoMingSheZhi")){
//                            SBDigitalSign.append(x.getFieldContent() + dig.getDigitalSign());
//                        }
//                    });
//                }
//            }
//            DigitalSign = SBDigitalSign.toString();
//        }
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
                            SBAllShiShiLi.append("实施例" + j + "：");
                            SBAllShiShiLi.append("\n" + listExa.get(i).getDqExamples());
                        }else {
                            SBAllShiShiLi.append("\n实施例" + j + "：");
                            SBAllShiShiLi.append("\n" + listExa.get(i).getDqExamples());
                        }
                        j++;
                    }
                }
            }
        }
//        for (tbDqExamples dqExamples : listExa) {
//            if (i == 1) {
//                SBAllShiShiLi.append("实施例" + i + "：");
//                SBAllShiShiLi.append("\n" + dqExamples.getDqExamples());
//            } else {
//                SBAllShiShiLi.append("\n实施例" + i + "：");
//                SBAllShiShiLi.append("\n" + dqExamples.getDqExamples());
//            }
//            i++;
//        }
        Map<String,String> map=new HashMap<>();
        map.put("[AssistName]",AssistName);
        map.put("[Instruction]",Instruction.replace("所述的","").replace("所述",""));
        map.put("[Bgtechnology]",SBBgtechnology.toString());
        map.put("[TechnicalField]",TechnicalField);
        map.put("[TcOne]",TcOne);
        map.put("[TcTwo]",TcTwo);
        map.put("[FaMingContent]",FaMingContent.toString());
        map.put("[AllJiShuFangAn]",AllJiShuFangAn);
        map.put("[ShiShiFangShiKaiTou]",SBKaiTou.toString());
        map.put("[ShiShiFangShiJieWei]",SBJieWei.toString());
        map.put("[AllShiShiLi]",SBAllShiShiLi.toString());
        String imgPath = "";
        if (ZhaiYaoFuTu!="") {
            imgPath = imgFloderPath + ZhaiYaoFuTu;
        }
        File file = new File(dirFolder);
        if (!file.isDirectory()){
            file.mkdirs();
        }
        String SaveFuTuPath = dirFolder + "/FuTu.docx";
        String FormatConversionPath = dirFolder + "/FuTu.doc";
        String SaveReplaceTextPath = dirFolder + "/Text.doc";
        //替换摘要附图文件
        insertImg(TemplateFilePath,imgPath,FormatConversionPath,"ZhaiYaoFuTu",listAttached);
        //替换说明书附图文件
        insertImg(SaveFuTuPath,imgFloderPath, FormatConversionPath,"ShuoMingShuFuTu",listAttached);
        try {
            replaceWord(FormatConversionPath,SaveReplaceTextPath,map);
            ChangeFont(SaveReplaceTextPath,listAllJiShuFangAn);
            String SavePDFPath = dirFolder + "/finalPDF.pdf";
            WordToPDF(SaveReplaceTextPath,SavePDFPath);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void deleteDir(File file){
        if (file.isDirectory()){
            File[] files = file.listFiles();
            for (int i=0;i<files.length;i++){
                deleteDir(files[i]);
            }
        }
        file.delete();
    }

    public static String ClearBracket(String context) {
        context = context.replace('(','（').replace(')','）');
        int head = context.indexOf('（'); // 标记第一个使用左括号的位置

        if (head == -1) {
            return context; // 如果context中不存在括号，什么也不做，直接跑到函数底端返回初值str

        } else {
            int next = head + 1; // 从head+1起检查每个字符

            int count = 1; // 记录括号情况

            do {
                if (context.charAt(next) == '（')

                    count++;

                else if (context.charAt(next) == '）')

                    count--;

                next++; // 更新即将读取的下一个字符的位置

                if (count == 0) // 已经找到匹配的括号

                {
                    String temp = context.substring(head, next); // 将两括号之间的内容及括号提取到temp中

                    context = context.replace(temp, ""); // 用空内容替换，复制给context

                    head = context.indexOf('（'); // 找寻下一个左括号

                    next = head + 1; // 标记下一个左括号后的字符位置

                    count = 1; // count的值还原成1

                }

            } while (head != -1); // 如果在该段落中找不到左括号了，就终止循环

        }

        return context; // 返回更新后的context
    }

    private String DeleteDqKey(String Content,String Key){
        //独权删除其特征在于
        String result = "";
        if (Content.indexOf(Key) > 0) {
            Integer Index = Content.indexOf(Key);
            result =  Content.substring(0, Index) + Content.substring(Index + Key.length());
        }else result = Content;
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
