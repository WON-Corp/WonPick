package com.won.wonpick.common.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.won.wonpick.member.service.MemberService;

@RequestMapping("/profile")
@Controller
public class CommonController {
private final BCryptPasswordEncoder bCrypt;
	
	// 생성자 주입 방식으로 의존성 주입
	@Autowired
	public CommonController(BCryptPasswordEncoder bCrypt) {
		
		this.bCrypt = bCrypt;
	}
	@RequestMapping("/myprofile")
	public String myfrofile() {
		return "option/myprofile";
	}
	
}
