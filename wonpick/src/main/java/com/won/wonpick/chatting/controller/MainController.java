package com.won.wonpick.chatting.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.won.wonpick.chatting.service.ChattingService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/wonMessage")
@Controller
public class MainController {
	
	private final ChattingService cService;
	
	@RequestMapping("/chat")
	public ModelAndView chat() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("wonchat/message");
		return mv;
	}
	
	@RequestMapping("/list")
	public String chattingList() {
		return "wonchat/chatRoom";
	}
}