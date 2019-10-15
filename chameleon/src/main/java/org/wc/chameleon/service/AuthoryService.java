package org.wc.chameleon.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.wc.chameleon.db.dao.AuthoryMapper;
import org.wc.chameleon.db.pojo.Authory;

/**
 * Created by WenChen on 2019/10/15.
 */
@Service
public class AuthoryService {

    @Autowired
    private AuthoryMapper authoryMapper;

    public int insertOne(Authory authory){
        return authoryMapper.insert(authory);
    }
}
