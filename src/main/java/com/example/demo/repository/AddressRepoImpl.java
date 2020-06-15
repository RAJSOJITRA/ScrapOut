package com.example.demo.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.model.Address_VO;

@Repository
@Transactional
public class AddressRepoImpl implements AddressRepo {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void insert(Address_VO registerVO) {
		try {
			org.hibernate.Session session = sessionFactory.getCurrentSession();
			session.saveOrUpdate(registerVO);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Address_VO> findById(int id) {
		List<Address_VO> registerList = new ArrayList<Address_VO>();
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Address_VO where id = :addid");
			query.setParameter("addid", id);
			registerList = (List<Address_VO>) ((org.hibernate.query.Query) query).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return registerList;
	}

	@Override
	public List<Address_VO> display(Address_VO address_VO) {
		List<Address_VO> registerList = new ArrayList<Address_VO>();
		try {
			
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Address_VO where user = :uname ");
			query.setParameter("uname", address_VO.getUser());
			registerList = (List<Address_VO>) ((org.hibernate.query.Query) query).list();
		    
			//System.out.println(registerList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return registerList;
	}

	@Override
	public List<Address_VO> editAddress(Address_VO address_VO) {
		List<Address_VO> registerList = new ArrayList<Address_VO>();
		try {
			
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from Address_VO where id = : userid");
			query.setParameter("userid", address_VO.getId());
			registerList =(List<Address_VO>) ((org.hibernate.query.Query) query).list();

			//System.out.println(registerList);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return registerList;
	}

}
