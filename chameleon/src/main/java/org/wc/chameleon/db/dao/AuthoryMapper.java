package org.wc.chameleon.db.dao;

import org.springframework.stereotype.Repository;
import org.wc.chameleon.db.pojo.Authory;

@Repository
public interface AuthoryMapper {
    int insert(Authory record);

    int insertSelective(Authory record);
}