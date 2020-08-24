package org.wc.midware.netbar.core;

import org.wc.midware.netbar.api.URL;
import org.wc.midware.netbar.common.config.Parser;
import org.wc.midware.netbar.core.config.ServiceConfigBean;
import org.wc.prettydog.support.ExtensionLoader;

import java.util.List;

/**
 * Created by WenChen on 2020/8/24.
 */
public class Bootstrap {

    private Parser parser = ExtensionLoader.getExtensionLoader(Parser.class).getDefaultExtension();

    public void start(){
        List<URL> url = parser.parse();
        url.forEach(u -> new ServiceConfigBean(u).service());
    }
}
