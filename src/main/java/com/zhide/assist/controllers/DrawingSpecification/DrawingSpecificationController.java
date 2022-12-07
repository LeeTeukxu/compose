package com.zhide.assist.controllers.DrawingSpecification;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.*;
import com.zhide.assist.models.*;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbAbstractAttachedRepository;
import com.zhide.assist.repositorys.tbAttachedRepository;
import com.zhide.assist.repositorys.tbDigitalSignRepository;
import com.zhide.assist.services.define.IDrawingSpecificationService;
import com.zhide.assist.services.define.ItbAttachedService;
import net.coobird.thumbnailator.Thumbnails;
import org.apache.commons.imaging.ImageInfo;
import org.apache.commons.imaging.Imaging;
import org.apache.commons.io.FileUtils;
import org.docx4j.wml.P;
import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.Option;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.RenderedImage;
import java.io.*;
import java.util.*;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/DrawingSpecification")
public class DrawingSpecificationController {

    @Autowired
    ItbAttachedService itbAttachedService;

    @Autowired
    tbAttachedRepository attachedRepository;

    @Autowired
    tbAbstractAttachedRepository abstractAttachedRepository;

    @Autowired
    tbDigitalSignRepository digitalSignRepository;

    @Autowired
    IDrawingSpecificationService drawingSpecificationService;

    static final List<MultipartFile> listFile = new ArrayList<>();

    Logger logger = LoggerFactory.getLogger(DrawingSpecificationController.class);
    @RequestMapping("/index")
    public String Index(Map<String, Object> model){
        LoginUserInfo Info = CompanyContext.get();
        List<tbAttached> list = new ArrayList<>();
        Optional<tbDigitalSign> findDigitalSign = null;
        if (Info.getRowValue() != 0) {
            list = attachedRepository.getAllByRowValueOrderBySort(Info.getRowValue());
            findDigitalSign = digitalSignRepository.findByRowValue(Info.getRowValue());
        }
        model.put("RowValue",Info.getRowValue());
        model.put("Pictuers",list);
        if (findDigitalSign!=null && findDigitalSign.isPresent()) {
            model.put("DigitalSign", JSON.toJSONString(findDigitalSign.get()));
            model.put("DigitalSignid", findDigitalSign.get().getId());
        }else {
            model.put("DigitalSign", "{}");
            model.put("DigitalSignid", "{}");
        }
        model.put("PicNum",list.size());
        model.put("ListPic",JSON.toJSONString(list));
        model.put("userid", Info.getUserId());
        return "/DrawingSpecification/index";
    }

    @RequestMapping(value = "/submitDrawing",method = RequestMethod.POST)
    @ResponseBody
    public successResult SubmitDrawing(@RequestParam("file") MultipartFile file,HttpSession session, HttpServletRequest request) throws Exception{
        successResult result=new successResult();
        String des = request.getParameter("des");
        String cnsort = request.getParameter("cnsort");
        try {
            if (file == null) {
                throw new Exception("说明书附图格式异常。");
            }
            String fileName = file.getOriginalFilename();
            if (fileName.toLowerCase().indexOf("jpg") == -1 && fileName.toLowerCase().indexOf("png") == -1 && fileName.toLowerCase().indexOf("tif") == -1 && fileName.toLowerCase().indexOf("bmp") == -1 && fileName.toLowerCase().indexOf("gif") == -1) {
                throw new Exception("技术方案图纸/照片只能是以jpg、png、tif、bmp、gif结尾的图片文件!");
            }
            tbAttached attached = drawingSpecificationService.SubmitDrawing(file, des, cnsort);
            result.setData(attached);
        }catch (Exception ax) {
            result.raiseException(ax);
        }
//        LoginUserInfo Info = CompanyContext.get();
//        FileInputStream fileInputStream;
//        try {
//            String fileName = file.getOriginalFilename();
//            String[] exts = fileName.split("\\.");
//            String extName = exts[exts.length - 1];
//            String uuId=UUID.randomUUID().toString();
//            String uploadFileName =uuId + "." + extName;
//            String targetFile = PathUtils.getFullPath("Assist", uploadFileName);
//            File fx = new File(targetFile);
//            FileUtils.writeByteArrayToFile(fx, file.getBytes());
//            if (fx.exists()){
//                try {
//                    fileInputStream = new FileInputStream(fx);
//                    UploadUtils uploadUtils = getUtils();
//                    uploadFileResult rr = uploadUtils.uploadAssist(uploadFileName, fileInputStream);
//                    String fName = modifyImageFormat(targetFile);
//                    if (rr.isSuccess()==true){
//                        tbAttached tbAttached = new tbAttached();
//                        tbAttached.setUserId(Info.getUserId());
//                        tbAttached.setAttached(fileName);
//                        tbAttached.setPath(rr.getFullPath());
//                        tbAttached.setPictureDescription(request.getParameter("des"));
//                        tbAttached.setCnSort(request.getParameter("cnsort"));
//                        tbAttached.setSort(getDigital(request.getParameter("cnsort")));
//                        tbAttached.setAttId(UUID.randomUUID().toString());
//                        tbAttached.setRowValue(Info.getRowValue());
//                        attachedRepository.save(tbAttached);
//                        result.setData(tbAttached);
//                    }
//                    fileInputStream.close();
//                }catch (Exception ax){
//                    result.raiseException(ax);
//                }finally {
//                    FileUtils.forceDeleteOnExit(fx);
//                }
//            }else throw new Exception("保存上传文件失败");
//        }catch (Exception ax){
//            result.raiseException(ax);
//        }
        return result;

    }

    @RequestMapping(value = "/submitReplaceDrawing",method = RequestMethod.POST)
    @ResponseBody
    public successResult SubmitReplaceDrawing(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception{
        successResult result=new successResult();
        String AttID = request.getParameter("AttID");
        try {
            if (file == null) {
                throw new Exception("说明书附图格式异常。");
            }
            String fileName = file.getOriginalFilename();
            if (fileName.toLowerCase().indexOf("jpg") == -1 && fileName.toLowerCase().indexOf("png") == -1 && fileName.toLowerCase().indexOf("tif") == -1 && fileName.toLowerCase().indexOf("bmp") == -1 && fileName.toLowerCase().indexOf("gif") == -1) {
                throw new Exception("技术方案图纸/照片只能是以jpg、png、tif、bmp、gif结尾的图片文件!");
            }
            tbAttached attached = drawingSpecificationService.SubmitReplaceDrawing(file, AttID);
            result.setData(attached);
        }catch (Exception ax) {
            result.raiseException(ax);
        }
//        LoginUserInfo Info = CompanyContext.get();
//        successResult result=new successResult();
//        FileInputStream fileInputStream;
//        try {
//            String fileName = file.getOriginalFilename();
//            String[] exts = fileName.split("\\.");
//            String extName = exts[exts.length - 1];
//            String uuId=UUID.randomUUID().toString();
//            String uploadFileName =uuId + "." + extName;
//            String targetFile = PathUtils.getFullPath("Assist", uploadFileName);
//            File fx = new File(targetFile);
//            FileUtils.writeByteArrayToFile(fx, file.getBytes());
//            if (fx.exists()){
//                try {
//                    fileInputStream = new FileInputStream(fx);
//                    UploadUtils uploadUtils = getUtils();
//                    uploadFileResult rr = uploadUtils.uploadAssist(uploadFileName, fileInputStream);
//                    if (rr.isSuccess()==true){
//                        tbAbstractAttached abstractAttached = abstractAttachedRepository.findAllByAttidAndRowValue(request.getParameter("accesskey"), Info.getRowValue());
//                        if (abstractAttached!=null){
//                            String[] news = rr.getFullPath().split("\\.");
//                            String newName = news[0];
//                            abstractAttachedRepository.UpdateAttIDByRowValue(newName+".jpg",Info.getRowValue());
//                        }
//                        attachedRepository.UpdatePathByAttID(rr.getFullPath(),request.getParameter("AttID"));
//
//                        String FilePath = this.getClass().getClassLoader().getResource("static").getPath() + "/AssistImg/Assist/";
//                        File files = new File(request.getParameter("accesskey").trim());
//                        String FileName = files.getName();
//                        DelFile(FilePath,FileName);
//                    }
//                    fileInputStream.close();
//                }catch (Exception ax){
//                    result.raiseException(ax);
//                }finally {
//                    FileUtils.forceDeleteOnExit(fx);
//                }
//            }else throw new Exception("保存上传文件失败");
//        }catch (Exception ax){
//            result.raiseException(ax);
//        }
        return result;
    }

    private UploadUtils getUtils() {
        return UploadUtils.getInstance();
    }

    private List<MultipartFile> CheckImgSize(MultipartFile file, long XDPI, long YDPI){
        List<MultipartFile> listFile = new ArrayList<>();
        try {
            String fileName = file.getOriginalFilename();
            String[] exts = fileName.split("\\.");
            String extName = exts[exts.length - 1];
            String uuId = UUID.randomUUID().toString();
            String uploadFileName = uuId + "." + extName;
            String targetFile = PathUtils.getFullPath("GUID", uploadFileName);
            File fx = new File(targetFile);
            FileUtils.writeByteArrayToFile(fx, file.getBytes());
            ImageInfo image = Imaging.getImageInfo(new File(targetFile));
            int width = image.getWidth();
            int height = image.getHeight();
            long xWidth = image.getPhysicalWidthDpi();
            long yHeight = image.getPhysicalHeightDpi();
            if (xWidth == -1){
                xWidth = XDPI;
            }
            if (yHeight == -1){
                yHeight = YDPI;
            }
            int WidthMM = Math.round(((width * 25.4f) / xWidth));
            int HeightMM = Math.round(((height * 25.4f) / yHeight));
            if (WidthMM > 165 && HeightMM > 245){
                listFile.add(file);
            }else if (WidthMM > 165){
                listFile.add(file);
            }else if (HeightMM > 245){
                listFile.add(file);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return listFile;
    }

    @ResponseBody
    @RequestMapping("/ocr")
    public successResult OCR(){
        successResult result = new successResult();
        LoginUserInfo Info = CompanyContext.get();
        try {
            FTPUtil util = new FTPUtil();
            String imgPath = util.getPath() + "/Assist";
            List<tbAttached> list = attachedRepository.findAllByRowValue(Info.getRowValue());
            String strContent = OCRUtil.OCR(list,imgPath,digitalSignRepository);
            result.setData(strContent);


        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping(value = "/ftpdowload",method = RequestMethod.POST)
    @ResponseBody
    public successResult ftpdowload(@RequestBody List<Integer> list, HttpServletRequest request, HttpServletResponse response){
        successResult result = new successResult();
        try {
//            LoginUserInfo Info = CompanyContext.get();
//            List<tbAttached> listAtt = attachedRepository.findAllByRowValue(Info.getRowValue());
//            if (listAtt.size() > 0) {
//                for (tbAttached att : listAtt) {
//                    String path = this.getClass().getClassLoader().getResource("static").getPath();
//                    String saveFilePath = path + "/" + "AssistImg/Assist/" + att.getPath().replace("/Assist/", "");
//                    ftpConnect(att.getPath(), saveFilePath,att.getId());
//                    //设置图片宽和高
//                    Thumbnails.of(saveFilePath).size(462,686).toFile(saveFilePath);
//                }
//            }
//            String imgPath = this.getClass().getClassLoader().getResource("static").getPath() + "/AssistImg";
//            String strContent = OCRUtil.OCR(listAtt,imgPath,digitalSignRepository);
//            strContent = strContent.replace(".","、；");
//            Cookie cookie = new Cookie("OCRContent",strContent);
//            cookie.setMaxAge(Integer.MAX_VALUE);
//            response.addCookie(cookie);
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

    private Integer getDigital(String str){
        str = str.trim();
        String regEx = "[^0-9]";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(str);
        return Integer.parseInt(m.replaceAll("").trim());
    }

    @RequestMapping(value = "/dragSort",method = RequestMethod.POST)
    @ResponseBody
    public successResult DragSort(@RequestBody String Data){
        successResult result = new successResult();
        try {
            ListDrag listDrag = JSON.parseObject(Data, ListDrag.class);
            List<Integer> listInteger = listDrag.getSortItem();
            List<String> listString = listDrag.getSortAttID();
            String Type = listDrag.getType();
            String RowValue = listDrag.getRowValue();
//                Integer updateResult = attachedRepository.updateSortByAttID(item,"图"+(item), attId);
            drawingSpecificationService.DragSort(listString, Type, RowValue);
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/getMaxSort")
    public successResult GetMaxSort(HttpSession session){
        LoginUserInfo Info = CompanyContext.get();
        successResult result = new successResult();
        try {
            Integer Sort = attachedRepository.getMaxSortByRowValue(Info.getRowValue());
            if (Sort!=null){
                result.setData(Sort);
            }else {
                result.setData(1);
            }
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping(value = "/remove",method = RequestMethod.POST)
    @ResponseBody
    public successResult remove(@RequestBody List<Integer> ids,HttpSession session){
        successResult result = new successResult();
        try {
            itbAttachedService.remove(ids,session);
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }
    @RequestMapping(value = "/newremove",method = RequestMethod.POST)
    @ResponseBody
    public successResult NewRemove(@RequestBody List<String> ids){
        successResult result = new successResult();
        try {
            itbAttachedService.NewRemove(ids);
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping(value = "/updatepicturedescription")
    @ResponseBody
    public successResult UpdatePictureDescription(HttpServletRequest request){
        successResult result = new successResult();
        try {
            String PictureDescription = request.getParameter("PictureDescription");
            String AttID = request.getParameter("AttID");
            attachedRepository.UpdatePictureDescription(PictureDescription,AttID);
        }catch (Exception ax){
            result.setSuccess(false);
            result.setMessage(ax.getMessage());
        }
        return result;
    }

    @RequestMapping(value = "/PicturereplacementIndex")
    public String PicturereplacementIndex(String AttID, String accesskey, Map<String,Object> map){
        LoginUserInfo Info = CompanyContext.get();
        map.put("AttID",AttID);
        map.put("accesskey",accesskey);
        return "/DrawingSpecification/Picturereplacement";
    }
    @RequestMapping(value = "/dragsortindex")
    public String RIndex(Map<String,Object> map){
        LoginUserInfo Info = CompanyContext.get();
        List<tbAttached> list = attachedRepository.getAllByRowValueOrderBySort(Info.getRowValue());
        map.put("lists",list);
        map.put("RowValue", Info.getRowValue());
        return "/DrawingSpecification/dragSort";
    }
    @RequestMapping("/updatepicsize")
    @ResponseBody
    public void UpdatePicSize(HttpServletRequest request){
//        LoginUserInfo Info = CompanyContext.get();
//        List<tbAttached> listAtt = attachedRepository.getAllByRowValueOrderBySort(Info.getRowValue());
//        if (listAtt.size() > 0) {
//            for (tbAttached att : listAtt) {
//                try {
//                    String imgPath = this.getClass().getClassLoader().getResource("static").getPath() + "/AssistImg" + att.getPath();
//                    ImageInfo image = Imaging.getImageInfo(new File(imgPath.substring(1)));
//                    int width = image.getWidth();
//                    int height = image.getHeight();
//                    int xWidth = image.getPhysicalWidthDpi();
//                    int yHeight = image.getPhysicalHeightDpi();
//
//
//                    //图片不能重命名格式
//                    if (xWidth > -1 && yHeight > -1) {
//                        int WidthMM = Math.round(((width * 25.4f) / xWidth));
//                        int HeightMM = Math.round(((height * 25.4f) / yHeight));
//                        if (WidthMM > 165 && HeightMM > 245){
//                            DrawImgSize(imgPath.substring(1),467,694);
//                        }else if (WidthMM > 165){
//                            DrawImgSize(imgPath.substring(1),467,height);
//                        }else if (HeightMM > 245){
//                            DrawImgSize(imgPath.substring(1),width,694);
//                        }
//                    }else {
//
//                    }
//                } catch (Exception ax) {
//                    ax.getMessage();
//                }
//            }
//        }
    }

    private void DrawImgSize(String ImgPath, int width, int height){
        try {
            Thumbnails.of(ImgPath).width(width).height(height).toFile(ImgPath);
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    private String modifyImageFormat(String srcPath){
        String fName = "";
        try {
            BufferedImage bufferedImage = ImageIO.read(new File(srcPath));
            BufferedImage newBufferedImage = new BufferedImage(bufferedImage.getWidth(),
                    bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
            newBufferedImage.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
            fName = srcPath.substring(0,srcPath.lastIndexOf("."));
            ImageIO.write(bufferedImage, "jpg", new File(srcPath));
//            RenderedImage img = ImageIO.read(new File(srcPath));
//            ImageIO.write(img,"jpg",new File(fName + ".jpg"));
        }catch (IOException e) {
            e.printStackTrace();
        }
        return fName + ".jpg";
    }
}
