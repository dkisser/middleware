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

/**
 * Created by WenChen on 2019/12/27.
 */
public class ClassPathXmlReader extends AbstractXmlReader {

    public ServerModule parse(String path) {
        ResourceLoader resourceLoader = new ClassPathResourceLoader();
        Resource resource = resourceLoader.getResource(path);
        printResource(resource);
        String parserId = ConfigurationTools.getString("tinycat.xml.parser","dom");
        XmlParser parser = ExtensionLoader.getExtensionLoader(XmlParser.class).getExtensionById(parserId);
        return parser.parseResource(resource);
    }

    private void printResource(Resource resource){
        InputStream in = null;
        try {
            in = resource.getInputStream();
            byte[] temp = new byte[1024];
            String str ;
            StringBuilder sb = new StringBuilder(100);
            int index = -1,bufLen = temp.length;
            while ((index = in.read(temp))!=-1){
                if (index < bufLen-1){
                    byte[] a = Arrays.copyOfRange(temp,0,index);
                    str = new String(a);
                } else {
                    str = new String(temp);
                }
                sb.append(str);
            }
            System.out.println(sb.toString());
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (in!=null) {
                try {
                    in.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
