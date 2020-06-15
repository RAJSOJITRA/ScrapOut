package com.example.demo.service;

import java.util.List;

import com.example.demo.model.OrderInfo;

public interface OrderInfoService {

	void insert(OrderInfo ordervo);
	
	List<OrderInfo> findByUserId(int id);
	
	List<OrderInfo> findByOrderId(OrderInfo ordervo);
}
