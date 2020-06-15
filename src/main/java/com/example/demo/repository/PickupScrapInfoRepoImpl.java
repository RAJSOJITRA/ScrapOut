package com.example.demo.repository;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.model.PickupScrapInfo;

@Repository
public class PickupScrapInfoRepoImpl implements PickupScrapInfoRepo {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void insert(PickupScrapInfo pickupScrapInfo) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(pickupScrapInfo);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
}
