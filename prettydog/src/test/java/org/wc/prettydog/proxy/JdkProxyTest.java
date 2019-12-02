package org.wc.prettydog.proxy;

import org.junit.Test;
import org.wc.prettydog.util.itest.TestInterface;
import org.wc.prettydog.util.itest.TestInterfaceImpl;

import javax.security.auth.Subject;

/**
 * Created by WenChen on 2019/11/29.
 */
public class JdkProxyTest {

    @Test
    public void testProxy (){
        TestInterface subject = new TestInterfaceJdkProxy(new TestInterfaceImpl()).getProxy();
        subject.handler();
    }
}
