package org.wc.prettydog.support;

/**
 * Created by WenChen on 2019/12/10.
 */
public class Holder<T> {

    private volatile T t;

    public T get() {
        return t;
    }

    public void set(T t) {
        this.t = t;
    }
}
