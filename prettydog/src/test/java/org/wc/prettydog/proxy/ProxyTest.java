package org.wc.prettydog.proxy;

import org.junit.Test;
import org.wc.prettydog.util.itest.TestInterface;

import javax.sound.midi.Soundbank;
import java.lang.reflect.*;

/**
 * Created by WenChen on 2020/1/15.
 */
public class ProxyTest {

    @Test
    public void test(){
        InvocationHandler handler = Proxy.getObject(new Class[]{InvocationHandler.class},new InvocationWrapper(new
                                                                                                                   Invocation() {
            @Override
            public Object invoke(String method, Object[] args) {
                System.out.println(111);
                return null;
            }
        }));
        try {
            handler.invoke(null,null,null);
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
    }

}
