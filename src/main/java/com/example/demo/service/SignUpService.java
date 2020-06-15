package com.example.demo.service;

import java.util.List;

import com.example.demo.model.LoginVO;
import com.example.demo.model.SignupVO;

public interface SignUpService {

	void insert(SignupVO SignupVO);
	
	List<SignupVO> search();
	
	List<SignupVO> findById(int id);
	
	List<SignupVO> findByUserNameandMobileNo(LoginVO lid);
	
}
