package org.wc.midware.netbar.cluster;

import org.wc.midware.netbar.api.*;
import org.wc.midware.netbar.api.cluster.Cluster;
import org.wc.midware.netbar.api.cluster.Router;

import java.util.List;

/**
 * Created by WenChen on 2020/8/13.
 */
public abstract class AbstractClusterInvoker implements Cluster {

    private Directory directory;

    private Router router;

    @Override
    public List<Invoker> join(Invocation invocation) {
        //get invokers by invocation
        //Directory.list
        //Router.route
        return null;
    }
}
