package com.cl.order.mapper.aftersales;

import com.cl.order.model.aftersales.AcceptLog;

public interface AcceptLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AcceptLog record);

    int insertSelective(AcceptLog record);

    AcceptLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AcceptLog record);

    int updateByPrimaryKey(AcceptLog record);
}