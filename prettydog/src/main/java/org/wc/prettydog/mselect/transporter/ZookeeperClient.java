package org.wc.prettydog.mselect.transporter;

import org.wc.prettydog.annotation.SPI;

import java.util.List;

/**
 * Created by WenChen on 2020/6/18.
 */
@SPI(CuratorZookeeperClient.NAME)
public interface ZookeeperClient {

    void create(String path,boolean ephemeral) throws Exception;

    String createEphemeralSequence(String path) throws Exception;

    void delete(String path) throws Exception;

    List<String> select(String path) throws Exception;

    List<String> addListener(String path,ZookeeperListener listener) throws Exception;

    void close();
}
