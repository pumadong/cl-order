package com.cl.order.mapper.book;

import com.cl.order.model.book.OrderForm;

public interface OrderFormMapper {
    int deleteByPrimaryKey(String formCode);

    int insert(OrderForm record);

    int insertSelective(OrderForm record);

    OrderForm selectByPrimaryKey(String formCode);

    int updateByPrimaryKeySelective(OrderForm record);

    int updateByPrimaryKey(OrderForm record);
}