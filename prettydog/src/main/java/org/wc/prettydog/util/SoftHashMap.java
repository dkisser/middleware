package org.wc.prettydog.util;

import java.lang.ref.ReferenceQueue;
import java.lang.ref.SoftReference;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Created by WenChen on 2019/6/24.
 * 软引用HashMap
 * 可用作内存敏感缓存
 * 目前存在性能问题，效率较低下，推荐使用ConcurrentReferenceMap代替这个
 */
public class SoftHashMap<K,V> implements Map<K,V> {

    private static final int DETAULT_RETENTION_SIZE = 100;

    private int RETENTION_SIZE;

    private Queue<V> strongReferences;

    private ReentrantLock strongReferencesLock;

    /**
     * queue for cleared softreference object
     */
    private ReferenceQueue<? super V> queue;

    private Map<K,SoftValue<V,K>> map;

    public SoftHashMap (){
        this(DETAULT_RETENTION_SIZE);
    }

    public SoftHashMap(int RETENTION_SIZE) {
        super();
        this.RETENTION_SIZE = RETENTION_SIZE;
        strongReferences = new ConcurrentLinkedQueue<>();
        strongReferencesLock = new ReentrantLock();
        queue = new ReferenceQueue<>();
        map = new ConcurrentHashMap<>();
    }

    public SoftHashMap (Map<K,V> map){
        this();
        putAll(map);
    }

    public SoftHashMap (int retention_size,Map<K,V> map){
        this(retention_size);
        putAll(map);
    }

    @Override
    public int size() {
        refreshQueue();
        return map.size();
    }

    @Override
    public boolean isEmpty() {
        refreshQueue();
        return map.isEmpty();
    }

    @Override
    public boolean containsKey(Object key) {
        refreshQueue();
        return map.containsKey(key);
    }

    @Override
    public boolean containsValue(Object value) {
        Collection<V> v = values();
        return v != null && v.contains(value);
    }

    /**
     * 1.先根据key拿到引用
     * 2.判断引用是否为空，为空说明已经被GC回收，返回null，若不为空执行3
     * 3.从引用中拿到值并返回
     */
    @Override
    public V get(Object key) {
        refreshQueue();
        if (map.size() == 0 || key == null){
            return null;
        }
        SoftValue<V,K> reference = map.get(key);
        if (reference == null){
            return null;
        }
        V result = reference.get();
        if (result == null){
            map.remove(key);
        } else {
            addToStrongReferences(result);
        }
        return result;
    }

    private void addToStrongReferences (V result){
        strongReferencesLock.lock();
        try {
          strongReferences.add(result);
          trimStrongReferenceIfNecessary();
        } finally {
            strongReferencesLock.unlock();
        }
    }

    /**
     * 当队列中的已有数量超过设置的值后，需要出队
     */
    private void trimStrongReferenceIfNecessary(){
        if (strongReferences.size() > RETENTION_SIZE){
            strongReferences.poll();
        }
    }

    /**
     * 1.从引用队列中找到所有被GC回收的key
     * 2.在map中移除对应的key
     */
    @SuppressWarnings(value = {"unchecked"})
    private void refreshQueue (){
        SoftValue sv;
        while ((sv = (SoftValue) queue.poll())!=null){
            map.remove(sv.key);
        }
    }

    @Override
    public V put(K key, V value) {
        refreshQueue();
        SoftValue<V,K> previous = map.put(key,new SoftValue<>(value,key,queue));
        addToStrongReferences(value);
        return previous != null ? previous.get() : null;
    }

    @Override
    public V remove(Object key) {
        refreshQueue();
        SoftValue<V,K> value = map.remove(key);
        return value != null ? value.get() : null;
    }

    @Override
    public void putAll(Map<? extends K, ? extends V> m) {
        if (m==null || m.size() == 0){
            refreshQueue();
            return ;
        }
        m.forEach((key,value)-> put(key,value));
    }

    @Override
    public void clear() {
        strongReferencesLock.lock();
        try {
            strongReferences.clear();
        } finally {
            strongReferencesLock.unlock();
        }
        refreshQueue();//清楚掉不用的数据
        map.clear();
    }

    @Override
    public Set<K> keySet() {
        refreshQueue();
        return map.keySet();
    }

    @Override
    @SuppressWarnings("unchecked")
    public Collection<V> values() {
        Collection<K> keys = keySet();
        if (keys.isEmpty()){
            return Collections.EMPTY_SET;
        }
        Collection<V> values = new ArrayList<>(keys.size());
        keys.forEach(key->{
            V value = get(key);
            if (value != null){
                values.add(value);
            }
        });
        return values;
    }

    @Override
    @SuppressWarnings("unchecked")
    public Set<Entry<K, V>> entrySet() {
        Collection<K> keys = keySet();
        if (keys.isEmpty()){
            return Collections.EMPTY_SET;
        }
        Map<K,V> resultMap = new HashMap<>(keys.size());
        keys.forEach(key->{
            V v = get(key);
            if (v != null){
                resultMap.put(key,v);
            }
        });
        return resultMap.entrySet();
    }

    @Override
    public String toString() {
        return "SoftHashMap{" +
                "RETENTION_SIZE=" + RETENTION_SIZE +
                ", strongReferences=" + strongReferences +
                ", strongReferencesLock=" + strongReferencesLock +
                ", queue=" + queue +
                ", map=" + map +
                '}';
    }

    private class SoftValue<V,K> extends SoftReference<V>{

        private final K key;

        private final V value;

        private SoftValue(V referent,K key, ReferenceQueue<? super V> q) {
            super(referent, q);
            this.key = key;
            this.value = referent;
        }

        @Override
        public String toString() {
            return "SoftValue{" +
                    "key=" + key +
                    ", value=" + value +
                    '}';
        }
    }

    public static void main (String[] args){
        SoftHashMap<Integer,String> cache = new SoftHashMap<>();
        for (int i=0;i<100;i++){
            cache.put(i,"");
        }
        System.out.println(cache);
    }

}
