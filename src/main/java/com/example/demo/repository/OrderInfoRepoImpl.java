package com.example.demo.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.model.OrderInfo;

@Repository
@Transactional
public class OrderInfoRepoImpl implements OrderInfoRepo {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void insert(OrderInfo ordervo) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.saveOrUpdate(ordervo);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<OrderInfo> findByUserId(int id) {
		List<OrderInfo> registerList = new ArrayList<OrderInfo>();
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from OrderInfo where userid_id =:userid" );
			query.setParameter("userid", id);
			registerList = (List<OrderInfo>) ((org.hibernate.query.Query) query).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return registerList;
	}

	@Override
	public List<OrderInfo> findByOrderId(OrderInfo ordervo) {
		List<OrderInfo> registerList = new ArrayList<OrderInfo>();
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from OrderInfo where order_id =:orderid" );
			query.setParameter("orderid", ordervo.getId());
			registerList = (List<OrderInfo>) ((org.hibernate.query.Query) query).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return registerList;
	}
	
}

