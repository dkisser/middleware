package org.wc.prettydog.support.zookeeper;

import org.junit.Test;
import org.wc.prettydog.mselect.transporter.CuratorZookeeperClient;
import org.wc.prettydog.mselect.transporter.ZookeeperClient;
import org.wc.prettydog.mselect.transporter.ZookeeperListener;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

/**
 * Created by WenChen on 2020/6/19.
 */
public class CuratorZookeeperClientTest {

    @Test
    public void testListener(){
        ZookeeperClient client = new CuratorZookeeperClient();
        try {
            String path = "/testListener/woyaochiren";
            client.create(path,true);
            client.addListener("/testListener",new TestZookeeperListener());
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            System.in.read();
        } catch (IOException e) {
            e.printStackTrace();
        }
        client.close();
    }

    @Test
    public void testCreateSequence(){
        ZookeeperClient client = new CuratorZookeeperClient();
        try {
            String path = "/testListener/woyaochiren";
            System.out.println(client.createEphemeralSequence(path));
            String path1 = "/testListener/woyaochiren1";
            System.out.println(client.createEphemeralSequence(path1));
        } catch (Exception e) {
            e.printStackTrace();
        }
        try {
            System.in.read();
        } catch (IOException e) {
            e.printStackTrace();
        }
        client.close();
    }

    private class TestZookeeperListener implements ZookeeperListener{

        @Override
        public void notify(List<String> paths) {
            System.out.println(Arrays.asList(paths));
        }
    }
}
