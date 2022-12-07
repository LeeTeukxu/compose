package com.zhide.assist.common;

import java.io.InputStream;

public class UploadUtils {
    FtpPath ftpPath;
    FTPUtil ftpUtil;
    public static UploadUtils getInstance(){return new UploadUtils();}
    private UploadUtils(){
        ftpPath = new FtpPath();
        ftpUtil = new FTPUtil();
    }

    public uploadFileResult uploadUpdateFile(String simpleName, InputStream stream){
        uploadFileResult  result = new uploadFileResult();
        String path = ftpPath.getUpdatePath();
        boolean oo = false;
        try {
            oo = ftpUtil.upload(stream,simpleName,path);
        }catch (Exception e){
            e.printStackTrace();
            oo = false;
        }
        result.setFullPath(path + simpleName);
        result.setSuccess(oo);
        return result;
    }

    public uploadFileResult uploadAssist(String fileName,InputStream stream){
        uploadFileResult result = new uploadFileResult();
        String path = ftpPath.getAssist();
        boolean oo = false;
        try {
            oo = ftpUtil.upload(stream,fileName,path);
        }catch (Exception ax){
            ax.printStackTrace();
            result.setMessage(ax.getMessage());
            oo=false;
        }
        result.setFullPath(path + fileName);
        result.setSuccess(oo);
        return result;
    }

    public uploadFileResult uploadFile(String fileName, InputStream stream, String FileType) {
        uploadFileResult result = new uploadFileResult();
        String Path = "";
        if (FileType.equals("ZipFiles")) {
            Path = ftpPath.getZipFile();
        }else Path = ftpPath.getImgFile();
        boolean oo = false;
        try {
            oo = ftpUtil.upload(stream, fileName, Path);
        }catch (Exception ax) {
            ax.printStackTrace();
            result.setMessage(ax.getMessage());
            oo = false;
        }
        result.setFullPath(Path + fileName);
        result.setSuccess(oo);
        return result;
    }
}
