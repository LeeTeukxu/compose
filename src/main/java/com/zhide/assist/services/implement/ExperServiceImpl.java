package com.zhide.assist.services.implement;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.*;
import com.zhide.assist.mapper.AttachedMapper;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.TreeNode;
import com.zhide.assist.models.tbAttached;
import com.zhide.assist.multitenancy.CompanyContext;
import com.zhide.assist.repositorys.tbAttachedRepository;
import com.zhide.assist.services.define.IExperService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.transaction.Transactional;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;

@Service
public class ExperServiceImpl implements IExperService {

    @Autowired
    private tbAttachedRepository attachedRepository;

    @Autowired
    AttachedMapper attachedMapper;

    private static String baseDir = "C:\\AssistFtp";

    @Override
    @Transactional(rollbackOn = Exception.class)
    public tbAttached AddFile(MultipartFile file, String TechMainID, List<String> FileNames, String FileType) throws Exception {
        String uuId = UUID.randomUUID().toString();
        if (file == null) {
            if (FileType.equals("ZipFiles")) {
                throw new Exception("图片附件数据无效，请检查浏览器是否工作正常!");
            }else throw new Exception("技术方案图纸/照片数据无效，请检查浏览器是否工作正常!");
        }
        String fileName = file.getOriginalFilename();
        File fx = SaveFile(file, uuId, FileType);
        if (fx.exists()) {
            tbAttached OO = SaveAttached(fx, fileName, uuId, fx.getName(), TechMainID, FileNames, FileType);
            return  OO;
        }else throw new Exception("上传文件:"+fileName+"保存失败,操作被异常中止!");
    }

    private File SaveFile(MultipartFile file, String UUID, String FileType) throws Exception {
        String fileName = file.getOriginalFilename();
        String[] exts = fileName.split("\\.");
        String extName = exts[exts.length - 1];
        String uploadFileName = UUID + "." + extName;
        String targetFile = PathUtils.getFullPath("Temp", uploadFileName);
        File fx = new File(targetFile);
        FileUtils.writeByteArrayToFile(fx, file.getBytes());
        return fx;
    }

    private tbAttached SaveAttached(File fx, String fileName, String UUID, String uploadFileName, String TechMainID, List<String> FileNames, String FileType) throws Exception {
        FileInputStream fileInputStream = null;
        try {
            LoginUserInfo loginInfo = CompanyContext.get();
            fileInputStream = new FileInputStream(fx);
            UploadUtils uploadUtils = getUtils();
            uploadFileResult rr = uploadUtils.uploadFile(uploadFileName, fileInputStream, FileType);
            if (rr.isSuccess() == true) {
                tbAttached attached = new tbAttached();
                for (String FName : FileNames) {
                    if (FName.indexOf(fileName) > -1) {
                        String[] names = FName.split("-&");
                        attached.setSort(Integer.parseInt(names[1]));
                        if (FileType.equals("ZipFiles")) {
                            attached.setCnSort("图片附件" + names[1]);
                        }else attached.setCnSort("图" + names[1]);
                    }
                }
                String[] exts = fileName.split("\\.");
                String extName = exts[0];
                attached.setAttached(extName);
                attached.setPictureDescription(extName);
                attached.setPath(rr.getFullPath());
                attached.setAttId(UUID);
                attached.setSize(Integer.parseInt(Long.toString(fx.length())));
                attached.setUserId(loginInfo.getUserId());
                if (FileType.equals("ZipFiles")) {
                    attached.setType("Zip");
                }else attached.setType("Img");
                attached.setRowValue(Integer.parseInt(TechMainID));
                attached.setCreateMan(loginInfo.getUserName());
                attached.setCreateTime(new Date());
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


    @Override
    public List<TreeNode> GetAllAttachedByRowValueAndType(Integer TechMainID, String Type) {
        List<Map<String, Object>> OO = attachedMapper.getAllAttsByTechMainIDAndType(TechMainID, Type);
        List<TreeNode> Nodes = JSON.parseArray(JSON.toJSONString(OO), TreeNode.class);
        return Nodes;
    }

    @Override
    @Transactional(rollbackOn = Exception.class)
    public tbAttached ReplaceAtt(MultipartFile file, String AttID) throws Exception {
        String uuId = UUID.randomUUID().toString();
        if (file == null) {
            throw new Exception("技术方案图纸/照片数据无效，请检查浏览器是否工作正常!");
        }
        String fileName = file.getOriginalFilename();
        File fx = SaveFile(file, uuId, "ImgFiles");
        if (fx.exists()) {
            tbAttached OO = ReplaceFile(fx, fileName, fx.getName(), AttID);
            return OO;
        }else throw new Exception("上传文件:"+fileName+"保存失败,操作被异常中止!");
    }

    private tbAttached ReplaceFile(File fx, String fileName, String uploadFileName, String AttID) throws Exception {
        FileInputStream fileInputStream = null;
        tbAttached att = new tbAttached();
        try {
            fileInputStream = new FileInputStream(fx);
            UploadUtils uploadUtils = getUtils();
            uploadFileResult rr = uploadUtils.uploadFile(uploadFileName, fileInputStream, "Img");
            if (rr.isSuccess() == true) {
                Optional<tbAttached> findOne = attachedRepository.findAllByAttIdAndType(AttID, "Img");
                if (findOne.isPresent()) {
                    att = findOne.get();
                    att.setPath(rr.getFullPath());
                    String[] exts = fileName.split("\\.");
                    String extName = exts[0];
                    att.setAttached(extName);
                }
                tbAttached attached = attachedRepository.save(att);
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

    @Override
    @Transactional(rollbackOn = Exception.class)
    public tbAttached UpdatePicDes(String Value, String AttID) throws Exception {
        Optional<tbAttached> findOne = attachedRepository.findFirstByAttId(AttID);
        tbAttached attached = null;
        if (findOne.isPresent()) {
            attached = new tbAttached();
            EntityHelper.copyObject(findOne.get(), attached);
            attached.setPictureDescription(Value);
        }
        tbAttached att = attachedRepository.save(attached);
        return att;
    }

    @Override
    public void DeleteById(String AttID, String TechMainID, String Type, String Path) {
        attachedRepository.deleteAllByAttId(AttID);
        File file = new File(Path.trim());
        String FileName = file.getName();
        if (Type.equals("Zip")) {
            DeleteFile(FileName, "ZipFiles");
        }else DeleteFile(FileName, "ImgFiles");
        UpdateAttSort(Integer.parseInt(TechMainID), Type);
    }

    @Override
    public void BatchDeleteById(List<String> listAttIds, List<String> listPaths, String TechMainID, String Type) {
        for(String AttID : listAttIds) {
            attachedRepository.deleteAllByAttId(AttID);
        }
        List<String> listPath = new ArrayList<>();
        for (String Path : listPaths) {
            File file = new File(Path.trim());
            String FileName = file.getName();
            listPath.add(FileName);
        }
        DeleteImgFile(listPath);
        UpdateAttSort(Integer.parseInt(TechMainID), Type);
    }

    private void UpdateAttSort(Integer TechMainID, String Type) {
        List<tbAttached> listAttached = new ArrayList<>();
        List<tbAttached> list = attachedRepository.getAllByRowValueAndTypeOrderBySort(TechMainID, Type);
        if (list.size() > 0) {
            for (int i=0;i<list.size();i++) {
                tbAttached attached = list.get(i);
                attached.setSort(i+1);
                if (Type.equals("Zip")) {
                    attached.setCnSort("图片附件" + (i+1));
                }else attached.setCnSort("图" + (i+1));
                listAttached.add(attached);
            }
        }
        attachedRepository.saveAll(listAttached);
    }

    private void DeleteFile(String Path, String Type) {
        FTPUtil util = new FTPUtil();
        File floder = new File(util.getPath() + "/" + Type);
        File[] files = floder.listFiles();
        for (File file : files) {
            if (file.getName().equals(Path)) {
                file.delete();
            }
        }
    }

    private void DeleteImgFile(List<String> listPath) {
        for (String Path : listPath) {
            File folder = new File(baseDir + "/ImgFiles");
            File[] files = folder.listFiles();
            for (File file : files) {
                if (file.getName().equals(Path)) {
                    file.delete();
                }
            }
        }
    }
}
