package org.wc.prettydog.util;

import java.util.AbstractSet;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2020/1/19.
 */
public class ConcurrentHashSet<E> extends AbstractSet<E> implements Set<E>, java.io.Serializable {

    private ConcurrentHashMap<E,Object> map;

    private static final Object obj = new Object();

    public ConcurrentHashSet() {
        this.map = new ConcurrentHashMap<>();
    }

    public ConcurrentHashSet(int capacity) {
        this.map = new ConcurrentHashMap<>(capacity);
    }

    @Override
    public Iterator<E> iterator() {
        return map.keySet().iterator();
    }

    @Override
    public int size() {
        return map.size();
    }

    @Override
    public boolean add(E e) {
        return map.put(e,obj) == null;
    }

    @Override
    public boolean remove(Object o) {
        return map.remove(o) == obj;
    }

    @Override
    public boolean contains(Object o) {
        return map.contains(o);
    }

    @Override
    public void clear() {
        map.clear();
    }

    @Override
    public boolean isEmpty() {
        return map.isEmpty();
    }
}
