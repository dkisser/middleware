package org.wc.prettydog.util;

import java.util.*;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * Created by WenChen on 2020/5/15.
 */
public class ConcurrentLRUCache<K,V> extends LRUMap<K,V> {

    private BlockingQueue<Map.Entry<K,V>> cache;

    private WeakHashMap<K,V> longTerm;

    private int size;

    private Object lock = new Object();

    public ConcurrentLRUCache(int capacity) {
        super(capacity);
        size = capacity;
        cache = new LinkedBlockingQueue<>(capacity);
        longTerm = new WeakHashMap<>(capacity);
    }

    @Override
    protected boolean removeEldestEntry(Map.Entry<K,V> eldest) {
        boolean result = super.removeEldestEntry(eldest);
        if (result){
            cache.offer(eldest);
        }
        return result;
    }

    public V get(Object key){
        V result = super.get(key);
        if (result == null){
            result = longTerm.get(key);
            if (result != null){
                setValue((K)key,result);
            }
        }
        return result;
    }

    public V put (K k,V v){
        if(size() >= size){
            synchronized (longTerm){//lock frequently is a question
                if (size() >= size){//maybe someone used remove caused size() < size
                    refreshLongTerm();
                    if (cache.size() >= size){
                        cache.clear();
                    }
                }
            }
        }
        return setValue(k,v);
    }

    public V setValue (K k,V v){
        synchronized (lock){
            return super.put(k,v);
        }
    }

    private void refreshLongTerm(){
        List<Map.Entry<K,V>> list = new ArrayList<>();
        cache.drainTo(list);
        for (Map.Entry<K,V> entry:list){
            longTerm.put(entry.getKey(),entry.getValue());
        }
    }
}
