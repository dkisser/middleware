package org.wc.prettydog.db.dao;

import org.springframework.stereotype.Repository;
import org.wc.prettydog.db.pojo.CSequence;

@Repository
public interface CSequenceMapper extends BaseQueryMapper{
    int insert(CSequence record);

    int insertSelective(CSequence record);
}