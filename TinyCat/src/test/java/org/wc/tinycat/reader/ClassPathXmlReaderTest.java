package org.wc.tinycat.reader;

import org.junit.Test;
import org.wc.webserver.support.resoruce.reader.ClassPathXmlReader;

/**
 * Created by WenChen on 2019/12/27.
 */
public class ClassPathXmlReaderTest {

    @Test
    public void testClassPathXmlReader (){
        ClassPathXmlReader reader = new ClassPathXmlReader();
        reader.parse("server.properties");
    }

}
