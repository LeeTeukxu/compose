package com.zhide.assist.common;

import com.aspose.words.ExportHeadersFootersMode;
import com.aspose.words.HtmlSaveOptions;
import com.aspose.words.SaveFormat;
import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.multitenancy.CompanyContext;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.converter.PicturesManager;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.hwpf.usermodel.PictureType;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.w3c.dom.Document;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import java.io.*;

public class XWPFUtil {

    /**
     * 将word2003转换为html文件
     *
     * @param wordPath word文件路径
     * @param wordName word文件名称无后缀
     * @param suffix   word文件后缀
     * @param htmlPath html存储地址
     * @throws IOException
     * @throws TransformerException
     * @throws ParserConfigurationException
     */
    public static String Word2003ToHtml(String wordPath, String wordName, String suffix, String htmlPath)
            throws IOException, TransformerException, ParserConfigurationException {
        String htmlName = wordName + ".html";
        final String imagePath = htmlPath + "image" + File.separator;
        // 判断html文件是否存在
        File htmlFile = new File(htmlPath + htmlName);
        if (htmlFile.exists()) {
            return htmlFile.getAbsolutePath();
        }
        // 原word文档
        final String file = wordPath + File.separator + wordName + suffix;
        InputStream input = new FileInputStream(new File(file));
        HWPFDocument wordDocument = new HWPFDocument(input);
        WordToHtmlConverter wordToHtmlConverter = new WordToHtmlConverter(
                DocumentBuilderFactory.newInstance().newDocumentBuilder().newDocument());
        // 设置图片存放的位置
        wordToHtmlConverter.setPicturesManager(new PicturesManager() {
            public String savePicture(byte[] content, PictureType pictureType, String suggestedName, float widthInches,
                                      float heightInches) {
                File imgPath = new File(imagePath);
                if (!imgPath.exists()) {// 图片目录不存在则创建
                    imgPath.mkdirs();
                }
                File file = new File(imagePath + suggestedName);
                try {
                    OutputStream os = new FileOutputStream(file);
                    os.write(content);
                    os.close();
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                // 图片在html文件上的路径 相对路径
                return "/doc/sc/image/" + suggestedName;
            }
        });
        // 解析word文档
        wordToHtmlConverter.processDocument(wordDocument);
        Document htmlDocument = wordToHtmlConverter.getDocument();
        // 生成html文件上级文件夹
        File folder = new File(htmlPath);
        if (!folder.exists()) {
            folder.mkdirs();
        }
        OutputStream outStream = new FileOutputStream(htmlFile);
        DOMSource domSource = new DOMSource(htmlDocument);
        StreamResult streamResult = new StreamResult(outStream);
        TransformerFactory factory = TransformerFactory.newInstance();
        Transformer serializer = factory.newTransformer();
        serializer.setOutputProperty(OutputKeys.ENCODING, "utf-8");
        serializer.setOutputProperty(OutputKeys.INDENT, "yes");
        serializer.setOutputProperty(OutputKeys.METHOD, "html");
        serializer.transform(domSource, streamResult);
        return htmlFile.getAbsolutePath();
    }

    public static String jsoup(String htmlUrl) throws IOException{
        LoginUserInfo Info = CompanyContext.get();
        File file = new File(htmlUrl);
        //org.jsoup.nodes.Document document = Jsoup.connect("https://www.zfbip.com/Assist/Assist/aaa.html").get();
        org.jsoup.nodes.Document doc = Jsoup.parse(file,"utf-8");
        Elements rows = doc.select("div[class=d3]").get(0).select("p");
        Element row = rows.get(0);
        String SMSFT = getShuoMingShuFuTu(doc.toString());
        String html = doc.toString().replace("amp;","").replace("&lt;","<").replace("&gt;",">").replace("<p>","<p class=\"p7\">").replace(row.toString(),SMSFT)
                .replace(".d1{margin: 0.9847222in 0.90347224in 0.7881944in 0.9847222in;}",".d1{margin: 0.9847222in 0.90347224in -1.211806in 0.9847222in;}")
                .replace(".d2{margin: 0.9847222in 0.9763889in 0.7881944in 0.9847222in;}",".d2{margin: 1.984722in 0.9763889in 0.7881944in 0.9847222in;}");
        return html;
    }

    public static String getShuoMingShuFuTu(String html){
        String ChangeBody = "";
        org.jsoup.nodes.Document doc = Jsoup.parse(html);
        Elements rows = doc.select("div[class=d3]").get(0).select("p");
        Element row = rows.get(0);
        Elements ChangeBodys = row.select("img");
        Elements ChangeSpans = row.select("span");
        for (int i=0;i<ChangeBodys.size();i++){
            ChangeBody += "<p class=\"p7\" style=\"text-align:center\">" + ChangeBodys.get(i) + "</p><p class=\"p7\" style=\"text-align:center\">" + ChangeSpans.get(i) + "</p>";
        }
        return "<p8>" + ChangeBody + "</p8>";
    }

    public static void saveHtml(String str,String htmlUrl,String saveHtmlPath) throws IOException{
        File file = new File(htmlUrl);
        if (!file.exists()){
            file.createNewFile();
        }else file.delete();
        OutputStreamWriter osw = new OutputStreamWriter(new FileOutputStream(saveHtmlPath),"UTF-8");
        osw.write(str);
        osw.flush();
        osw.close();
    }

    public static void saveHtmlToTMPE(String str,String saveFinalTempPath) throws IOException{
        OutputStreamWriter osw = new OutputStreamWriter(new FileOutputStream(saveFinalTempPath),"UTF-8");
        osw.write(str);
        osw.flush();;
        osw.close();
    }

    public static String replaceImgPath(String htmlPath,String AbsoluteAddress) throws IOException{
        String encoding = "UTF-8";
        String html = "";
        File file = new File(htmlPath);
        if (file.isFile() && file.exists()){
            org.jsoup.nodes.Document document = Jsoup.parse(file,encoding);
            html = document.toString().replace("/doc/sc/",AbsoluteAddress);
        }else {
            System.out.println("文件不存在");
        }
        return html;
    }

    public static void htmlToWord(String htmlPath,String docPath) throws IOException{
        ActiveXComponent app = new ActiveXComponent("Word.Application");
        try {
            app.setProperty("Visible", new Variant(false));
            Dispatch wordDoc = app.getProperty("Documents").toDispatch();
            wordDoc = Dispatch.invoke(wordDoc, "Add", Dispatch.Method, new Object[0], new int[1]).toDispatch();
            Dispatch.invoke(app.getProperty("Selection").toDispatch(), "InsertFile", Dispatch.Method, new Object[] { htmlPath.substring(1), "", new Variant(false), new Variant(false), new Variant(false) }, new int[3]);
            Dispatch.invoke(wordDoc, "SaveAs", Dispatch.Method, new Object[] {docPath.substring(1), new Variant(1)}, new int[1]);
            Dispatch.call(wordDoc, "Close", new Variant(false));
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            app.invoke("Quit",new Variant(){});
        }
    }
}
