package com.zhide.assist.multitenancy;

import org.hibernate.engine.jdbc.connections.spi.AbstractDataSourceBasedMultiTenantConnectionProviderImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;

@Component
public class MultiCompanyConnectionProviderImpl extends AbstractDataSourceBasedMultiTenantConnectionProviderImpl {
    private final Logger logger= LoggerFactory.getLogger(MultiCompanyConnectionProviderImpl.class);
    @Override
    protected DataSource selectAnyDataSource() {
        logger.info("get Connection from Assist.....");
        return DataSourceProvider.getDataSource("Default");
    }

    @Override
    protected DataSource selectDataSource(String s) {
        if(s.equals("Assist")==false) {
            //logger.info("get  Connection from Client_" + s + ".....");
            return DataSourceProvider.getDataSource(s);
        } else {
            //logger.info("get  Connection from DTSystem.....");
            return DataSourceProvider.getDataSource("Default");
        }
    }
}
