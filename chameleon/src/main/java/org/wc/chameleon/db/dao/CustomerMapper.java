package org.wc.chameleon.db.dao;

import org.springframework.stereotype.Repository;
import org.wc.chameleon.db.pojo.Customer;

import java.util.List;
@Repository
public interface CustomerMapper {
    int insert(Customer record);

    int insertSelective(Customer record);

    List<Customer> select();
}