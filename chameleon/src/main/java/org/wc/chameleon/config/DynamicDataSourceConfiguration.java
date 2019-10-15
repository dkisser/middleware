package org.wc.chameleon.config;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.wc.chameleon.DBType;
import org.wc.chameleon.DynamicRouteDataSource;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by WenChen on 2019/10/14.
 */
@Configuration
public class DynamicDataSourceConfiguration {
//TODO 暂时注释掉applicationConfig获取配置文件信息的方式
//    @Resource(name =  "applicationConfig")
    private ApplicationConfig applicationConfig;

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.master")
    public DataSource masterDataSource (){
//        ApplicationConfig.DataSource source = applicationConfig.getDataSource();
//        return DataSourceBuilder.create()
//                .url(source.getUrl()).build();
        return DataSourceBuilder.create().build();
    }

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.slave1")
    public DataSource slave1DataSource (){
//        ApplicationConfig.DataSource source = applicationConfig.getDataSource();
//        return DataSourceBuilder.create()
//                .url(source.getUrl()).build();
        return DataSourceBuilder.create().build();
    }

    @Bean
    @ConfigurationProperties(prefix = "spring.datasource.slave1")
    public DataSource slave2DataSource (){
//        ApplicationConfig.DataSource source = applicationConfig.getDataSource();
//        return DataSourceBuilder.create()
//                .url(source.getUrl()).build();
        return DataSourceBuilder.create().build();
    }

    @Bean
    public DataSource dynamicRouteDatSource (@Qualifier("masterDataSource") DataSource masterDataSource,
    @Qualifier("slave1DataSource")DataSource slave1DataSource, @Qualifier("slave2DataSource")DataSource slave2DataSource){
        Map<Object,Object> targetResourcesMap = new HashMap<>();
        targetResourcesMap.put(DBType.master,masterDataSource);
        targetResourcesMap.put(DBType.slave1,slave1DataSource);
        targetResourcesMap.put(DBType.slave2,slave2DataSource);
        DynamicRouteDataSource target = new DynamicRouteDataSource();
        target.setDefaultTargetDataSource(masterDataSource);
        target.setTargetDataSources(targetResourcesMap);
        return target;
    }
}
