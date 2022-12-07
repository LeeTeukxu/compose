package com.zhide.assist.common;

import java.io.PrintWriter;
import java.io.StringWriter;

public class ExceptionUtils {
    public static String getStrackTrace(Exception ax){
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
        ax.printStackTrace();
        return sw.toString();
    }
}
