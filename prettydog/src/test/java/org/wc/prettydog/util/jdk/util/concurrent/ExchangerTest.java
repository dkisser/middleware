package org.wc.prettydog.util.jdk.util.concurrent;

import org.junit.Test;

import java.util.concurrent.Exchanger;

/**
 * Exchanger(交换管道)
 * 1.只能用于两个线程之间交换数据，无法用于生产者和消费者不均衡的场景
 * Created by WenChen on 2019/12/4.
 */
public class ExchangerTest {

    private static int changeCount = 5;

    private Exchanger<Integer> exchanger = new Exchanger<>();

    @Test
    public void testExchanger (){
        Thread provider = new Thread(new Provider(exchanger));
        provider.start();
        Thread consumer = new Thread(new ConSumer(exchanger));
        consumer.start();
        while (provider.getState() != Thread.State.TERMINATED){
            try {
                Thread.sleep(100L);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }
    }

    class Provider implements Runnable{

        private int num = 0;

        private Exchanger exchanger;

        private Provider(Exchanger exchanger) {
            this.exchanger = exchanger;
        }

        @Override
        public void run() {
            do{
                System.out.println("provider交换前--->"+num);
                try {
                    Integer t = (Integer) exchanger.exchange(num);
                    System.out.println("provider交换后--->"+t);
                    num+=t;
                    changeCount--;
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }while(changeCount > 0);
        }
    }

    class ConSumer implements Runnable{

        private int num = 1;

        private Exchanger exchanger;

        private ConSumer(Exchanger exchanger) {
            this.exchanger = exchanger;
        }

        @Override
        public void run() {
            do {
                System.out.println("consumer交换前--->"+num);
                try {
                    Integer t = (Integer) exchanger.exchange(num);
                    System.out.println("consumer交换后--->"+t);
                    num+=t;
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }while(changeCount > 0);
        }
    }
}
