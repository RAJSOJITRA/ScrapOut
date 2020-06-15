package com.example.demo.repository;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.model.Categories_VO;

@Repository
@Transactional
public class CategoriesRepoImpl implements CategoriesRepo {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List Display_Item() {
		List<Categories_VO> registerList = new ArrayList<Categories_VO>();
		try 
		{
			Session session = sessionFactory.getCurrentSession();
			Query q = session.createQuery("from Categories_VO");
			registerList = q.getResultList();
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return registerList;
	}

	@Override
	public List Selected_Item_Display(Categories_VO data) {
		List<Categories_VO> registerList = new ArrayList<Categories_VO>();
		try 
		{
			Session session = sessionFactory.getCurrentSession();
			Query q = session.createQuery("from Categories_VO where id= : cid");
			q.setParameter("cid", data.getId());
			registerList = q.getResultList();
		} 
		catch (Exception e)
		{
			e.printStackTrace();
		}
		return registerList;
	}
}
