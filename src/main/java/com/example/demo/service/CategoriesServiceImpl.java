package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.model.Categories_VO;
import com.example.demo.repository.CategoriesRepo;

@Service
public class CategoriesServiceImpl implements CategoriesService {

	@Autowired
	private CategoriesRepo categoriesRepo;

	@Override
	public List Display_Item() {
		return this.categoriesRepo.Display_Item();
	}

	@Override
	public List Selected_Item_Display(Categories_VO data) {
		return this.categoriesRepo.Selected_Item_Display(data);
	}
}
