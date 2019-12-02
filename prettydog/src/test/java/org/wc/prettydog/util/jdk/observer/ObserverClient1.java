package org.wc.prettydog.util.jdk.observer;

import java.util.Observable;
import java.util.Observer;

/**
 * Created by WenChen on 2019/12/2.
 */
public class ObserverClient1 implements Observer {

    @Override
    public void update(Observable o, Object arg) {
        System.out.println(1);
    }
}
