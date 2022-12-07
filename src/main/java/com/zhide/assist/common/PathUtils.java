package com.zhide.assist.common;

import java.io.File;

public class PathUtils {

    private static String baseDir = "C:\\AssistFtp";

    public static String getFullPath(String... paths) throws Exception{
        String fullPath = baseDir;
        for (int i=0;i<paths.length;i++){
            String path = paths[i];
            path = path.replace('\\',' ').trim();
            fullPath += "\\" + path;
        }
        File f = new File(fullPath);
        if (f.exists()==false){
            if (f.isDirectory() == true)f.mkdirs();
        }
        return fullPath;
    }

    public static String getTempPath(String... paths) throws Exception{
        String TempPath=baseDir + "\\";
        for (int i=0;i<paths.length;i++){
            String path = paths[i];
            path = path.replace('\\',' ').trim();
            TempPath += "\\"+path;
        }
        File f = new File(TempPath);
        if (f.isDirectory()){
            if (f.exists() == false){
                f.mkdirs();
            }
        }
        return TempPath;
    }

    public static String getImages() throws Exception{
        String fullPath = baseDir + "\\Images\\";
        File f = new File(fullPath);
        if (f.isDirectory()){
            if (f.exists() == false){
                f.mkdirs();
            }
        }
        return fullPath;
    }
}
