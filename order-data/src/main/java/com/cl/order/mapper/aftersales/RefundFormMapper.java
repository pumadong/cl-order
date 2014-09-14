package com.cl.order.mapper.aftersales;

import com.cl.order.model.aftersales.RefundForm;

public interface RefundFormMapper {
    int deleteByPrimaryKey(String refundCode);

    int insert(RefundForm record);

    int insertSelective(RefundForm record);

    RefundForm selectByPrimaryKey(String refundCode);

    int updateByPrimaryKeySelective(RefundForm record);

    int updateByPrimaryKey(RefundForm record);
}