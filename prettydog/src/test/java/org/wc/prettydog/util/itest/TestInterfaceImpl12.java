package org.wc.prettydog.util.itest;

import org.wc.prettydog.annotation.SPIMeta;

/**
 * Created by WenChen on 2019/8/7.
 */
@SPIMeta(id = "default")
public class TestInterfaceImpl12 implements TestInterface{
    @Override
    public void handler() {
        System.out.println(333);
    }
}
