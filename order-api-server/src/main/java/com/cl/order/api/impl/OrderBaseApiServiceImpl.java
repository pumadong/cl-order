package com.cl.order.api.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cl.order.api.IOrderBaseApiService;
import com.cl.order.mapper.base.DictionaryMapper;
import com.cl.order.model.base.Dictionary;



@Service
public class OrderBaseApiServiceImpl implements IOrderBaseApiService {

	@Autowired
	private DictionaryMapper dictionaryMapper;

	@Override
	public Dictionary getDictionaryById(Integer id) {
		return dictionaryMapper.selectByPrimaryKey(id);
	}

}
