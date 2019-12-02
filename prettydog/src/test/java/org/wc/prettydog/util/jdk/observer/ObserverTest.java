package org.wc.prettydog.util.jdk.observer;

/**
 * Created by WenChen on 2019/12/2.
 */
public class ObserverTest {

    public static void main(String[] args){
        ObservableEntity entity = new ObservableEntity();
        entity.addObserver(new ObserverClient1());
        entity.addObserver(new ObserverClient2());
        entity.doSomething();
    }
}
