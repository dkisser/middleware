package org.wc.webserver.conf;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.wc.webserver.BootStrapServer;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by WenChen on 2019/5/15.
 */
public class ServletConfig {

    public enum ServletProp{
        SERVLET_NAME("servlet.name"),
        SERVLET_URI("servlet.uri"),
        SERVLET_SERVLETPATH("servlet.servletPath");

        private String value;

        ServletProp(String value) {
            this.value = value;
        }

        public String getValue(){
            return this.value;
        }
    }

    private static Logger log = LoggerFactory.getLogger(ServletConfig.class);

    private static Properties servletCfg;

    static {
        servletCfg = new Properties();
        InputStream in = BootStrapServer.class.getResourceAsStream("/servlet.properties");
        try {
            servletCfg.load(in);
        } catch (IOException e) {
            log.error("加载启动配置文件错误。。。");
        } finally {
            if (in != null){
                try {
                    in.close();
                } catch (IOException e) {
                    log.info("关闭启动配置文件失败。。。");
                }
            }
        }
    }

    public static String getString(ServletProp prop,String defaultValue){
        return servletCfg.getProperty(prop.getValue(),defaultValue);
    }

    public static Integer getInt (ServletProp prop,String defaultValue){
        Integer result;
        try {
            result = Integer.parseInt(servletCfg.getProperty(prop.getValue(),defaultValue));
        } catch (Exception e){
            result = 0;
        }
        return result;
    }
}
