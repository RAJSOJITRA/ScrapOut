package com.example.demo.service;

import java.util.List;

import com.example.demo.model.Categories_VO;

public interface CategoriesService {

	public List Display_Item();
	
	public List Selected_Item_Display(Categories_VO data);
}
