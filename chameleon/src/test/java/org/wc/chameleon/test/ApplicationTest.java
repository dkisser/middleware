package org.wc.chameleon.test;

import com.alibaba.fastjson.JSONObject;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.wc.chameleon.ChameleonStart;
import org.wc.chameleon.db.dao.AuthoryMapper;
import org.wc.chameleon.db.pojo.Authory;
import org.wc.chameleon.service.AuthoryService;
import org.wc.chameleon.service.CustomerService;

/**
 * Created by WenChen on 2019/10/14.
 */
@RunWith(SpringRunner.class)
@SpringBootTest(classes = ChameleonStart.class)
public class ApplicationTest {

    @Autowired
    private CustomerService customerService;

    @Autowired
    private AuthoryService authoryService;

    @Test
    public void test(){
        System.out.println(JSONObject.toJSONString(customerService.getAll()));
        Authory authory = new Authory();
        authory.setId(1);
        authory.setPower(1);
        System.out.println("insert to authory "+ (authoryService.insertOne(authory) > 0 ? "success" : "failed") );
    }
}
