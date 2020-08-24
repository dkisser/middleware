package org.wc.midware.netbar.test.config;

import org.junit.Before;
import org.junit.Test;
import org.wc.midware.netbar.api.URL;
import org.wc.midware.netbar.common.config.Parser;
import org.wc.midware.netbar.core.config.ServiceConfigBean;
import org.wc.prettydog.support.ExtensionLoader;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2020/8/17.
 */
public class ServiceConfigBeanTest {

    private Parser parser;

    private static final Map<String,ServiceConfigBean> map = new ConcurrentHashMap<>(16);

    @Before
    public void init(){
        parser = ExtensionLoader.getExtensionLoader(Parser.class).getDefaultExtension();
    }

    @Test
    public void testService() throws IOException {
        List<URL> url = parser.parse();
        url.forEach(u -> {
            ServiceConfigBean config = new ServiceConfigBean(u);
            config.service();
            map.putIfAbsent(u.getIdentifyStr(),config);
        });
        System.in.read();
    }

    @Test
    public void testOneService() throws IOException {
        String urlStr = "netbar://127.0.0.1:6668?consumer.timeout=10000&provider" +
                ".timeout=10000&serviceId=test11&impl=org.wc.midware.netbar.common" +
                ".DefaultRPCHandlerImpl&group=fd&version=ew";
        URL url = URL.valueOf(urlStr);
        ServiceConfigBean config = new ServiceConfigBean(url);
        config.service();
        System.in.read();
    }

}
