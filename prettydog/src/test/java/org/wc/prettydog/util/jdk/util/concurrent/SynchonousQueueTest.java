package org.wc.prettydog.util.jdk.util.concurrent;

import org.junit.Test;

import java.util.concurrent.CountDownLatch;
import java.util.concurrent.SynchronousQueue;

/**
 * SynchronousQueue(同步队列)
 * 1.在Exchanger的基础上解决了生产者和消费者不均衡时的问题
 * 2.仅用于线程之间安全的交换数据
 * 较其它Queue的优势
 * 1.足够轻量
 * 2.将任务直接交给消费者而不是放入队列
 * Created by WenChen on 2019/12/4.
 */
public class SynchonousQueueTest {

    private SynchronousQueue<String> queue = new SynchronousQueue<>();

    private CountDownLatch latch = new CountDownLatch(2);

    @Test
    public void test (){
        Thread provider1 = new Thread(() -> {
            try {
                queue.put("provider1");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        });
        Thread provider2 = new Thread(() -> {
            try {
                queue.put("provider2");
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        });
        Thread consumer1 = new Thread(()-> doExchange());
        Thread consumer2 = new Thread(()-> doExchange());
        provider1.start();
        provider2.start();
        consumer1.start();
        consumer2.start();
        try {
            latch.await();
            System.out.println("End...");
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    private void doExchange (){
        try {
            System.out.println(queue.take());
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        latch.countDown();
    }
}
