package com.won.wonpick.savelist.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@ResponseBody
	@RequestMapping("/insertSaveList")
	public String insertSaveList(SaveList sList, int postId, HttpSession session) {
		
		Member currentMember = (Member) session.getAttribute("loginUser");
		sList.setUserId(currentMember.getUserId());
		sList.setSavePostId(postId);
		int count = sService.selectSaveList(sList);
		if(count == 0) {
			int result = sService.insertSaveList(sList);
			return "Success";
		}else {
			int result = sService.deleteSaveList(sList);
			return "Failed";
		}
		
		
	
		
		
	}
	@ResponseBody
	@RequestMapping("/selectSaveList")
	public String selectSaveList(SaveList sList, int postId, HttpSession session) {
		
		
		int count = sService.selectSaveList(sList);
		if(count == 0) {
			
			return "no";
		}else {
			
			return "yes";
		}
	}
	
}
