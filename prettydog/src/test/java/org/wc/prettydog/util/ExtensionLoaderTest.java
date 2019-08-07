package org.wc.prettydog.util;

import org.junit.Test;
import org.wc.prettydog.util.itest.TestInterface;

/**
 * Created by WenChen on 2019/8/7.
 */
public class ExtensionLoaderTest {

    @Test
    public void test(){
        TestInterface inte = ExtensionLoader.getExtensionLoader(TestInterface.class).getByExtensionId("test1");
        inte.handler();
    }
}
