package org.wc.prettydog.util.jdk.listener;

import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * 事件对象
 * Created by WenChen on 2019/12/2.
 */
public class TestApplicationEvent {

    private List<Listener> listeners;

    public void addListeners(Listener listener){
        if (listeners == null){
            listeners = new ArrayList<>();
        }
        listeners.add(listener);
    }

    public void onRefresh (){
        for (Listener listener:listeners){
            if (listener instanceof TestListener){
                listener.onEventListener(new ApplicationEvent(this,"testEvent"));
            }
        }
    }
}
