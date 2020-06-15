package com.example.demo.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.LoginVO;
import com.example.demo.model.SignupVO;
import com.example.demo.service.LoginService;
import com.example.demo.service.SignUpService;

@Controller
public class CredentialController {

	@Autowired
	@Lazy
	private SignUpService registerService;
	
	@Autowired
	@Lazy
	private LoginService loginService;
	
	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView loadservices() {
		return new ModelAndView("Dashboard/index");
	}
	
	@RequestMapping(value = "/Signup", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView loadRegister() {
		return new ModelAndView("SignUp", "SignUpVO", new SignupVO());
	}
	
	@RequestMapping(value = "/SignUpInsert", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView insert(@ModelAttribute SignupVO registerVO) {
		
		LoginVO logiVO=registerVO.getLid(); 
		this.loginService.insert(logiVO);
		
		this.registerService.insert(registerVO);
		
		return new ModelAndView("redirect:/login");
	}
	
	@RequestMapping(value = "/login")
	public ModelAndView loadLogin() {
		return new ModelAndView("Login");
	}
	
	@RequestMapping(value = "/logout")
	public String loadLogout() {
		return "Logout";
	}
	
	@RequestMapping(value = "/welcome")
	public String LoginSuccess() {
		return "Welcome";
	}
	
	//@RequestMapping(value = "/user")
	//@ResponseBody
	//public Principal LoginUser(Principal principal) {
	//	return principal;
	//}
	
	/*
	 * @RequestMapping(value = "/loginCheck", method = { RequestMethod.GET,
	 * RequestMethod.POST }) public ModelAndView checkLogin(@ModelAttribute LoginVO
	 * loginvo) {
	 * System.out.println(this.loginService.findByUsernameandPassword(loginvo.
	 * getUserName(),loginvo.getPassword()));
	 * if(this.loginService.findByUsernameandPassword(loginvo.getUserName(),loginvo.
	 * getPassword())) { return new ModelAndView("Welcome"); } return new
	 * ModelAndView("redirect:/login"); }
	 */
	
	
}
