package org.wc.webserver.support.resoruce.reader;

import org.wc.webserver.support.resoruce.ClassPathResource;
import org.wc.webserver.support.resoruce.ClassPathResourceLoader;
import org.wc.webserver.support.resoruce.ResourceLoader;

/**
 * Created by WenChen on 2019/12/27.
 */
public class ClassPathXmlReader extends AbstractXmlReader {

    public ClassPathXmlReader(String path) {
        this(new ClassPathResourceLoader());
        ClassPathResource resource = new ClassPathResource(path);
        getResourceLoader().setResource(resource);
    }

    public ClassPathXmlReader(ResourceLoader loader) {
        super(loader);
    }

}
