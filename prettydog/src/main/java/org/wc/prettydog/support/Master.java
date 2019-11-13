package org.wc.prettydog.support;

import javax.xml.bind.SchemaOutputResolver;
import java.math.BigDecimal;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * Created by WenChen on 2019/11/11.
 */
public class Master<T> {

    private static final long GET_RESULT_SLEEP = 100L;

    //请求队列
    private LinkedBlockingQueue<T> requestQue = new LinkedBlockingQueue<>();
    //所有Worker的集合
    private ConcurrentHashMap<String,Thread> workers = new ConcurrentHashMap<>();
    //结果集
    private ConcurrentHashMap<Object,Object> results = new ConcurrentHashMap<>(100);

    public Master(Worker<T> woker,int wokerCount) {
        woker.setRequestQue(requestQue);
        woker.setResults(results);
        for (int i=0;i<wokerCount;i++){
            this.workers.put("Worker-"+i,new Thread(woker,"Worker-"+i));
        }

    }

    /**
     * 返回当前结果集
     * @return
     */
    public ConcurrentHashMap<Object,Object> getResults (){
        return results;
    }

    /**
     * 判断所有worker是否处理完
     * @return
     */
    public boolean isComplete (){
        for (Map.Entry<String,Thread> entry:workers.entrySet()){
            if (Thread.State.TERMINATED!=entry.getValue().getState()){
                return false;
            }
        }
        return true;
    }

    /**
     * 启动
     */
    public void start (){
        for (Map.Entry<String,Thread> entry:workers.entrySet()){
            Thread thread = entry.getValue();
            if (thread.getState()== Thread.State.NEW){
                entry.getValue().start();
            }
        }
    }

    /**
     * 提交请求
     * @param t
     */
    public void submit (T t){
        requestQue.add(t);
    }

    /**
     * 测试使用
     * @return
     */
    private Object get(){
        start();
        Integer result = 0;
        while (results.size() > 0 || !isComplete()){
            for (Map.Entry<Object,Object> entry:results.entrySet()){
                result += (int)entry.getValue();
                results.remove(entry.getKey());
            }
        }
        return result;
    }

    /**
     * 将结果计算后返回，运行此方法后结果表将会清空
     * @return
     */
    public Object getSum (){
        start();
        BigDecimal result = new BigDecimal(0);
        while (results.size() > 0 || !isComplete()){
            for (Map.Entry<Object,Object> entry:results.entrySet()){
                result = result.add((BigDecimal)entry.getValue());
                results.remove(entry.getKey());
            }
        }
        return result;
    }

    /**
     * 返回运算结果，给客户端程序自己去运算
     * key为你请求队列中的对象，value为运算后的值
     * @return
     */
    public ConcurrentHashMap<Object,Object> getRestultAsMap (){
        start();
        do{
            try {
                Thread.sleep(GET_RESULT_SLEEP);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        } while (!isComplete());
        return results;
    }

}
