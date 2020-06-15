package com.example.demo.repository;

import java.util.List;

import com.example.demo.model.Address_VO;


public interface AddressRepo {

void insert(Address_VO address_VO);
	
	List<Address_VO> display(Address_VO address_VO);
	
	List<Address_VO> findById(int id);	
	
	List<Address_VO> editAddress(Address_VO address_VO);

	
}
