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

	@RequestMapping("/postLikeCount")
	public void postLikeCount(int postId, HttpServletResponse response) {

		int result = plService.postLikeCount(postId);

		if (result > 0) {
			try {
				response.getWriter().print(result);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	@ResponseBody
	@RequestMapping("/insertPostLike")
	public String insertPostLike(PostLike pl, HttpServletResponse response) {
		System.out.println(pl);
		int count = plService.selectUserPostLike(pl);
		System.out.println(count);
		if(count == 0) {
			System.out.println(plService.userPostLike(pl));
		
			return "Success";
		}else {
			System.out.println(plService.deletePostLike(pl));
			
			return "Failed";
		}
		
		
		
	}
}
