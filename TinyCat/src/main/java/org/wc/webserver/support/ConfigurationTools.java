package org.wc.webserver.support;

import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;
import org.wc.prettydog.util.StringUtils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by WenChen on 2019/12/26.
 */
public class ConfigurationTools {

    private static Logger logger = LoggerFactory.getLogger(ConfigurationTools.class);

    private static Properties properties;

    static {
        loadProperties();
    }

    private static void loadProperties(){
        InputStream in = null;
        try {
            in = ConfigurationTools.class.getClassLoader().getResourceAsStream("TinyCat.properties");
            properties.load(in);
        } catch (Exception e) {
            logger.error("load server properties error");
        } finally {
            if (in!=null){
                try {
                    in.close();
                } catch (IOException e) {
                }
            }
        }
    }

    public static String getString(String key,String defaultVal){
        String value = getProperty(key);
        return StringUtils.hasText(value) ? value:defaultVal;
    }

    public static int getInt (String key,int defaultVal){
        String valueStr = getProperty(key);
        return StringUtils.hasText(valueStr) ? Integer.parseInt(valueStr):defaultVal;
    }

    private static String getProperty (String key){
        String value = System.getProperty(key);
        if (!StringUtils.hasText(value)){
            value = properties!=null?properties.getProperty(key):null;
        }
        return value;
    }
}
