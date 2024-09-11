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
		
		session.setAttribute("list", bLIst);
		
		return "redirect:/";
	}

}
