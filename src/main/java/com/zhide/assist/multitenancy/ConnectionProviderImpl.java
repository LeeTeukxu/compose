package com.zhide.assist.multitenancy;

import org.hibernate.engine.jdbc.connections.spi.AbstractDataSourceBasedMultiTenantConnectionProviderImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.sql.DataSource;
import javax.xml.crypto.Data;

public class ConnectionProviderImpl extends AbstractDataSourceBasedMultiTenantConnectionProviderImpl {
    private final Logger logger= LoggerFactory.getLogger(ConnectionProviderImpl.class);

    @Override
    protected DataSource selectAnyDataSource() {
        logger.info("get Connection from Assist.....");
        return DataSourceProvider.getDataSource("Default");
    }

    @Override
    protected DataSource selectDataSource(String s) {
        if (s.equals("Assist") == false){
            return DataSourceProvider.getDataSource(s);
        }else {
            return DataSourceProvider.getDataSource("Assist");
        }
    }
}
