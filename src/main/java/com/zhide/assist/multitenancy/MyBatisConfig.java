package com.zhide.assist.multitenancy;

import com.zaxxer.hikari.HikariDataSource;
import com.zhide.assist.models.connectionInfo;
import com.zhide.assist.services.connectionParsor;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.management.DynamicMBean;
import javax.sql.DataSource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Configuration
public class MyBatisConfig {

    @Bean
    public SqlSessionFactoryBean getSqlSessionFactoryBean() throws Exception{
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dynamicDataSource());
        sqlSessionFactoryBean.setTypeAliasesPackage("com.zhide.assist.models");
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        sqlSessionFactoryBean.setMapperLocations(resolver.getResources("classpath*:/mybatis/mapper/*.xml"));
        return sqlSessionFactoryBean;
    }

    @Bean
    public DynamicDataSource dynamicDataSource(){
        connectionParsor connectionParsor = new connectionParsor();
        Map<Object,Object> dataSources = new HashMap<>();
        DynamicDataSource d = new DynamicDataSource();
        DataSource defaultDataSource = connectionParsor.getDefaultConnection();
        dataSources.put("Default",defaultDataSource);
        d.setDefaultTargetDataSource(defaultDataSource);

        try {
            connectionParsor.setConnection(defaultDataSource.getConnection());
            connectionInfo Info = connectionParsor.getByID("0");
            DataSourceBuilder dataSourceBuilder = DataSourceBuilder.create();
            dataSourceBuilder.url("jdbc:sqlserver://" + Info.getServer() +
                    ":"+Info.getPort()+";DatabaseName=" +
                    Info.getDataBase()+";Pooling=true;Min Pool Size=5;Max Pool Size=20;");

            dataSourceBuilder.username(Info.getUsername());
            dataSourceBuilder.password(Info.getPassword());
            dataSourceBuilder.driverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            HikariDataSource tinySource = (HikariDataSource) dataSourceBuilder.build();
            tinySource.setMaximumPoolSize(20);
            dataSources.put("0", tinySource);
        }catch (Exception ax){
            System.out.println(ax.getMessage());
        }
        d.setDataSource(dataSources);
        return d;
    }
}
