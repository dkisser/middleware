package org.wc.chameleon;

/**
 * Created by WenChen on 2019/10/14.
 */
public class DataSourceSelector {

    private static ThreadLocal<DBType> current = new ThreadLocal<>();

    public static DBType get(){
        return current.get() == null? DBType.master : current.get();
    }

    public static void set(DBType type){
        current.set(type);
    }
}
