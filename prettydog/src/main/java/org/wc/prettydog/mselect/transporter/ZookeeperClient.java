package org.wc.prettydog.mselect.transporter;

import org.wc.prettydog.annotation.SPI;

import java.util.List;

/**
 * Created by WenChen on 2020/6/18.
 */
@SPI(CuratorZookeeperClient.NAME)
public interface ZookeeperClient {

    void create(String path,boolean ephemeral);

    String createEphemeralSequence(String path);

    void delete(String path);

    List<String> select(String path);

    List<String> addListener(String path,ZookeeperListener listener);

    void close();
}
