package org.wc.chameleon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wc.chameleon.db.dao.CustomerMapper;
import org.wc.chameleon.db.pojo.Customer;

import java.util.List;

/**
 * Created by WenChen on 2019/10/14.
 */
@Service
public class CustomerService {

    @Autowired
    private CustomerMapper customerMapper;

    public List<Customer> getAll (){
        return customerMapper.select();
    }
}
