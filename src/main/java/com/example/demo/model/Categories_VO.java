package com.example.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Categories")
public class Categories_VO {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@Column(name="categories_name")
	private String categories_name;
	
	@Column(name="categories_price")
	private int categories_price;
	
	@Column(name="display")
	private int display=1;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCategories_name() {
		return categories_name;
	}

	public void setCategories_name(String categories_name) {
		this.categories_name = categories_name;
	}

	public int getCategories_price() {
		return categories_price;
	}

	public void setCategories_price(int categories_price) {
		this.categories_price = categories_price;
	}

	public int getDisplay() {
		return display;
	}

	public void setDisplay(int display) {
		this.display = display;
	}

	@Override
	public String toString() {
		return "Categories_VO [id=" + id + ", categories_name=" + categories_name + ", categories_price="
				+ categories_price + ", display=" + display + "]";
	}
	
}
