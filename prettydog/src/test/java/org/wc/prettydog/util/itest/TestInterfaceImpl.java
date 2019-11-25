package org.wc.prettydog.util.itest;

import org.wc.prettydog.annotation.SPIMeta;

/**
 * Created by WenChen on 2019/8/7.
 */
@SPIMeta(id = "test1")
public class TestInterfaceImpl implements TestInterface{
    @Override
    public void handler() {
        System.out.println(1111);
    }
}
