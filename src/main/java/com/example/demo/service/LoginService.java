package com.example.demo.service;

import java.util.List;

import com.example.demo.model.LoginVO;

public interface LoginService {

void insert(LoginVO LoginVO);
	
	List<LoginVO> search();
	
	List<LoginVO> findById(int id);
	
	List<LoginVO> findByUserName(String username);
}
