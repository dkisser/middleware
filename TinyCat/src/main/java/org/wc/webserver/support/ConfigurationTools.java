package org.wc.webserver.support;

import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;
import org.wc.prettydog.util.StringUtils;
import org.wc.webserver.conf.Constants;
import org.wc.webserver.support.resoruce.ClassPathResource;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Created by WenChen on 2019/12/26.
 */
public class ConfigurationTools {

    private static Logger logger = LoggerFactory.getLogger(ConfigurationTools.class);

    private static Properties properties = new Properties();

    static {
        loadProperties();
    }

    private static void loadProperties(){
        InputStream in = null;
        String sysProps = getSysProperties(Constants.DEFAULT_PROPERTIES_KEY
                ,Constants.DEFAULT_PROPERTIES_VALUE);
        try {
            ClassPathResource resource = new ClassPathResource(sysProps);
            in = resource.getInputStream();
            properties.load(in);
        } catch (Exception e) {
            logger.warn("load [TinyCat.properties] error,use default properies");
        } finally {
            if (in!=null){
                try {
                    in.close();
                } catch (IOException e) {
                    logger.warn("close stram faild,{}",sysProps);
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

    public static String getSysProperties (String key,String defaultVal){
        String value = System.getProperty(key);
        return StringUtils.hasText(value) ? value : defaultVal;
    }
}
