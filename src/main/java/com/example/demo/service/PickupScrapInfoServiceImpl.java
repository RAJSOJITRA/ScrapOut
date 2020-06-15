package com.example.demo.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.PickupScrapInfo;
import com.example.demo.repository.PickupScrapInfoRepo;

@Service
@Transactional
public class PickupScrapInfoServiceImpl implements PickupScrapInfoService{

	@Autowired
	private PickupScrapInfoRepo pickupupScrapInfoRepo;

	@Override
	public void insert(PickupScrapInfo pickupScrapInfo) {
		this.pickupupScrapInfoRepo.insert(pickupScrapInfo);
		
	}
}
