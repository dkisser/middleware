package org.wc.prettydog.support;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * Created by WenChen on 2019/11/11.
 */
public abstract class Worker<T> implements Runnable{

    private LinkedBlockingQueue<T> requestQue;

    private ConcurrentHashMap<Object,Object> results;

    public LinkedBlockingQueue<T> getRequestQue() {
        return requestQue;
    }

    public void setRequestQue(LinkedBlockingQueue<T> requestQue) {
        this.requestQue = requestQue;
    }

    public ConcurrentHashMap<Object, Object> getResults() {
        return results;
    }

    public void setResults(ConcurrentHashMap<Object, Object> results) {
        this.results = results;
    }

    @Override
    public void run() {
        while (true){
            T t = requestQue.poll();
            if (t == null){
                break;
            }
            results.put(t,doWorker(t));
//            Integer i = (Integer)t;
//            results.put(""+i,i*2);
        }

    }

    public abstract Object doWorker (T t);

}
