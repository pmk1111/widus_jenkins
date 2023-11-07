package com.naver.myhome.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/home")
public class HomeController {
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(ModelAndView mv) {
		return "home/home";
	}
}
