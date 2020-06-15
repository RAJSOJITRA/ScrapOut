package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class OrderController {

	@RequestMapping(value = "/pastorder", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView loadservices() {
		return new ModelAndView("Orders/PastOrder");
	}
}
