package org.wc.webserver.support.resoruce;

import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URL;

/**
 * Created by WenChen on 2019/12/27.
 */
public interface Resource extends InputStreamSource{

    File getFile() throws IOException;

    URL getURL() throws IOException;

    URI getURI() throws IOException;

    ClassLoader getClassLoader();

}
