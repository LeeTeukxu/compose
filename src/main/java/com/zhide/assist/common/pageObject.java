package com.zhide.assist.common;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class pageObject {
    int total;
    Object data;
    Logger logger;
    public pageObject(){
        logger= LoggerFactory.getLogger(pageObject.class);
    }
    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }

    boolean success;
    String errorMsg;
    public int getTotal() {
        return total;
    }
    public void setTotal(int total) {
        this.total = total;
    }
    public void setTotal(long total){
        this.total=Integer.parseInt(Long.toString(total));
    }
    public Object getData() {
        return data;
    }
    public void setData(Object data) {
        this.data = data;
    }
    public void raiseException(Exception ax){
        success=false;
        errorMsg=ax.getMessage();
        if(StringUtils.isEmpty(errorMsg))errorMsg=ExceptionUtils.getStrackTrace(ax);
        logger.info(errorMsg);
    }
}
