package org.wc.tinycat.autoconfig;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

/**
 * Created by WenChen on 2020/1/19.
 */
@ComponentScan(value = {"org.wc.tinycat","org.wc.webserver"})
@Configuration
@ImportResource("classpath:applicationContext.xml")
public class TinyCatStartConfigurature {
}
