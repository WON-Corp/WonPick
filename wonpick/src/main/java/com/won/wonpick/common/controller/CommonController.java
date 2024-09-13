package com.won.wonpick.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/myprofile")
@Controller
public class CommonController {
	
	@Autowired
	public CommonController() {
		
	}
	
	@RequestMapping("/profile")
	public String profile() {
		return "option/myprofile";
	}
}
