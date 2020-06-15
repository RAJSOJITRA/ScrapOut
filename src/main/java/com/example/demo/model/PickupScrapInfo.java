package com.example.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="ScrapOrderInfo")
public class PickupScrapInfo {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private int id;
	
	@ManyToOne
	private OrderInfo orderid;
	
	@ManyToOne
	private Categories_VO categoryId;
	
	@Column(name="Wights")
	private int weights;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public OrderInfo getOrderid() {
		return orderid;
	}

	public void setOrderid(OrderInfo orderid) {
		this.orderid = orderid;
	}

	public Categories_VO getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Categories_VO categoryId) {
		this.categoryId = categoryId;
	}

	public int getWeights() {
		return weights;
	}

	public void setWeights(int weights) {
		this.weights = weights;
	}

	@Override
	public String toString() {
		return "PickupScrapInfo [id=" + id + ", orderid=" + orderid + ", categoryId=" + categoryId + ", weights="
				+ weights + "]";
	}

	
}
