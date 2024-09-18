package com.won.wonpick.postComment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.won.wonpick.postComment.model.vo.PostComment;
import com.won.wonpick.postComment.service.PostCommentService;

import lombok.RequiredArgsConstructor;
@RequiredArgsConstructor
@Controller
@RequestMapping("/postComment")
public class PostCommentController {
	
	private final PostCommentService pcService;
	
	@RequestMapping("/postCommentCount")
	public void postCommentCount(int postId, HttpServletResponse response, HttpSession session) {
		
		int result = pcService.postCommentCount(postId);
		
		if (result > 0) {
			try {
				response.getWriter().print(result);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@RequestMapping("/postCommentList")
	public void postCommentList(int postId, HttpServletResponse response, HttpSession session) {
		
		ArrayList<PostComment> pcList = pcService.postCommentList(postId);
		
		Gson gson = new Gson();

		response.setContentType("application/json; charset=UTF-8");

		try {
			gson.toJson(pcList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	@RequestMapping("/insertComment")
	public String insertComment(PostComment pc, HttpSession session, HttpServletRequest request) {

		int result = pcService.insertComment(pc);
		
		if(result > 0) {
			session.setAttribute("redirectModalPostId", pc.getPostId());
			return "redirect:" + request.getHeader("Referer");
		} else {
			session.setAttribute("alertMsg", "댓글작성에 실패했습니다.");
			return "redirect:/";
		}
	}

}
