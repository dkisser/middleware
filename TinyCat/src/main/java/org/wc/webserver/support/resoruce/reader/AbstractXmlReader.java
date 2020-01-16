package org.wc.webserver.support.resoruce.reader;

import org.wc.prettydog.support.ExtensionLoader;
import org.wc.webserver.support.ConfigurationTools;
import org.wc.webserver.support.ServerModel;
import org.wc.webserver.support.resoruce.Resource;
import org.wc.webserver.support.resoruce.ResourceLoader;

import java.util.List;

/**
 * Created by WenChen on 2019/12/27.
 */
public abstract class AbstractXmlReader extends AbstractReader{

    public AbstractXmlReader(ResourceLoader loader) {
        super(loader);
    }

    @Override
    public List<ServerModel> parse() {
        ResourceLoader resourceLoader = getResourceLoader();
        Resource resource = resourceLoader.getResource();
        String parserId = ConfigurationTools.getString("tinycat.xml.parser","dom");
        XmlParser parser = ExtensionLoader.getExtensionLoader(XmlParser.class).getExtensionById(parserId);
        return parser.parseResource(resource);
    }

}
