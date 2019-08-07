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
public class ServerConfig {

    public enum ServerProp{
        SERVER_PORT("server.port"),

        HTTP_BUFFER("http.buffer");

        private String value;

        private ServerProp(String value) {
            this.value = value;
        }

        public String getValue(){
            return this.value;
        }
    }

    private static Logger log = LoggerFactory.getLogger(ServerConfig.class);

    private static Properties serverCfg;

    static {
        serverCfg = new Properties();
        InputStream in = BootStrapServer.class.getResourceAsStream("/server.properties");
        try {
            serverCfg.load(in);
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

    public static String getString(ServerProp prop,String defaultValue){
        return serverCfg.getProperty(prop.getValue(),defaultValue);
    }

    public static Integer getInt (ServerProp prop,Integer defaultValue){
        Integer result;
        try {
            result = Integer.parseInt(serverCfg.getProperty(prop.getValue(),defaultValue.toString()));
        } catch (Exception e){
            result = defaultValue;
        }
        return result;
    }
}
