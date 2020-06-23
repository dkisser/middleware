package org.wc.prettydog.mselect.transporter;

import org.wc.prettydog.mselect.URL;

import java.util.List;

/**
 * Created by WenChen on 2020/6/22.
 */
public class ListListener implements ZookeeperListener {

    private URL url;

    private ZookeeperClient client;

    public ListListener(URL url,ZookeeperClient client) {
        this.url = url;
        this.client = client;
    }

    @Override
    public void notify(List<String> paths) {

    }
}
