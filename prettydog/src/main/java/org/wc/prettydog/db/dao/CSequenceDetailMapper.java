package org.wc.prettydog.db.dao;

import org.springframework.stereotype.Repository;
import org.wc.prettydog.db.pojo.CSequenceDetail;

@Repository
public interface CSequenceDetailMapper extends BaseQueryMapper{
    int insert(CSequenceDetail record);

    int insertSelective(CSequenceDetail record);

    int updateSelectiveBySeqNo(CSequenceDetail record);
}