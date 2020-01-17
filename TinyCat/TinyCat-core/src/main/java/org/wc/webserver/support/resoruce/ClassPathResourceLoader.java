package org.wc.webserver.support.resoruce;

/**
 * Created by WenChen on 2019/12/27.
 */
public class ClassPathResourceLoader implements ResourceLoader {

    private Resource resource;

    private ClassLoader classLoader;

    public ClassPathResourceLoader(Resource resource) {
        this(resource,resource.getClassLoader());
    }

    public ClassPathResourceLoader(Resource resource, ClassLoader classLoader) {
        this.resource = resource;
        this.classLoader = classLoader;
    }

    public ClassPathResourceLoader() {}

    @Override
    public Resource getResource() {
        return resource;
    }

    @Override
    public void setResource(Resource resource) {
       this.resource = resource;
    }

}
