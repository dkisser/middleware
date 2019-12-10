package org.wc.prettydog.util.jdk.util.concurrent;

import org.junit.Test;

import java.io.IOException;
import java.util.concurrent.BrokenBarrierException;
import java.util.concurrent.CyclicBarrier;

/**
 * CyclicBarrier(循环屏障)
 * 1.解决CountDownLatch不能复用的问题(CountDownLatch一旦使用完，计数器已经置0，无法再用)
 * Created by WenChen on 2019/12/4.
 */
public class CyclicBarrierTest {

    private static final int total = 5;

    private CyclicBarrier barrier = new CyclicBarrier(total, () -> System.out.println("Total end!"));

    @Test
    public void testCyclicBarrier() {
        System.out.println("Begin!");
        for (int i = 0; i < total; i++) {
            new Thread(new Worker("test"+i,barrier)).start();
        }
        try {
            System.in.read();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    class Worker implements Runnable {

        private String name;

        private CyclicBarrier bar;

        public Worker(String name,CyclicBarrier barrier) {
            this.name = name;
            this.bar = barrier;
        }

        @Override
        public void run() {
            System.out.println(name);
            try {
                this.bar.await();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (BrokenBarrierException e) {
                e.printStackTrace();
            }
            System.out.println("wait next!");
            try {
                this.bar.await();
            } catch (InterruptedException e) {
                e.printStackTrace();
            } catch (BrokenBarrierException e) {
                e.printStackTrace();
            }
        }
    }
}
