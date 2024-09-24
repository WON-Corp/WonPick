package com.won.wonpick.postLike.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.won.wonpick.postLike.model.vo.PostLike;
import com.won.wonpick.postLike.service.PostLikeService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/postLike")
public class PostLikeController {

	private final PostLikeService plService;
	@ResponseBody
	@RequestMapping("/postLikeCount")
	public int postLikeCount(int postId, HttpServletResponse response) {

		int result = plService.postLikeCount(postId);
		
		return result;
		
	}
	
	@ResponseBody
	@RequestMapping("/insertPostLike")
	public String insertPostLike(PostLike pl, HttpServletResponse response) {

		int count = plService.selectUserPostLike(pl);
		
		if(count == 0) {
             plService.userPostLike(pl);
			return "Success";
		}else {
			plService.deletePostLike(pl);
			
			return "Failed";
		}
	
	}
	
	@ResponseBody
	@RequestMapping("/selectLike")
	public String selectPostLike(PostLike pl) {
		
		int count = plService.selectUserPostLike(pl);
		
		if(count == 0) {
			return "no";
		}else {
			return "yes";
		}
		
	}
}
