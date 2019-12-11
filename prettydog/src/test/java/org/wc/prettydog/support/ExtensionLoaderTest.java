package org.wc.prettydog.support;

import org.junit.Test;
import org.wc.prettydog.support.ExtensionLoader;
import org.wc.prettydog.util.itest.TestInterface;

/**
 * Created by WenChen on 2019/8/7.
 */
public class ExtensionLoaderTest {

    @Test
    public void testGetExtensionById(){
        TestInterface inte = ExtensionLoader.getExtensionLoader(TestInterface.class).getExtensionById("test1");
        inte.handler();
    }

    @Test
    public void testGetDefaultExtension(){
        TestInterface inte = ExtensionLoader.getExtensionLoader(TestInterface.class).getDefaultExtension();
        inte.handler();
    }

    @Test
    public void testWrapperedExtension(){
        TestInterface inte = ExtensionLoader.getExtensionLoader(TestInterface.class).getDefaultExtension();
        inte.handler();
    }
}
