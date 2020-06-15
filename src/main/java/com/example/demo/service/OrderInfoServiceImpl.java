package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.OrderInfo;
import com.example.demo.repository.OrderInfoRepo;

@Service
@Transactional
public class OrderInfoServiceImpl implements OrderInfoService{

	@Autowired
	private OrderInfoRepo orderrepo;
	
	@Override
	public void insert(OrderInfo ordervo) {
		this.orderrepo.insert(ordervo);
	}

	@Override
	public List<OrderInfo> findByUserId(int id) {
		return this.orderrepo.findByUserId(id);
	}

	@Override
	public List<OrderInfo> findByOrderId(OrderInfo ordervo) {
		return this.orderrepo.findByOrderId(ordervo);
	}

}
