package com.cl.order.mapper.book;

import com.cl.order.model.book.OrderConsignee;

public interface OrderConsigneeMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(OrderConsignee record);

    int insertSelective(OrderConsignee record);

    OrderConsignee selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(OrderConsignee record);

    int updateByPrimaryKey(OrderConsignee record);
}