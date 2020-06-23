package org.wc.prettydog.mselect.transporter;

import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.framework.api.CuratorWatcher;
import org.apache.curator.retry.RetryNTimes;
import org.apache.zookeeper.CreateMode;
import org.apache.zookeeper.WatchedEvent;
import org.springframework.context.EnvironmentAware;
import org.springframework.core.env.Environment;
import org.wc.prettydog.util.StringUtils;

import java.util.Collections;
import java.util.List;

/**
 * Created by WenChen on 2020/6/19.
 */
public class CuratorZookeeperClient extends AbstractZookeeperClient<CuratorWatcher> implements EnvironmentAware{

    public static final String NAME = "curator";

    private CuratorFramework curatorFramework;

    private Environment environment;

    public CuratorZookeeperClient() {
        this.curatorFramework = CuratorFrameworkFactory.builder()
                .connectString("127.0.0.1:2181")
                .retryPolicy(new RetryNTimes(1,1000))
                .connectionTimeoutMs(50000)
                .build();
        this.curatorFramework.start();
    }

    @Override
    protected List<String> addListener(String path, CuratorWatcher listner) throws Exception {
        return curatorFramework.getChildren().usingWatcher(listner).forPath(path);
    }

    @Override
    protected CuratorWatcher createTargetListener(String path, ZookeeperListener listener) {
        return new CuratorWatcherImpl(listener);
    }

    @Override
    protected void doCreateEphemeral(String path) throws Exception {
        curatorFramework.create().withMode(CreateMode.EPHEMERAL).forPath(path);
    }

    @Override
    protected String doCreatePersistent(String path) throws Exception {
        return curatorFramework.create().forPath(path);
    }

    @Override
    protected boolean checkExists(String path) throws Exception {
        return curatorFramework.checkExists().forPath(path)!=null ? true:false;
    }

    @Override
    protected void doClose() throws Exception {
        curatorFramework.close();
    }

    @Override
    protected String doCreateEphemeralSequence(String path) throws Exception {
        return curatorFramework.create()
                .withMode(CreateMode.EPHEMERAL_SEQUENTIAL)
                .forPath(path);
    }

    @Override
    public void delete(String path) throws Exception {
        if (checkExists(path)){
            curatorFramework.delete().forPath(path);
        }
    }

    @Override
    public List<String> select(String path) throws Exception {
        return curatorFramework.getChildren().forPath(path);
    }

    @Override
    public void setEnvironment(Environment environment) {
        this.environment = environment;
    }

    private class CuratorWatcherImpl implements CuratorWatcher{

        private ZookeeperListener listener;

        public CuratorWatcherImpl(ZookeeperListener listener) {
            this.listener = listener;
        }

        @Override
        public void process(WatchedEvent watchedEvent) throws Exception {
            String path = watchedEvent.getPath() == null ? "":watchedEvent.getPath();
            if (StringUtils.isEmpty(path)){
                return;
            }
            if (!checkExists(path)){//child node might deleted,wo need find it's parent path
                path = path.substring(0,path.lastIndexOf("/"));
            }
            listener.notify(curatorFramework.getChildren().forPath(path));
        }
    }
}
