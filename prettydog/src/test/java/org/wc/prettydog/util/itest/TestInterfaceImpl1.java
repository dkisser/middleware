package org.wc.prettydog.util.itest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Component;

/**
 * Created by WenChen on 2019/8/7.
 */
public class TestInterfaceImpl1 implements TestInterface{

    @Autowired
    private TestInterfaceImpl testInterface;

    @Override
    public void handler() {
        System.out.println(22222);
    }
}
