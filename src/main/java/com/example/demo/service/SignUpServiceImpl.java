package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.LoginVO;
import com.example.demo.model.SignupVO;
import com.example.demo.repository.SignUpRepo;



@Service
@Transactional
public class SignUpServiceImpl implements SignUpService{

	@Autowired
	private SignUpRepo signupservice;
	
	@Override
	public void insert(SignupVO SignupVO) {
		this.signupservice.insert(SignupVO);
		
	}

	@Override
	public List<SignupVO> search() {
		return this.signupservice.search();
	}

	@Override
	public List<SignupVO> findById(int id) {
		return this.signupservice.findById(id);
	}

	@Override
	public List<SignupVO> findByUserNameandMobileNo(LoginVO lid) {
		return this.signupservice.findByUserNameandMobileNo(lid);
	}

	
}
