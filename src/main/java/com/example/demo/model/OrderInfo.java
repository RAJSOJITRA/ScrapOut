package com.example.demo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="OrderInfo")
public class OrderInfo {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="order_id")
	private int id;
	
	@ManyToOne
	private SignupVO userid;
	
	@ManyToOne
	private Address_VO Addressid;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public SignupVO getUserid() {
		return userid;
	}

	public void setUserid(SignupVO userid) {
		this.userid = userid;
	}

	public Address_VO getAddressid() {
		return Addressid;
	}

	public void setAddressid(Address_VO addressid) {
		Addressid = addressid;
	}

	@Override
	public String toString() {
		return "OrderInfo [id=" + id + ", userid=" + userid + ", Addressid=" + Addressid + "]";
	}
	
}
