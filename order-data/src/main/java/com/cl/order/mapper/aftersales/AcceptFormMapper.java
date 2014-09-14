package com.cl.order.mapper.aftersales;

import com.cl.order.model.aftersales.AcceptForm;

public interface AcceptFormMapper {
    int deleteByPrimaryKey(String acceptCode);

    int insert(AcceptForm record);

    int insertSelective(AcceptForm record);

    AcceptForm selectByPrimaryKey(String acceptCode);

    int updateByPrimaryKeySelective(AcceptForm record);

    int updateByPrimaryKey(AcceptForm record);
}