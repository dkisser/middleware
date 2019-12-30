package org.wc.webserver.support.resoruce;

import org.wc.webserver.utils.ReflectUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;

/**
 * Created by WenChen on 2019/12/27.
 */
public class ClassPathResource implements Resource{

    private String path;

    private ClassLoader classLoader;

    public ClassPathResource(String path) {
        this(path,null);
    }

    public ClassPathResource(String path, ClassLoader classLoader) {
        this.path = path;
        if (classLoader == null){
            this.classLoader = ReflectUtils.getDefaultClassLoader();
        } else {
            this.classLoader = classLoader;
        }
    }

    @Override
    public InputStream getInputStream() throws IOException{
        return new FileInputStream(getFile());
    }

    @Override
    public File getFile() throws IOException {
        return new File(getURI());
    }

    @Override
    public URL getURL() throws IOException {
        return classLoader.getResource(path);
    }

    @Override
    public URI getURI() throws IOException {
        URI uri;
        try {
            uri = getURL().toURI();
        } catch (URISyntaxException e) {
            throw new IOException(e);
        }
        return uri;
    }

    @Override
    public ClassLoader getClassLoader() {
        return classLoader;
    }
}
