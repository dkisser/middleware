package org.wc.webserver.support.resoruce.reader;

import org.wc.prettydog.support.logger.Logger;
import org.wc.prettydog.support.logger.LoggerFactory;
import org.wc.webserver.support.resoruce.ResourceLoader;
import org.wc.webserver.utils.NetUtils;

import javax.sound.midi.Soundbank;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.rmi.UnexpectedException;
import java.util.Enumeration;

/**
 * Created by WenChen on 2019/12/27.
 */
public abstract class AbstractReader implements Reader{

    private volatile String serverIp = NetUtils.getServerIp();

    private ResourceLoader loader;

    public AbstractReader(ResourceLoader loader) {
        this.loader = loader;
    }

    @Override
    public String serverIp() {
        return serverIp;
    }



    public ResourceLoader getResourceLoader(){
        return loader;
    }
}
