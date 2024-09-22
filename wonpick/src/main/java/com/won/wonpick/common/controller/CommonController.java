package com.won.wonpick.common.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.won.wonpick.member.model.vo.Member;
import com.won.wonpick.member.service.MemberService;
import com.won.wonpick.post.model.vo.Post;
import com.won.wonpick.post.service.PostService;
@RequestMapping("/myprofile")
@Controller
public class CommonController {
	
	private final MemberService mService;
	private final PostService pService;
	
	@Autowired
	public CommonController(MemberService mService, PostService pService) {
		this.mService = mService;
		this.pService = pService;
	}
	
	@RequestMapping("/profile")
	public String profile() {
		return "option/myprofile";
	}
	@RequestMapping("/saveList")
	public String saveList() {
		
		return "option/saveList";
	}

	@RequestMapping("/setAlert")
	public String Alert() {
		
		return "option/setAlert";
	}
	
	@RequestMapping("/profileInfo")
	   public String showProfileInfo(@RequestParam(value = "userId", required = false) String userId, HttpSession session, Model model) {

	       if (userId == null) {
	           Member loginUser = (Member) session.getAttribute("loginUser");
	           if (loginUser != null) {
	               userId = loginUser.getUserId();
	           } else {
	               model.addAttribute("errorMsg", "로그인 정보가 없습니다.");
	               return "common/errorPage";
	           }
	       }

	       Member foundMem = mService.getMemberById(userId);
	       ArrayList<Post> bLIst = pService.selectProfilePostList(userId);
	       
	       if (foundMem != null) {
	           model.addAttribute("member", foundMem);
	           session.setAttribute("list", bLIst);
	           return "option/profileInfo"; 
	       } else {
	           model.addAttribute("errorMsg", "사용자를 찾을 수 없습니다.");
	           return "common/errorPage";
	       }
	   }
	
	

	
	
}
