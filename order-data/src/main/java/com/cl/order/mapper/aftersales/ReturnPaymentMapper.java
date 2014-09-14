package com.cl.order.mapper.aftersales;

import com.cl.order.model.aftersales.ReturnPayment;

public interface ReturnPaymentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ReturnPayment record);

    int insertSelective(ReturnPayment record);

    ReturnPayment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ReturnPayment record);

    int updateByPrimaryKey(ReturnPayment record);
}