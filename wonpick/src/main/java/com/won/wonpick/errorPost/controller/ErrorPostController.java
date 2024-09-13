package com.won.wonpick.errorPost.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.won.wonpick.errorPost.model.vo.ErrorPost;
import com.won.wonpick.errorPost.service.ErrorPostService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Controller
@RequestMapping("/errorPost")
public class ErrorPostController {
	
	private final ErrorPostService epService;
	
	@RequestMapping("/insertError")
	public String insertError(ErrorPost ep, HttpSession session) {
		
		int result = epService.insertError(ep);
		
		if( result > 0 ) {
			session.setAttribute("alertMsg", "문제신고 완료하였습니다.");
		} else {
			session.setAttribute("alertMsg", "문제신고에 실패하였습니다. 문제내용을 확인해 주세요.");
		}
		return "redirect:/";
	}
	
	@RequestMapping("/selectErrorList")
	public String selectErrorPostList(ErrorPost ep, HttpServletResponse response, HttpSession session) {
		
		ArrayList<ErrorPost> epArr = epService.selectErrorPostList(ep);
		
		session.setAttribute("epArr", epArr);
		
		return "redirect:/post/list";
	}	

}
