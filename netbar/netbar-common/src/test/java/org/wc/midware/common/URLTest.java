package org.wc.midware.common;

import org.junit.Test;
import org.wc.midware.netbar.api.URL;

/**
 * Created by WenChen on 2020/8/6.
 */
public class URLTest {

    @Test
    public void urlTest(){
        String str1 = "redis://127.0.0.1:-1120?version=0.1&group=0";
        String str = "redis://127.0.0.1:1120?test1=tesst1dsdsds&test2=test2strr";
        URL u = URL.valueOf(str1);
        URL u1 = URL.valueOf(str);
        System.out.println(u1.getIdentifyStr());
    }
}
