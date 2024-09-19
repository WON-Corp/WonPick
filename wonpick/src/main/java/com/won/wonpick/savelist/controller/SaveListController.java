package com.won.wonpick.savelist.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.won.wonpick.member.model.vo.Member;
import com.won.wonpick.savelist.model.vo.SaveList;
import com.won.wonpick.savelist.service.SaveListService;
@RequestMapping("/saveList")
@Controller
public class SaveListController {
	private final SaveListService sService;
	
	@Autowired
	public SaveListController(SaveListService sService) {
		this.sService = sService;
	}
	
	@RequestMapping("/insertSaveList")
	public String insertSaveList(SaveList sList, int postId, HttpSession session) {
		
		Member currentMember = (Member) session.getAttribute("loginUser");
		
		sList.setUserId(currentMember.getUserId());
		sList.setSavePostId(postId);
		System.out.println(sList);
		int result = sService.insertSaveList(sList);
		System.out.println(result);
		
		return "redirect:/";
	}
	
}
