package org.wc.chameleon;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

/**
 * Created by WenChen on 2019/10/14.
 */
@Aspect
@Component
public class DynmicDataSourceAop {

    @Pointcut("!@annotation(org.wc.chameleon.annotation.Master)&&(" +
            "(execution(* org.wc.chameleon.service..*.select*(..)))||" +
            "(execution(* org.wc.chameleon.service..*.find*(..)))||" +
            "(execution(* org.wc.chameleon.service..*.get*(..))))")
    public void readPointcut(){

    }

    @Pointcut("@annotation(org.wc.chameleon.annotation.Master)||" +
            "(execution(* org.wc.chameleon.service..*.insert*(..)))||" +
            "(execution(* org.wc.chameleon.service..*.add*(..)))||" +
            "(execution(* org.wc.chameleon.service..*.update*(..)))||" +
            "(execution(* org.wc.chameleon.service..*.del*(..)))")
    public void writePointcut(){

    }

    @Before("readPointcut()")
    public void read(){
        DataSourceSelector.set(DBType.slave1);
    }

    @Before("writePointcut()")
    public void write(){
        DataSourceSelector.set(DBType.master);
    }

}
