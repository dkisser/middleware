package org.wc.chameleon.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

/**
 * Created by WenChen on 2019/10/14.
 */
@Configuration
@ConfigurationProperties(prefix = "mybatis")
public class MybatisConfig {

    private String mapperLocations;

    public String getMapperLocations() {
        return mapperLocations;
    }

    public void setMapperLocations(String mapperLocations) {
        this.mapperLocations = mapperLocations;
    }
}
