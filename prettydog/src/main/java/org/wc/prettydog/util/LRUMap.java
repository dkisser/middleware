package org.wc.prettydog.util;

import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by WenChen on 2019/11/11.
 */
public class LRUMap<K,V> extends LinkedHashMap<K,V>{

    private int capacity;

    public LRUMap(int capacity){
        super(capacity,0.75f,true);
        this.capacity = capacity;
    }

    @Override
    protected boolean removeEldestEntry(Map.Entry<K,V> eldest) {
        if (size() > capacity){
            return true;
        }
        return false;
    }

    public static void main (String[] args){

        LRUMap<String,String> lruMap = new LRUMap<>(10);
        for (int i=0;i<10;i++){
            lruMap.put(i+"",i+"");
        }
        lruMap.get("1");
        lruMap.put("11","11");
        for (Object entry:lruMap.entrySet()){
            Map.Entry<String,String> obj = (Map.Entry<String, String>) entry;
            System.out.println(obj.getKey()+"--->"+obj.getValue());
        }
    }
}
