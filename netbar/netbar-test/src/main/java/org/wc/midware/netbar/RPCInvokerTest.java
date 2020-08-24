package org.wc.midware.netbar;

import org.wc.midware.netbar.core.RPCInvoker;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by WenChen on 2020/8/24.
 */
public class RPCInvokerTest {

    public static void main(String[] args) {
        RPCInvoker invoker = new RPCInvoker("test11","fd","ew");
        Map<String,Object> req = new HashMap<>();
        req.put("test",1);
        req.put("tes",2);
        System.out.println(invoker.invoke(req));
    }
}
