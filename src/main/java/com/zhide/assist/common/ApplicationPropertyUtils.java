package com.zhide.assist.common;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class ApplicationPropertyUtils {
    private static final Logger logger = LoggerFactory.getLogger(ApplicationPropertyUtils.class);
    private static Properties props;

    static {
        loadProps();
    }

    synchronized static private void loadProps() {
        logger.info("开始加载Application.properties文件内容.......");
        props = new Properties();
        InputStream in = null;
        try {
            in = ApplicationPropertyUtils.class.getClassLoader().getResourceAsStream("application.properties");
            props.load(in);
        } catch (FileNotFoundException e) {
            logger.error("application.properties文件未找到");
        } catch (IOException e) {
            logger.error("出现IOException");
        } finally {
            try {
                if (null != in) {
                    in.close();
                }
            } catch (IOException e) {
                logger.error("application.properties文件流关闭出现异常");
            }
        }
        logger.info("加载Application.properties文件内容完成...........");
        //logger.info("properties文件内容：" + props);
    }

    public static String getProperty(String key) {
        if (null == props) {
            loadProps();
        }
        return props.getProperty(key);
    }
}
