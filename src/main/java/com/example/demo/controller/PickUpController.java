package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.SecurityProperties.User;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Address_VO;
import com.example.demo.model.LoginVO;
import com.example.demo.service.AdderessService;
import com.example.demo.service.UserPrincipal;

@Controller
public class PickUpController {

	@Autowired
	@Lazy
	private AdderessService adderessService;
	
	@RequestMapping(value = "/requestPickUp", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView requestPickUp() {
		//this.adderessService.insert(address_VO);
		
		return new ModelAndView("PickUp/RequestPickUpNow");
	}
	
	
	@RequestMapping(value="/getuser", method = RequestMethod.GET)
	  public String printUser() {

	      UserPrincipal user = (UserPrincipal)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	      String name =  (String)user.getUsername(); //get logged in username
	     // model.addAttribute("username", name);
	      return name;
	  }
	
	@RequestMapping(value = "/address", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView loadAddress() {
		return new ModelAndView("PickUp/PickUpAddress", "AddressVO", new Address_VO());
	}
	
	@RequestMapping(value = "/insert_address", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView insertAddress(@ModelAttribute Address_VO address_VO) {
		String user=this.printUser();
		address_VO.setUser(user);
		this.adderessService.insert(address_VO);
		return new ModelAndView("redirect:/requestPickUp");
	}

	@RequestMapping(value = "/editAddress", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView editAddress(@ModelAttribute Address_VO address_VO,@RequestParam("id") int id) {
		address_VO.setId(id);
		List<Address_VO> addressList = new ArrayList<Address_VO>();
		
		addressList=this.adderessService.editAddress(address_VO);
		System.out.println("in edit controller");
		System.out.println(addressList.get(0));
		return new ModelAndView("PickUp/PickUpAddress").addObject("AddressVO", addressList.get(0));
	}
	
	
	/*
	 * @RequestMapping(value = "/PickUpAddress", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView PickUpjsp() {
	 * //this.adderessService.insert(address_VO); return new
	 * ModelAndView("PickUp/PickUpAddress").addObject("AddressVO", new
	 * Address_VO()); }
	 */
	
	@RequestMapping(value = "/AddressList", method = { RequestMethod.GET, RequestMethod.POST })
	public List<Address_VO> Addresslist(@ModelAttribute Address_VO address_VO) {
		List<Address_VO> addressList = new ArrayList<Address_VO>();
		String user=this.printUser();
		address_VO.setUser(user);
		System.out.println(user);
		addressList = this.adderessService.display(address_VO);
		return addressList;	
	}
	
	@RequestMapping(value = "/displayAddress", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView AddressOpen(@ModelAttribute Address_VO address_VO) {
		List<Address_VO> addressList = new ArrayList<Address_VO>();
		addressList=this.Addresslist(address_VO);
		return new ModelAndView("PickUp/Show_Address").addObject("addressList",addressList);	
	}
	
	@RequestMapping(value = "/ChangeOrAdd", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView AddressChange(@ModelAttribute Address_VO address_VO) {
		List<Address_VO> addressList = new ArrayList<Address_VO>();
		
		String user = this.printUser();
		address_VO.setUser(user);
		addressList=this.Addresslist(address_VO);
		return new ModelAndView("PickUp/ChangeOrAddAddress").addObject("addressList", addressList);
	}
}
