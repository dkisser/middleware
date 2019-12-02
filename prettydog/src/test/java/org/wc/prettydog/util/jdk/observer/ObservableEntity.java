package org.wc.prettydog.util.jdk.observer;

import java.util.Observable;
import java.util.Observer;

/**
 * Created by WenChen on 2019/12/2.
 */
public class ObservableEntity extends Observable {

    public void add (Observer observer){
        addObserver(observer);
    }

    public void doSomething(){
        setChanged();
        notifyObservers(112121212);
    }

}
