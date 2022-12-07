package com.zhide.assist.multitenancy;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import com.zhide.assist.models.connectionInfo;
import com.zhide.assist.services.connectionParsor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import javax.xml.crypto.Data;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@Component
public class DataSourceProvider {
    private static Map<String, DataSource> dataSourceMap = new HashMap<>();
    private static Logger logger= LoggerFactory.getLogger(DataSourceProvider.class);
    private static DataSource getDataBase(String ID){
        DataSource defaultSource = dataSourceMap.get("Default");
        connectionParsor connectionParsor = new connectionParsor();
        connectionInfo targetInfo = null;
        try {
            connectionParsor.setConnection(defaultSource.getConnection());
            targetInfo = connectionParsor.getByID("0");
        }catch (SQLException e){
            e.printStackTrace();
        }
        if (targetInfo==null){
            logger.info("targetInfo is null");
            return null;
        }
        String url="jdbc:sqlserver://"+targetInfo.getServer()+
                ":"+targetInfo.getPort()+";DatabaseName="+targetInfo.getDataBase()+";Pooling=true;Min Pool Size=5;Max Pool Size=20;";
        DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create();
        dataSourceBuilder.url(url);
        dataSourceBuilder.username(targetInfo.getUsername());
        dataSourceBuilder.password(targetInfo.getPassword());
        dataSourceBuilder.driverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        HikariDataSource dd = (HikariDataSource) dataSourceBuilder.build();
        dd.setMaximumPoolSize(20);
        dd.setIdleTimeout(40000);
        dd.setConnectionTimeout(60000);
        dd.setConnectionTestQuery("Select 1");
        try {
            dd.setLoginTimeout(5);
        }catch (SQLException e){
            e.printStackTrace();
        }
        dd.setMaxLifetime(60000);
        dataSourceMap.put(ID,dd);
        return dd;
    }

    public static DataSource getDataSource(String ID){
        DataSource dx = null;
        if (dataSourceMap.containsKey(ID)){
            dx = dataSourceMap.get(ID);
        }else {
            if (ID!="Default"){
                dx =getDataBase(ID);
            }else {
                connectionParsor connectionParsor = new connectionParsor();
                dx = connectionParsor.getDefaultConnection();
                dataSourceMap.put("Default", dx);
            }
        }
        return dx;
    }
}
