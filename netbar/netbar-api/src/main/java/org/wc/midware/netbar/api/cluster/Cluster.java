package org.wc.midware.netbar.api.cluster;

import org.wc.midware.netbar.api.Invocation;
import org.wc.midware.netbar.api.Invoker;

import java.util.List;

/**
 * Created by WenChen on 2020/8/7.
 */
public interface Cluster {

    List<Invoker> join(Invocation invocation);
}
