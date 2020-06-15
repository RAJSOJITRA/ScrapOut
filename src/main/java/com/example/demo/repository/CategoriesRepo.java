package com.example.demo.repository;

import java.util.List;

import com.example.demo.model.Categories_VO;

public interface CategoriesRepo {

	public List Display_Item();
	
	public List Selected_Item_Display(Categories_VO data);
}
