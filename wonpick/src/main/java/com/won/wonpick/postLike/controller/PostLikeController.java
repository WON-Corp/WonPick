package com.won.wonpick.postLike.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

	@RequestMapping("/insertPostLike")
	public void insertPostLike(PostLike pl, HttpServletResponse response) {

		int userPL = plService.userPostLike(pl);

		System.out.println(userPL);
	}
}
