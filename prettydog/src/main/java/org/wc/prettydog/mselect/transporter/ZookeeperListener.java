package org.wc.prettydog.mselect.transporter;

import java.util.List;

/**
 * Created by WenChen on 2020/6/19.
 */
public interface ZookeeperListener {

    void notify (List<String> paths);
}
