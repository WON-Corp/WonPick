package com.won.wonpick.post.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.won.wonpick.post.model.vo.Post;
import com.won.wonpick.post.service.PostService;

@Controller
@RequestMapping("/post")
public class PostController {
	
	private final PostService pService;
	
	public PostController(PostService pService) {
		this.pService = pService;
	}
	
	@RequestMapping("/list")
	public String boardList(HttpSession session) {
		
		ArrayList<Post> bLIst = pService.selectList();
		// 데이터베이스 들어가서 각 포스팅의 id값 출력 --> 그 아이디에 따른 img파일 출력
		
		session.setAttribute("list", bLIst);
		
		return "redirect:/";
	}

}
