package com.cl.order.mapper.book;

import com.cl.order.model.book.OrderMainForm;

public interface OrderMainFormMapper {
    int deleteByPrimaryKey(String formCode);

    int insert(OrderMainForm record);

    int insertSelective(OrderMainForm record);

    OrderMainForm selectByPrimaryKey(String formCode);

    int updateByPrimaryKeySelective(OrderMainForm record);

    int updateByPrimaryKey(OrderMainForm record);
}