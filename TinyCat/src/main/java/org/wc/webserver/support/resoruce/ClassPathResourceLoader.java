package org.wc.webserver.support.resoruce;

/**
 * Created by WenChen on 2019/12/27.
 */
public class ClassPathResourceLoader implements ResourceLoader {

    private ClassLoader classLoader;

    public ClassPathResourceLoader(ClassLoader classLoader) {
        this.classLoader = classLoader;
    }

    public ClassPathResourceLoader() {}

    @Override
    public Resource getResource(String path) {
        return new ClassPathResource(path,classLoader);
    }

}
