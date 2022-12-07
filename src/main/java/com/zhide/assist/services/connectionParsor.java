package com.zhide.assist.services;

import com.zaxxer.hikari.HikariDataSource;
import com.zhide.assist.AssistApplication;
import com.zhide.assist.models.connectionInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

@Configuration
public class connectionParsor {
    private static Logger logger= LoggerFactory.getLogger(connectionParsor.class);
    private Map<String, connectionInfo> cacheInfo;
    List<String> allKeys = new ArrayList<>();
    Connection Con = null;
    public connectionParsor(){cacheInfo = new HashMap<>();}
    public void setConnection(Connection Con){
        this.Con = Con;
        Init();
    }
    private void Init(){
        List<String> alls = null;
        try {
            alls = getAllKeys(Con);
        }catch (Exception e) {
            logger.info("Init is a error occur！");
            e.printStackTrace();
        }
        if(alls==null){
            logger.info("alls is null!");
        }
        for(int i=0;i<alls.size();i++){
            String X=alls.get(i);
            X=X.replace(",",":");
            connectionInfo Y=parseSingle(X);
            if(Y!=null){
                cacheInfo.put("0",Y);
                allKeys.add("0");
            }
        }
    }
    public connectionInfo getByID(String ID){
        if(cacheInfo==null)cacheInfo=new HashMap<>();
        if(cacheInfo.size()==0)Init();
        if(cacheInfo.containsKey(ID)) {
            return cacheInfo.get(ID);
        }else {
            logger.info("return null as ConnectionInfo");
            return null;
        }
    }
    public List<String>getAllDataBaseCodes(){
        return allKeys;
    }
    private connectionInfo parseSingle(String conn) {
        String[] SS = conn.split(";");
        if (SS.length > 0) {
            connectionInfo Info = new connectionInfo();
            for (int i = 0; i < SS.length; i++) {
                String S = SS[i];
                String[] SX = S.split("=");
                if (S.startsWith("Server")) {
                    Info.setServer(SX[1]);
                    if(Info.getServer().indexOf(":")>-1){
                        String[] X1=Info.getServer().split(":");
                        Info.setPort(X1[1]);
                        Info.setServer(X1[0]);
                    }
                } else if (S.startsWith("Database")) {
                    Info.setDataBase(SX[1]);
                } else if (S.startsWith("User")) {
                    Info.setUsername(SX[1]);
                } else if (S.startsWith("Password")) {
                    Info.setPassword(SX[1]);
                }
            }
            return Info;
        } else return null;
    }
    public DataSource getDefaultConnection(){
        Properties p = new Properties();
        InputStream in = null;
        try {
            in= AssistApplication.class.getClassLoader().getResourceAsStream("application.properties");
            p.load(in);
            String url=p.getProperty("spring.datasource.url");
            String username=p.getProperty("spring.datasource.username");
            String password=p.getProperty("spring.datasource.password");
            DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create();
            dataSourceBuilder.url(url);
            dataSourceBuilder.username(username);
            dataSourceBuilder.password(password);
            dataSourceBuilder.driverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

            HikariDataSource dd=(HikariDataSource) dataSourceBuilder.build();
            dd.setMaximumPoolSize(20);
            dd.setIdleTimeout(60000);
            dd.setConnectionTimeout(10000);
            dd.setValidationTimeout(3000);
            dd.setConnectionTestQuery("Select 1");
            try {
                dd.setLoginTimeout(5);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            dd.setMaxLifetime(60000);
            return dd;
        } catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            try {
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return null;
    }
    private List<String> getAllKeys(Connection Conn) throws  Exception{
        List<String> result = new ArrayList<>();
        //result.add("Server=127.0.0.1:1433;Database=Assist;User Id=sa;Password=xxm_123456");
        result.add("Server=192.168.0.165:1433;Database=Assist;User Id=sa;Password=xxm_123456");
//        result.add("Server=rm-wz9514l21y27zsm4lso.sqlserver.rds.aliyuncs.com:3433;Database=Assist;User Id=xxm;Password=xxm_123456");
        return result;
    }
}
