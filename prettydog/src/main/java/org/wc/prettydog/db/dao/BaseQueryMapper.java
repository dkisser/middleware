package org.wc.prettydog.db.dao;

import java.util.List;

/**
 * Created by WenChen on 2019/7/26.
 */
public interface BaseQueryMapper {

    <T> T selectOne (T record);

    <T> List<T> select (T record);
}
