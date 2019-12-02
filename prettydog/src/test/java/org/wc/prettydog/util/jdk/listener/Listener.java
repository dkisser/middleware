package org.wc.prettydog.util.jdk.listener;

import java.util.EventListener;

/**
 * Created by WenChen on 2019/12/2.
 */
public interface Listener<T extends ApplicationEvent> extends EventListener {

    void onEventListener (T event);
}
