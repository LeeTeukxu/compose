package com.zhide.assist.common;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.Serializable;
import java.util.Date;

public class successResult implements Serializable {
    Logger logger= LoggerFactory.getLogger(successResult.class);
    private String className;
    private String methodName;
    java.util.Date begin;
    java.util.Date end;
    public successResult(){
        success=true;
        try {
            className = Thread.currentThread().getStackTrace()[2].getClassName();//调用的类名
            logger=LoggerFactory.getLogger(Class.forName(className));
            methodName = Thread.currentThread().getStackTrace()[2].getMethodName();//调用的方法名
            begin=new java.util.Date();
            logger.info("----"+"["+methodName+"]开始执行----");
        }
        catch(Exception ax){
            logger.info("success在获取当前方法和当前类名时发生了错误:"+ax.getMessage());
        }
    }
    private String message;
    private Object data;
    private boolean success;
    public void raiseException(Exception ax){
        setMessage(ax.getMessage());
        setSuccess(false);
        String message=ax.getMessage();
        if(StringUtils.isEmpty(message)==false) {
            logger.info("[" + methodName + "]执行出现错误:" + ax.getMessage());
        } else {
            String VX="\r\n"+
                    "X--------------------------------------"+methodName+"执行出现异常------------------------------------X";
            VX+="\r\n"+ExceptionUtils.getStrackTrace(ax)+"\r\n";
            VX+="X--------------------------------------------------------------------------------------------------X";
            logger.error(VX);
        }
    }
    public String getMessage() {
        end=new Date();
        logger.info(methodName+"执行用时:"+Long.toString(end.getTime()-begin.getTime())+"毫秒。");
        logger.info("----["+methodName+"]执行结束----");
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }
}
