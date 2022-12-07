package com.zhide.assist.services.implement;

import com.zhide.assist.common.PathUtils;
import com.zhide.assist.common.UploadUtils;
import com.zhide.assist.common.uploadFileResult;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.tbAbstractAttached;
import com.zhide.assist.models.tbAttached;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbAbstractAttachedRepository;
import com.zhide.assist.repositorys.tbAttachedRepository;
import com.zhide.assist.services.define.IDrawingSpecificationService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class DrawingSpecificationServiceImpl implements IDrawingSpecificationService {
    @Autowired
    tbAttachedRepository attachedRepository;

    @Autowired
    tbAbstractAttachedRepository abstractAttachedRepository;

    @Override
    public List<tbAttached> DragSort(List<String> listAttID, String Type, String RowValue) throws Exception {
        List<tbAttached> listAtt = attachedRepository.findAll();
        List<tbAttached> listAttached = new ArrayList<>();
        for (int i=0;i<listAttID.size();i++) {
            String AttID = listAttID.get(i);
            Integer Sort = i + 1;
            listAtt.stream().filter(f -> f.getAttId().equals(AttID)).forEach(f -> {
                tbAttached attached = f;
                attached.setSort(Sort);
                attached.setCnSort("图" + Sort);
                listAttached.add(attached);
            });
        }
        List<tbAttached> list = attachedRepository.saveAll(listAttached);
        return list;
    }

    @Override
    public tbAttached SubmitDrawing(MultipartFile file, String des, String cnsort) throws Exception {
        String uuId = UUID.randomUUID().toString();
        if (file == null) {
            throw new Exception("说明书附图数据无效，请检查浏览器是否工作正常!");
        }
        String fileName = file.getOriginalFilename();
        File fx = SaveFile(file, uuId);
        if (fx.exists()) {
            tbAttached OO = SaveAttached(fx, fileName, uuId, fx.getName(), des, cnsort);
            return OO;
        }else throw new Exception("上传文件:"+fileName+"保存失败,操作被异常中止!");
    }

    @Override
    public tbAttached SubmitReplaceDrawing(MultipartFile file, String AttID) throws Exception {
        String uuId = UUID.randomUUID().toString();
        if (file == null) {
            throw new Exception("说明书附图数据无效，请检查浏览器是否工作正常!");
        }
        String fileName = file.getOriginalFilename();
        File fx = SaveFile(file, uuId);
        if (fx.exists()) {
            tbAttached OO = ReplaceAttached(fx, fx.getName(), AttID);
            return OO;
        }else throw new Exception("上传文件:"+fileName+"保存失败,操作被异常中止!");
    }

    private File SaveFile(MultipartFile file, String UUID) throws Exception {
        String fileName = file.getOriginalFilename();
        String[] exts = fileName.split("\\.");
        String extName = exts[exts.length - 1];
        String uploadFileName = UUID + "." + extName;
        String targetFile = PathUtils.getFullPath("Temp", uploadFileName);
        File fx = new File(targetFile);
        FileUtils.writeByteArrayToFile(fx, file.getBytes());
        return fx;
    }

    private tbAttached SaveAttached(File fx, String fileName, String UUID, String uploadFileName, String des, String cnsort) throws Exception {
        FileInputStream fileInputStream = null;
        try {
            LoginUserInfo loginInfo = CompanyContext.get();
            fileInputStream = new FileInputStream(fx);
            UploadUtils uploadUtils = getUtils();
            uploadFileResult rr = uploadUtils.uploadAssist(uploadFileName, fileInputStream);
            if (rr.isSuccess() == true) {
                tbAttached tbAttached = new tbAttached();
                tbAttached.setUserId(loginInfo.getUserId());
                tbAttached.setAttached(fileName);
                tbAttached.setPath(rr.getFullPath());
                tbAttached.setPictureDescription(des);
                tbAttached.setCnSort(cnsort);
                tbAttached.setSort(getDigital(cnsort));
                tbAttached.setAttId(UUID);
                tbAttached.setType("Img");
                tbAttached.setRowValue(loginInfo.getRowValue());
                tbAttached.setCreateMan(loginInfo.getUserName());
                tbAttached.setCreateTime(new Date());
                attachedRepository.save(tbAttached);
                return tbAttached;
            }else throw new Exception("文件上传失败!");
        }catch (Exception ax) {
            throw ax;
        }finally {
            if (fileInputStream != null) {
                try {
                    fileInputStream.close();
                }catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private tbAttached ReplaceAttached(File fx, String uploadFileName, String AttID) throws Exception {
        FileInputStream fileInputStream = null;
        try {
            LoginUserInfo loginInfo = CompanyContext.get();
            fileInputStream = new FileInputStream(fx);
            UploadUtils uploadUtils = getUtils();
            uploadFileResult rr = uploadUtils.uploadAssist(uploadFileName, fileInputStream);
            if (rr.isSuccess() == true) {
                tbAbstractAttached abstractAttached = abstractAttachedRepository.findAllByAttidAndRowValue(AttID, loginInfo.getRowValue());
                if (abstractAttached != null) {
                    String[] news = rr.getFullPath().split("\\.");
                    String newName = news[0];
                    abstractAttached.setAttid(rr.getFullPath());
                }
                Optional<tbAttached> findOne = attachedRepository.findFirstByAttId(AttID);
                tbAttached attached = new tbAttached();
                if (findOne.isPresent()) {
                    attached = findOne.get();
                    attached.setPath(rr.getFullPath());
                }
                attachedRepository.save(attached);
                return attached;
            }else throw new Exception("文件上传失败!");
        }catch (Exception ax) {
            throw ax;
        }finally {
            if (fileInputStream != null) {
                try {
                    fileInputStream.close();
                }catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private UploadUtils getUtils() {
        return UploadUtils.getInstance();
    }

    private Integer getDigital(String str){
        str = str.trim();
        String regEx = "[^0-9]";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(str);
        return Integer.parseInt(m.replaceAll("").trim());
    }
}
