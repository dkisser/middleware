package org.wc.prettydog.util.jdk.util.concurrent;

import org.junit.Test;

import java.io.IOException;
import java.util.concurrent.Phaser;

/**
 * Phaser(阶段同步器)
 * 在CyclicBarrier的基础上解决了其
 * 1.不能动态调整计数器(若是CyclicBarrier初始化时指定的线程数过大，儿又没有足够的线程达到await状态，
 * 则会一直等待，除非手动执行reset,或者多添加些线程)
 * 2.每次awit仅消耗一个计数器值，不够灵活
 * Created by WenChen on 2019/12/4.
 */
public class PhraserTest {

    private Phaser phaser = new Phaser(3);

    @Test
    public void test(){
        Thread a = new Thread(new PhraserTestThread());
        Thread b = new Thread(new PhraserTestThread());
        Thread c = new Thread(new PhraserTestThread());
        a.start();
        b.start();
        try {
            Thread.sleep(3*1000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        c.start();
        try {
            System.in.read();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    class PhraserTestThread implements Runnable{

        @Override
        public void run() {
            while(true){
                try {
                    Thread.sleep(5*1000L);
                    System.out.println("sleep end --- "+System.currentTimeMillis());
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                phaser.arriveAndAwaitAdvance();
                System.out.println("current phraser value:"+phaser.getPhase());
            }
        }
    }
}
