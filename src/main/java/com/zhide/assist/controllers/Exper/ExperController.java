package com.zhide.assist.controllers.Exper;

import com.alibaba.fastjson.JSON;
import com.zhide.assist.common.FTPUtil;
import com.zhide.assist.common.PathUtils;
import com.zhide.assist.common.WebFileUtils;
import com.zhide.assist.common.successResult;
import com.zhide.assist.models.*;
import com.zhide.assist.repositorys.tbAttachedRepository;
import com.zhide.assist.services.define.IExperService;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.util.Strings;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.Transactional;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/Exper")
public class ExperController {

    Logger logger = LoggerFactory.getLogger(ExperController.class);

    @Autowired
    IExperService experService;

    @Autowired
    tbAttachedRepository attachedRepository;

    @RequestMapping("/index")
    public String Index(String Mode, Integer TechMainID, Map<String, Object> model) {
        List<tbAttached> listImg = attachedRepository.getAllByRowValueAndTypeOrderBySort(TechMainID, "Img");
        model.put("Mode", Mode);
        model.put("TechMainID", TechMainID);
        if (listImg.size() > 0) {
            model.put("ListImg", listImg);
        }else model.put("ListImg", "{}");
        return "/Truth/main/exper/index";
    }

    @RequestMapping("/addzipfileindex")
    public String AddZipFileIndex(String Mode, String TechMainID, String UploadUrl, Map<String, Object> model) {
        List<tbAttached> ZipFileLength = attachedRepository.getAllByRowValueAndTypeOrderBySort(Integer.parseInt(TechMainID), "Zip");
        model.put("Mode", Mode);
        if (StringUtils.isEmpty(TechMainID)) TechMainID = "";
        model.put("TechMainID", TechMainID);
        model.put("UploadUrl", UploadUrl);//自定义上传方法
        model.put("ManyFile", "true");
        model.put("ZipFileLength", ZipFileLength.size());
        return "/common/addFile";
    }

    @RequestMapping("/addimgfileindex")
    public String AddImgFileIndex(String Mode, String TechMainID, String UploadUrl, Map<String, Object> model) {
        List<tbAttached> ImgFileLength = attachedRepository.getAllByRowValueAndTypeOrderBySort(Integer.parseInt(TechMainID), "Img");
        model.put("Mode", Mode);
        if (StringUtils.isEmpty(TechMainID)) TechMainID = "";
        model.put("TechMainID", TechMainID);
        model.put("UploadUrl", UploadUrl);//自定义上传方法
        model.put("ManyFile", "true");
        model.put("ImgFileLength", ImgFileLength.size());
        return "/common/addImgFile";
    }

    @RequestMapping("/zipfileupload")
    @ResponseBody
    public successResult ZipFileUpload(MultipartFile file, HttpServletRequest request) {
        successResult result = new successResult();
        List<String> FileNames = Arrays.asList(request.getParameterValues("fileNames[]"));
        String TechMainID = request.getParameter("TechMainID");
        try {
            if (file == null) {
                throw new Exception("图片附件格式异常。");
            }
            String fileName = file.getOriginalFilename();
            if (fileName.toLowerCase().indexOf("zip") == -1) {
                throw new Exception("图片附件只能是以zip结尾的压缩文件!");
            }
            tbAttached obj = experService.AddFile(file, TechMainID, FileNames, "ZipFiles");
            result.setData(obj);
        }catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping("/imgfileupload")
    @ResponseBody
    public successResult ImgFileUpload(MultipartFile file, HttpServletRequest request) {
        successResult result = new successResult();
        List<String> FileNames = Arrays.asList(request.getParameterValues("fileNames[]"));
        String TechMainID = request.getParameter("TechMainID");
        try {
            if (file == null) {
                throw new Exception("技术方案图纸/照片格式异常。");
            }
            String fileName = file.getOriginalFilename();
            if (fileName.toLowerCase().indexOf("jpg") == -1 && fileName.toLowerCase().indexOf("png") == -1 && fileName.toLowerCase().indexOf("tif") == -1 && fileName.toLowerCase().indexOf("bmp") == -1 && fileName.toLowerCase().indexOf("gif") == -1) {
                throw new Exception("技术方案图纸/照片只能是以jpg、png、tif、bmp、gif结尾的图片文件!");
            }
            tbAttached obj = experService.AddFile(file, TechMainID, FileNames,"ImgFiles");
            result.setData(obj);
        }catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping("/getZipAttachedByTechMainIDAndType")
    public @ResponseBody
    successResult GetZipAttachedByTechMainIDAndType(String TechMainID, String Type) {
        successResult result = new successResult();
        try {
            List<Map<String, Object>> rr = new ArrayList<>();
            if (Strings.isEmpty(TechMainID) == false) {
                List<tbAttached> atts = attachedRepository.getAllByRowValueAndTypeOrderBySort(Integer.parseInt(TechMainID), Type);
                for (int i=0;i<atts.size();i++) {
                    tbAttached att = atts.get(i);
                    Map<String, Object> r = new HashMap<>();
                    r.put("ATTID", att.getAttId());
                    r.put("FILESIZE", att.getSize());
                    r.put("FILENAME", att.getAttached());
                    r.put("Path", att.getPath());
                    r.put("PictureDescription", att.getPictureDescription());
                    r.put("CnSort", att.getSort());
                    r.put("Sort", att.getSort());
                    r.put("RowValue", att.getRowValue());
                    r.put("UPLOADMAN", att.getCreateMan());
                    r.put("UPLOADTIME", att.getCreateTime());
                    rr.add(r);
                }
                result.setData(rr);
            }
        }catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping("/download")
    public void Download(String AttID, HttpServletResponse response) {
        try {
            Optional<tbAttached> findOne = attachedRepository.findFirstByAttId(AttID);
            if (findOne.isPresent()) {
                tbAttached attached = findOne.get();
                String Path = attached.getPath();
                FTPUtil ftpUtil = new FTPUtil();
                String[] exts = attached.getPath().split("\\.");
                String extName = exts[exts.length - 1];
                String SavePath = PathUtils.getFullPath("Temp", attached.getAttached() + "." + extName);
                if (ftpUtil.connect() == true) {
                    ftpUtil.download(Path, SavePath);
                    WebFileUtils.download(attached.getAttached() + "." + extName, new File(SavePath), response);
                }else response.getWriter().write("FTP登录失败!");
            }else response.getWriter().write("下载的文件不存在!");
        }catch (Exception ax) {
            try {
                response.getWriter().write(ax.getMessage());
            }catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    @ResponseBody
    @RequestMapping("/deleteById")
    @Transactional
    public successResult DeleteById(String AttID, String TechMainID, String Type, String Path) {
        successResult result = new successResult();
        try {
            experService.DeleteById(AttID, TechMainID, Type, Path);
        }catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/batchDeleteById")
    @Transactional
    public successResult BatchDeleteById(HttpServletRequest request){
        successResult result = new successResult();
        try {
            List<String> listAttIds = JSON.parseArray(request.getParameter("AttID"), String.class);;
            String TechMainID = request.getParameter("TechMainID");
            String Type = request.getParameter("Type");
            List<String> listPaths = JSON.parseArray(request.getParameter("Paths"), String.class);
            experService.BatchDeleteById(listAttIds, listPaths, TechMainID, Type);
        }catch (Exception ax){
            result.raiseException(ax);
        }
        return result;
    }

    @ResponseBody
    @RequestMapping("/getAllAttachedByRowValueAndType")
    public List<TreeNode> GetAllAttachedByRowValueAndType(Integer TechMainID, String Type) {
        return experService.GetAllAttachedByRowValueAndType(TechMainID, Type);
    }

    @ResponseBody
    @RequestMapping("/getImageList")
    public successResult GetImageList(Integer TechMainID, String Type) {
        successResult result = new successResult();
        try {
            List<tbAttached> list = attachedRepository.getAllByRowValueAndType(TechMainID, Type);
            result.setData(list);
        }catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping("/replaceatt")
    @ResponseBody
    public successResult ReplaceAtt(MultipartFile file, HttpServletRequest request) {
        successResult result = new successResult();
        try {
            String AttID = request.getParameter("AttID");
            if (file == null) {
                throw new Exception("技术方案图纸/照片格式异常。");
            }
            String fileName = file.getOriginalFilename();
            if (fileName.toLowerCase().indexOf("jpg") == -1 && fileName.toLowerCase().indexOf("png") == -1 && fileName.toLowerCase().indexOf("tif") == -1 && fileName.toLowerCase().indexOf("bmp") == -1 && fileName.toLowerCase().indexOf("gif") == -1) {
                throw new Exception("技术方案图纸/照片只能是以jpg、png、tif、bmp、gif结尾的图片文件!");
            }
            tbAttached attached = experService.ReplaceAtt(file, AttID);
            result.setData(attached);
        }catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }

    @RequestMapping("/updatePicDes")
    @ResponseBody
    public successResult UpdatePicDes(HttpServletRequest request) {
        successResult result = new successResult();
        try {
            String Value = request.getParameter("Value");
            String AttID = request.getParameter("AttID");
            tbAttached attached = experService.UpdatePicDes(Value, AttID);
            result.setData(attached);
        }catch (Exception ax) {
            result.raiseException(ax);
        }
        return result;
    }
}
