package org.wc.webserver.lock.reentrant;

import org.apache.curator.framework.CuratorFramework;
import org.apache.curator.framework.CuratorFrameworkFactory;
import org.apache.curator.framework.recipes.locks.InterProcessMutex;
import org.apache.curator.retry.ExponentialBackoffRetry;
import org.apache.curator.utils.CloseableUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.*;

/**
 * Created by WenChen on 2019/6/5.
 */
public class SharedReentrantLockTest {

    private static final int CLIENT_NUM = 5;

    private static ExecutorService excutors = Executors.newFixedThreadPool(CLIENT_NUM);

    private static FakeLimitResource resource = new FakeLimitResource();

    private static CountDownLatch countDownLatch = new CountDownLatch(CLIENT_NUM);

    public static void main (String[] args){

        List<TestTask> tasks = new ArrayList<>();
        for (int i=0;i<CLIENT_NUM;i++){
            CuratorFramework client = CuratorFrameworkFactory.builder()
                    .connectString("127.0.0.1:2181")
                    .retryPolicy(new ExponentialBackoffRetry(1000,3))
                    .build();
            tasks.add(new TestTask(countDownLatch,i,resource,client));
        }
        try {
            excutors.invokeAll(tasks);
            excutors.shutdown();
            countDownLatch.await();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        System.out.println("运行完毕");
    }

    static class TestTask implements Callable<String>{

        private static final String lockPath = "/testZK/sharedreentrantlock";

        private CountDownLatch countDownLatch;

        private int clientId;

        private FakeLimitResource resource;

        CuratorFramework client;

        public TestTask(CountDownLatch countDownLatch, int clientId, FakeLimitResource resource,CuratorFramework client) {
            this.countDownLatch = countDownLatch;
            this.clientId = clientId;
            this.resource = resource;
            this.client = client;
        }

        @Override
        public String call() throws Exception {
            client.start();
            Random random = new Random();
            try {
                InterProcessMutex lock = new InterProcessMutex(client,lockPath);
                for (int j=0;j<10;j++){
                    if (!lock.acquire(10, TimeUnit.SECONDS)){
                        throw new IllegalStateException(j+" ."+clientId +" can't aquire the lock");
                    }
                    try {
                        System.out.println(j+". client:"+clientId+" has aquire the lock");
                        resource.use();
                        if (!lock.acquire(10, TimeUnit.SECONDS)) {
                            throw new IllegalStateException(j + ". " + clientId + " 不能再次得到互斥锁");
                        }
                        System.out.println(j + ". " + clientId + " 已再次获取到互斥锁");
                        lock.release(); //
                    } finally {
                        lock.release();
                    }
                    Thread.sleep(random.nextInt(100));
                }
            } catch (Exception e){
                e.printStackTrace();
            } finally {
                CloseableUtils.closeQuietly(client);
                System.out.println(clientId + " 客户端关闭！");
                countDownLatch.countDown();
            }
            return "";
        }
    }
}
