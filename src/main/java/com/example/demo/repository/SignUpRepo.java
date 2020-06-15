package com.example.demo.repository;

import java.util.List;

import com.example.demo.model.LoginVO;
import com.example.demo.model.SignupVO;

public interface SignUpRepo {

	void insert(SignupVO SignupVO);
	
	List<SignupVO> search();
	
	List<SignupVO> findById(int id);
	
	List<SignupVO> findByUserNameandMobileNo(LoginVO lid);
}
