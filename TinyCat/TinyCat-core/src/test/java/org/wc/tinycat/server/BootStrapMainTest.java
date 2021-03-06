package org.wc.tinycat.server;

import org.junit.Test;
import org.wc.webserver.BootStrapMain;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by WenChen on 2019/12/31.
 */
public class BootStrapMainTest {

    @Test
    public void bootstrapTest(){
//        System.setProperty(Constants.DEFAULT_HTTP_SERVER_KEY,"tomcat");
//        System.setProperty(Constants.DEFAULT_TCP_SERVER_KEY,"jdk");
        BootStrapMain.start();
        try {
            Thread.sleep(1000L*60*1);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        BootStrapMain.stop();
    }

    @Test
    //TODO can't load resource with ClassPathResource ,but it can be load when use classLoader.getResouceAsStream
    public void propertiesTest(){
//        ClassPathResource resource = new ClassPathResource("TinyCat.poperties");
        Properties p = new Properties();
        try {
        InputStream in = BootStrapMainTest.class.getClassLoader().getResourceAsStream("TinyCat.properties");
//            InputStream in = resource.getInputStream();
            p.load(in);
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
