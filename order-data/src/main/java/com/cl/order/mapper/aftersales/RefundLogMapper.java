package com.cl.order.mapper.aftersales;

import com.cl.order.model.aftersales.RefundLog;

public interface RefundLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(RefundLog record);

    int insertSelective(RefundLog record);

    RefundLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(RefundLog record);

    int updateByPrimaryKey(RefundLog record);
}