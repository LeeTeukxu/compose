package com.zhide.assist.common;

public class uploadFileResult {
    private boolean success;
    private String fullPath;
    private String message;

    public boolean isSuccess(){return success;}

    public void setSuccess(boolean success){this.success=success;}

    public String getFullPath(){return fullPath;}

    public void setFullPath(String fullPath){this.fullPath=fullPath;}

    public String getMessage(){return message;}

    public void setMessage(String message){this.message=message;}
}
