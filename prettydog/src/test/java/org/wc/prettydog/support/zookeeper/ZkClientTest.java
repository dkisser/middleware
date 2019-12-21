package org.wc.prettydog.support.zookeeper;

import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.framework.api.CuratorWatcher;
import org.apache.curator.framework.recipes.cache.*;
import org.apache.curator.retry.RetryNTimes;
import org.apache.zookeeper.WatchedEvent;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import javax.sound.midi.Soundbank;
import java.io.IOException;
import java.util.List;

/**
 * Created by WenChen on 2019/12/19.
 */
public class ZkClientTest {

    private CuratorFramework client;

    @Before
    public void getConnection(){
        String zkConn = "127.0.0.1:2181";
        client = CuratorFrameworkFactory.newClient(zkConn,new RetryNTimes(10,1000));
        client.start();
    }

    @After
    public void closeConnection(){
        client.close();
    }

    @Test
    public void testListChild(){
        try {
            List<String> list = client.getChildren().forPath("/edsp");
            if (list.contains("testCurator")) {
                Assert.assertTrue(true);
            } else {
                Assert.assertTrue(false);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testCreate() {
        try {
           String result =  client.create().creatingParentContainersIfNeeded()
                   .forPath("/edsp/testCurator/testNode", "testCurator".getBytes());
            System.out.println(result);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testDelete(){
        try {
            client.delete().deletingChildrenIfNeeded().forPath("/edsp/testCurator/testNode");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testUpdate (){
        try {
            client.setData().forPath("/edsp/testCurator","我要测试".getBytes());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testCreateOnceWatcher(){
        try {
            client.getChildren().usingWatcher(new CuratorWatcher() {
                @Override
                public void process(WatchedEvent watchedEvent) throws Exception {
                    System.out.println("node change !,path:"+watchedEvent.getPath()+" event:"+watchedEvent.getType());
                }
            }).forPath("/edsp/testCurator");
            System.in.read();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testCreatePomonemtWatcher(){
        try {
            NodeCache nodeCache = new NodeCache(client,"/edsp/testCurator/testWatcher");
            nodeCache.start(true);
            if (nodeCache.getCurrentData() == null){
                System.out.println("node initial data is null");
            } else {
                System.out.println("node initial data ："+new String(nodeCache.getCurrentData().getData()));
            }
            nodeCache.getListenable().addListener(()->{
                if (nodeCache.getCurrentData() == null){
                    System.out.println("current value is null");
                    return ;
                }
                String data = new String(nodeCache.getCurrentData().getData());
                System.out.println(nodeCache.getCurrentData().getPath()+" node data has changed，changed to："+data);
            });
            Thread.sleep(1000l*30);
            nodeCache.close();
        } catch (Exception e){
            e.printStackTrace();
        }
    }

    @Test
    public void testNodePathWatcher(){
        PathChildrenCache pathChildrenCache = new PathChildrenCache(client,"/edsp/testCurator",true);
        try {
            pathChildrenCache.start(PathChildrenCache.StartMode.BUILD_INITIAL_CACHE);
            List<ChildData> childList = pathChildrenCache.getCurrentData();
            for (ChildData child:childList){
                System.out.println("initial child:"+child.getPath());
            }
            pathChildrenCache.getListenable().addListener(new PathChildrenCacheListener() {
                @Override
                public void childEvent(CuratorFramework curatorFramework, PathChildrenCacheEvent
                        pathChildrenCacheEvent) throws Exception {
                    if (PathChildrenCacheEvent.Type.INITIALIZED.equals(pathChildrenCacheEvent.getType())){

                    }
                }
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
