package com.zhide.assist.multitenancy;

import com.zaxxer.hikari.HikariDataSource;
import com.zhide.assist.models.LoginUserInfo;
import com.zhide.assist.models.connectionInfo;
import com.zhide.assist.services.connectionParsor;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.jdbc.datasource.lookup.AbstractRoutingDataSource;

import javax.sql.DataSource;
import java.awt.image.Kernel;
import java.sql.SQLException;
import java.util.Map;

public class DynamicDataSource extends AbstractRoutingDataSource {

    Map<Object,Object> OX = null;

    @Override
    public void setDefaultTargetDataSource(Object defaultTargetDataSource) {
        super.setDefaultTargetDataSource(defaultTargetDataSource);
    }

    @Override
    protected Object determineCurrentLookupKey() {
        LoginUserInfo info = CompanyContext.get();
        String key = "";
        if (info!=null) key = "0";else key = "Default";
        if (OX.containsKey(key) == false){
            connectionParsor connectionParsor = new connectionParsor();
            DataSource defaultDataSource = (DataSource) OX.get("Default");
            try {
                connectionParsor.setConnection(defaultDataSource.getConnection());
            }catch (SQLException e){
                e.printStackTrace();
            }
            connectionInfo Info = connectionParsor.getByID(key);
            DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create();
            dataSourceBuilder.url("jdbc:sqlserver://"
                    + Info.getServer() + ":"
                    +Info.getPort()+";DatabaseName="
                    +Info.getDataBase()
                    +";Pooling=true;Min Pool Size=5;Max Pool Size=20");
            dataSourceBuilder.username(Info.getUsername());
            dataSourceBuilder.password(Info.getPassword());
            dataSourceBuilder.driverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            HikariDataSource tinySource = (HikariDataSource) dataSourceBuilder.build();
            OX.put(key,tinySource);
            super.setTargetDataSources(OX);
            super.afterPropertiesSet();
        }
        return key;
    }

    public void setDataSource(Map<Object,Object> dataSource){
        OX = dataSource;
        super.setTargetDataSources(dataSource);
    }
}
