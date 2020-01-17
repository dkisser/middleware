package org.wc.tinycat.reader;

import org.junit.Test;
import org.wc.webserver.support.ServerModel;
import org.wc.webserver.support.resoruce.reader.ClassPathXmlReader;

import java.util.List;

/**
 * Created by WenChen on 2019/12/27.
 */
public class ClassPathXmlReaderTest {

    @Test
    public void testClassPathXmlReader (){
        ClassPathXmlReader reader = new ClassPathXmlReader("server.xml");
        List<ServerModel> module = reader.parse();
        System.out.println(module);
    }

}
