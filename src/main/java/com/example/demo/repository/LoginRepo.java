package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.LoginVO;

public interface LoginRepo {

	void insert(LoginVO LoginVO);
	
	List<LoginVO> search();
	
	List<LoginVO> findById(int id);
	
	List<LoginVO> findByUserName(String username);
	
	//boolean findByUsernameandPassword(String Username,String password);
}
