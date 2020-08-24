package org.wc.midware.netbar.transporter;

import org.wc.midware.netbar.api.remote.Request;
import org.wc.midware.netbar.api.remote.Result;
import org.wc.midware.netbar.common.exception.RPCRuntimeException;
import org.wc.midware.netbar.common.remote.Response;
import org.wc.midware.netbar.api.remote.ResponseFuture;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Created by WenChen on 2020/8/11.
 */
public class DefaultResponseFuture implements ResponseFuture {

    private static Map<Long,DefaultResponseFuture> futures = new ConcurrentHashMap<>(16);

    private volatile Response response;

    private volatile Request request;

    private volatile long sentTime;
    //用于检测超时调用
    private int timeout;

    private ReentrantLock lock = new ReentrantLock();

    private Condition done = lock.newCondition();

    public DefaultResponseFuture(Request reqeust) {
        //TODO 需要可配置
        this.timeout = 10000;
        this.request = reqeust;
        this.response = new Response(request.getRequestId());
        futures.putIfAbsent(response.getId(),this);
    }

    public static void recieved(Result result, Long requestId){
        DefaultResponseFuture future = futures.remove(requestId);
        if (future!=null){
            future.doReceived(result);
        } else {
            throw new RuntimeException("client timeout");
        }

    }

    @Override
    public void doReceived(Result result){
        lock.lock();
        try {
            response.setResult(result);
            done.signal();
        } finally {
            lock.unlock();
        }

    }

    public static void sent (Request request){
        DefaultResponseFuture future = futures.get(request.getRequestId());
        if (future!=null){
            future.doSent();
        }

    }

    public void doSent(){
        sentTime = System.currentTimeMillis();
    }

    @Override
    public Result get(int timeout) {
        if (!isDone()){
            long start = System.currentTimeMillis();
            lock.lock();
            try {
                while(!isDone()){
                    done.await(timeout, TimeUnit.MILLISECONDS);
                    if (isDone() || System.currentTimeMillis()-start > timeout){
                        break;
                    }
                }
            } catch (InterruptedException e) {
                throw new RuntimeException(e);
            } finally {
              lock.unlock();
            }
            if (!isDone()) {
                throw new RPCRuntimeException("client time out");
            }
        }
        return response.getResult();
    }

    private boolean isDone(){
        return response.getResult() != null;
    }
}
