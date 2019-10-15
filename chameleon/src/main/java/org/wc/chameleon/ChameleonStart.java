package org.wc.chameleon;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

/**
 * Created by WenChen on 2019/10/14.
 */
@MapperScan({"org.wc.chameleon.db.dao"})
@EnableAspectJAutoProxy
@SpringBootApplication
public class ChameleonStart {
    public static void main(String[] args){
        SpringApplication.run(ChameleonStart.class);
    }
}
