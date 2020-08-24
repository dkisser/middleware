package org.wc.midware.netbar.core.config;

import org.wc.midware.netbar.api.URL;
import org.wc.midware.netbar.common.config.Parser;
import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;
import org.yaml.snakeyaml.Yaml;

import java.io.InputStream;
import java.util.*;

/**
 * Created by WenChen on 2020/8/12.
 */
public class DefaultYamlParser implements Parser{

    private Logger logger = LoggerFactory.getLogger(DefaultYamlParser.class);

    private static final String CONFIG_PATH = "rpc.yaml";

    private Yaml yaml;

    public DefaultYamlParser() {
        this.yaml = new Yaml();
    }

    private InputStream findConfiguration(){
        return this.getClass().getClassLoader()
                .getResourceAsStream(CONFIG_PATH);
    }

    public String getString(Map map,String key){
        Object value = map.get(key);
        if (value != null){
            if (value instanceof Integer){
                return Integer.toString((Integer) value);
            }
        }
        return (String) value;
    }

    public Integer getInt(Map map,String key){
        Object value = map.get(key);
        if (value != null){
            if (value instanceof String){
                return Integer.parseInt((String) value);
            }
        }
        return (Integer) value;
    }

    public void parseServiceConfigs (Map tagMap,List<URL> result){
        List sericeConfigs = (List) tagMap.get("serviceConfigs");
        sericeConfigs.forEach(serviceConfig->{
            if (serviceConfig instanceof Map){
                Map configMap = (Map) serviceConfig;
                URL url = new URL();
                url.setServiceId(getString(configMap,"serviceId"))
                        .setGroup(getString(configMap,"group"))
                        .setVersion(getString(configMap,"version"))
                        .setImpl(getString(configMap,"impl"))
                        .setProtocol("default")
                        .setPort(0);
                if (configMap.containsKey("serviceConfigParam")){
                    Map configParam = (Map) configMap.get("serviceConfigParam");
                    configParam.forEach((pkey,pvalue)->{
                        url.addArgument((String) pkey,pvalue);
                    });
                }
                result.add(url);
            }
        });
    }

    public void parseProtocol (Map tagMap,List<URL> result){
        Map protocolConfigs = (Map) tagMap.get("protocolConfigs");
        String host=getString(protocolConfigs,"host"),
                protocol=getString(protocolConfigs,"protocol");
        Integer port=getInt(protocolConfigs,"port");
        for (URL url:result){
            url.setProtocol(protocol)
                .setIp(host).setPort(port);
        }
    }

    @Override
    public List<URL> parse() {
        //find configuable file path
        List<URL> result = new ArrayList<>();
        InputStream in = findConfiguration();
        if (in == null){
            logger.warn("can't find configurable file!");
            return result;
        }
        //load file
        yaml.loadAll(in).forEach(o->{
            List tagList = (List) o;
            tagList.forEach(m ->{
                List<URL> u = new ArrayList<>();
                Map tagMap = (Map) m;
                parseServiceConfigs(tagMap,u);
                parseProtocol(tagMap,u);
                result.addAll(u);
            });

        });
        return result;
    }
}
