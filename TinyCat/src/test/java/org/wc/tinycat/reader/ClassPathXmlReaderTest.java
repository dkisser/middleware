package org.wc.tinycat.reader;

import org.junit.Test;
import org.wc.webserver.support.ServerModule;
import org.wc.webserver.support.resoruce.reader.ClassPathXmlReader;

import java.util.List;

/**
 * Created by WenChen on 2019/12/27.
 */
public class ClassPathXmlReaderTest {

    @Test
    public void testClassPathXmlReader (){
        ClassPathXmlReader reader = new ClassPathXmlReader("server.xml");
        List<ServerModule> module = reader.parse();
        System.out.println(module);
    }

}
