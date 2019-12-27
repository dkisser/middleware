package org.wc.webserver.support.resoruce.reader;

import org.wc.prettydog.support.ExtensionLoader;
import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;
import org.wc.webserver.support.ConfigurationTools;
import org.wc.webserver.support.ServerModule;
import org.wc.webserver.support.resoruce.Resource;
import org.wc.webserver.support.resoruce.ResourceLoader;
import org.xml.sax.SAXException;

import javax.xml.bind.JAXB;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;

/**
 * Created by WenChen on 2019/12/27.
 */
public abstract class AbstractXmlReader extends AbstractReader{

    @Override
    public ServerModule parse(ResourceLoader resourceLoader,String path) {
        Resource resource = resourceLoader.getResource(path);
        String parserId = ConfigurationTools.getString("tinycat.xml.parser","dom");
        XmlParser parser = ExtensionLoader.getExtensionLoader(XmlParser.class).getExtensionById(parserId);
        return parser.parseResource(resource);
    }

}
