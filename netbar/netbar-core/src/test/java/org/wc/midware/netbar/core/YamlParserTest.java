package org.wc.midware.netbar.core;

import org.junit.Before;
import org.junit.Test;
import org.wc.midware.netbar.api.URL;
import org.wc.midware.netbar.common.config.Parser;
import org.wc.prettydog.support.ExtensionLoader;

import java.util.List;

/**
 * Created by WenChen on 2020/8/12.
 */
public class YamlParserTest {

    private Parser parser;

    @Before
    public void init(){
        parser = ExtensionLoader.getExtensionLoader(Parser.class).getDefaultExtension();
    }

    @Test
    public void test(){
        List<URL> urls = parser.parse();
        urls.forEach(url -> {
            System.out.println(url.getEnCodePath());
        });
        String str = "test%3A%2F%2F127.0.0.2%3A6666%3Ftest1%3D1%26test2%3D2%26serviceId%3Dtest1%26impl%3Dhfk" +
                "d%26group%3Dfd%26version%3Dew";
        System.out.println(URL.deCodeAndGet(str));
    }
}
