package org.wc.prettydog;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * Created by WenChen on 2019/7/25.
 */
@SpringBootApplication
@MapperScan(value = {"org.wc.prettydog.db.dao"})
public class PrettydogApplication {
    public static void main (String[] args){
        SpringApplication.run(PrettydogApplication.class);
    }
}
