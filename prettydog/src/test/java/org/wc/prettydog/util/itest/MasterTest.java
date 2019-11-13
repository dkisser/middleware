package org.wc.prettydog.util.itest;

import org.junit.Test;
import org.wc.prettydog.support.Master;
import org.wc.prettydog.support.Worker;

import java.math.BigDecimal;

/**
 * Created by WenChen on 2019/11/13.
 */
public class MasterTest extends Master {

    public MasterTest(Worker woker, int wokerCount) {
        super(woker, wokerCount);
    }

    public void get(){
        start();
        super.getRestultAsMap();
        System.out.println(getRestultAsMap());
    }

    public static void main (String[] args){
        //---------test function
        BigDecimal one = new BigDecimal(1);
        MasterTest master = new MasterTest(new Worker() {
            @Override
            public Object doWorker(Object o) {
                BigDecimal i = (BigDecimal) o;
                return i.add(one);
            }
        },4);
        for (int i=0;i<1000;i++){
            master.submit(new BigDecimal(i));
        }
        master.get();
        //--------test function
        BigDecimal two = new BigDecimal(2);
        Master master1 = new Master(new Worker() {
            @Override
            public Object doWorker(Object o) {
                BigDecimal i = (BigDecimal)o;
                return i.multiply(two);
            }
        },3);
        for (int i=1;i<=100;i++){
            master1.submit(new BigDecimal(i));
        }
        System.out.println(master1.getRestultAsMap());
        System.out.println(master1.getSum());
    }
}
