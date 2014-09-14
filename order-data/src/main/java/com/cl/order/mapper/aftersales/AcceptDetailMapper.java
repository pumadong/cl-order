package com.cl.order.mapper.aftersales;

import com.cl.order.model.aftersales.AcceptDetail;

public interface AcceptDetailMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AcceptDetail record);

    int insertSelective(AcceptDetail record);

    AcceptDetail selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AcceptDetail record);

    int updateByPrimaryKey(AcceptDetail record);
}