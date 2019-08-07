package org.wc.prettydog.util;

import java.util.WeakHashMap;
import java.util.concurrent.ConcurrentHashMap;

/**
 * Created by WenChen on 2019/6/24.
 * 分代缓存
 * 老年代没有大小限制
 */
public class ConcurrentCache<K,V> {

    private final ConcurrentHashMap<K,V> eden;

    private final WeakHashMap<K,V> longTerm;

    private static final int DEFAILT_CACHE_SIZE = 100;

    private final int CACHE_SIZE;

    public ConcurrentCache() {
        this(DEFAILT_CACHE_SIZE);
    }

    public ConcurrentCache(int CACHE_SIZE) {
        this.CACHE_SIZE = CACHE_SIZE;
        eden = new ConcurrentHashMap<>(CACHE_SIZE);
        longTerm = new WeakHashMap<>(CACHE_SIZE);
    }

    /**
     * 1.先在新生代中找，找到就返回，找不到进入2
     * 2.到老年代中找，找到就放入老年代然后返回。找不到就返回null;
     */
    @SuppressWarnings("unused")
    public V get(K key){
        V result = eden.get(key);
        if (result == null){
            result = longTerm.get(key);
            if (result != null){
                eden.put(key,result);
            }
        }
        return result;
    }

    /**
     * 1.判断新生代大小是否超出实例化的size，没超出就直接放进去，超出就进入2
     * 2.清空老年代并将当前所有新生代缓存放入老年代
     */
    public V put (K k,V v){
        if(eden.size() >= CACHE_SIZE){
            synchronized (longTerm){
                longTerm.putAll(eden);
            }
            eden.clear();
        }
        return eden.put(k,v);
    }

    @Override
    public String toString() {
        return "ConcurrentCache{" +
                "eden=" + eden +
                ", longTerm=" + longTerm +
                ", CACHE_SIZE=" + CACHE_SIZE +
                '}';
    }

    public static void main (String[] args) throws InterruptedException {
        ConcurrentCache<String,String> cache = new ConcurrentCache<>();
        for (int i=0;i<110;i++){
            cache.put(String.valueOf(i),String.valueOf(i));
        }
        System.out.println(cache);
        System.gc();
        Thread.sleep(5000L);
        System.out.println(cache);
    }

}
