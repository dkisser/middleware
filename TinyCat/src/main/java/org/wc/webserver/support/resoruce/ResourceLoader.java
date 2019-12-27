package org.wc.webserver.support.resoruce;

import org.wc.webserver.support.resoruce.reader.Reader;

/**
 * Created by WenChen on 2019/12/27.
 */
public interface ResourceLoader {
    String CLASSPATH_URL_PREFIX = "classpath:";

    Resource getResource(String path);

}
