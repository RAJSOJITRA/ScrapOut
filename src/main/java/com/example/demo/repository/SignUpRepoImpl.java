package com.example.demo.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.demo.model.LoginVO;
import com.example.demo.model.SignupVO;

@Repository
public class SignUpRepoImpl implements SignUpRepo{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void insert(SignupVO registerVO) {
		try {
			Session session = sessionFactory.getCurrentSession();
			session.save(registerVO);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SignupVO> search() {
		List<SignupVO> registerList = new ArrayList<SignupVO>();
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from SignupVO where status = true");
			registerList = (List<SignupVO>) ((org.hibernate.query.Query) query).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return registerList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<SignupVO> findById(int id) {
		List<SignupVO> registerList = new ArrayList<SignupVO>();
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from SignupVO where status = true and id = " + id);
			registerList = (List<SignupVO>) ((org.hibernate.query.Query) query).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return registerList;
	}

	@Override
	public List<SignupVO> findByUserNameandMobileNo(LoginVO lid) {
		List<SignupVO> registerList = new ArrayList<SignupVO>();
		try {
			Session session = sessionFactory.getCurrentSession();
			Query query = session.createQuery("from SignupVO where  lid_id= :userid");
			query.setParameter("userid", lid.getId());
			registerList = (List<SignupVO>) ((org.hibernate.query.Query) query).list();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return registerList;
	}
}
