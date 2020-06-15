package com.example.demo.repository;

import java.util.List;

import com.example.demo.model.OrderInfo;

public interface OrderInfoRepo {
	
	void insert(OrderInfo ordervo);
	
	List<OrderInfo> findByUserId(int id);
	
	List<OrderInfo> findByOrderId(OrderInfo ordervo);

}
