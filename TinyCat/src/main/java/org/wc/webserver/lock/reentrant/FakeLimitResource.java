package org.wc.webserver.lock.reentrant;

import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Created by WenChen on 2019/6/5.
 */
public class FakeLimitResource {

    private AtomicBoolean inUse = new AtomicBoolean(false);

    public void use() throws IllegalStateException {
        if (!inUse.compareAndSet(false,true)){
            throw new IllegalStateException("Need to be used by one client at one time!");
        }
        try{
            Thread.sleep(1000L);
        } catch (InterruptedException e){
            e.printStackTrace();
        } finally {
            inUse.set(false);
        }
    }

}
