package com.cl.order.mapper.book;

import com.cl.order.model.book.OrderMainDetail;

public interface OrderMainDetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderMainDetail record);

    int insertSelective(OrderMainDetail record);

    OrderMainDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderMainDetail record);

    int updateByPrimaryKey(OrderMainDetail record);
}