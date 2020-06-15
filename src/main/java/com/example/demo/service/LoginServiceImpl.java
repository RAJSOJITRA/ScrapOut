package com.example.demo.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.LoginVO;
import com.example.demo.model.SignupVO;
import com.example.demo.repository.LoginRepo;

@Service
@Transactional
public class LoginServiceImpl implements LoginService{

	@Autowired
	private LoginRepo loginservice;

	@Override
	public void insert(LoginVO LoginVO) {
		this.loginservice.insert(LoginVO);
		
	}

	@Override
	public List<LoginVO> search() {
		return this.loginservice.search();
	}

	@Override
	public List<LoginVO> findById(int id) {
		return this.loginservice.findById(id);
	}

	@Override
	public List<LoginVO> findByUserName(String username) {
		return this.loginservice.findByUserName(username);
	}

	
	
	
}
