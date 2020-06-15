package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Address_VO;
import com.example.demo.repository.AddressRepo;

@Service
public class AddressServiceImpl implements AdderessService {

	@Autowired
	private AddressRepo addressrepo;

	@Override
	public void insert(Address_VO address_VO) {
		this.addressrepo.insert(address_VO);
		
	}
	@Override
	public List<Address_VO> findById(int id) {
		return this.addressrepo.findById(id);
	}
	
	@Override
	public List<Address_VO> display(Address_VO address_VO) {
		return this.addressrepo.display(address_VO);
	}
	@Override
	public List<Address_VO> editAddress(Address_VO address_VO) {
		return this.addressrepo.editAddress(address_VO);
	}
	
	
}
