package org.wc.webserver.support.resoruce;

import java.io.IOException;
import java.io.InputStream;

/**
 * Created by WenChen on 2019/12/27.
 */
public interface InputStreamSource {

    InputStream getInputStream() throws IOException;
}
