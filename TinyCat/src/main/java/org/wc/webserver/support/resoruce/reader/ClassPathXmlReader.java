package org.wc.webserver.support.resoruce.reader;

import org.wc.prettydog.support.ExtensionLoader;
import org.wc.webserver.support.ConfigurationTools;
import org.wc.webserver.support.ServerModule;
import org.wc.webserver.support.resoruce.ClassPathResourceLoader;
import org.wc.webserver.support.resoruce.Resource;
import org.wc.webserver.support.resoruce.ResourceLoader;

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.List;

/**
 * Created by WenChen on 2019/12/27.
 */
public class ClassPathXmlReader extends AbstractXmlReader {

    public List<ServerModule> parse(String path) {
        ResourceLoader resourceLoader = new ClassPathResourceLoader();
        Resource resource = resourceLoader.getResource(path);
        String parserId = ConfigurationTools.getString("tinycat.xml.parser","dom");
        XmlParser parser = ExtensionLoader.getExtensionLoader(XmlParser.class).getExtensionById(parserId);
        return parser.parseResource(resource);
    }

}
