package com.example.demo.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.model.LoginVO;

@Repository
@Transactional
public class LoginRepoImpl implements LoginRepo{

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public void insert(LoginVO registerVO) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.saveOrUpdate(registerVO);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LoginVO> search() {
		List<LoginVO> registerList = new ArrayList<LoginVO>();
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from LoginVO where status = true");
			registerList = (List<LoginVO>) ((org.hibernate.query.Query) query).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return registerList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LoginVO> findById(int id) {
		List<LoginVO> registerList = new ArrayList<LoginVO>();
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from LoginVO where status = true and id = " + id);
			registerList = (List<LoginVO>) ((org.hibernate.query.Query) query).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return registerList;
	}

	@Override
	public List<LoginVO> findByUserName(String username) {
		List<LoginVO> registerList = new ArrayList<LoginVO>();
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from LoginVO where status = true and userName =:user" );
			query.setParameter("user", username);
			registerList = (List<LoginVO>) ((org.hibernate.query.Query) query).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return registerList;
	}

	
}
