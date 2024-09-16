package com.won.wonpick.post.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
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

	@RequestMapping("/postDetail")
	public void postDetail(int postId, HttpServletResponse response, HttpSession session) {

		Post postDetail = pService.postDetail(postId);

		Gson gson = new Gson();

		response.setContentType("application/json; charset=UTF-8");

		try {
			gson.toJson(postDetail, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

//		pService.updateCount(postId);  --> 현재 이 코드 추가시 31번 게시글 불러오기가 안됨.........살려주세요

	}

	@RequestMapping("/selectVideoList")
	public String videoLlist(HttpSession session) {
		ArrayList<Post> bLIst = pService.selectList();
		session.setAttribute("list", bLIst);

		return "redirect:/post/videoPostList";
	}

	@RequestMapping("/insert")
	public String insertPost(Post p, MultipartFile uploadImg, HttpSession session) {

		if (!uploadImg.getOriginalFilename().isEmpty()) {
			String site = "wonpick-";
			String currTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
			int random = (int) (Math.random() * 999 - 100 + 1) + 100;
			String ext = uploadImg.getOriginalFilename().substring(uploadImg.getOriginalFilename().lastIndexOf("."));

			String imgFileName = site + currTime + random + ext;

			String path = session.getServletContext().getRealPath("/resources/uploadImgs/");

			try {
				uploadImg.transferTo(new File(path + imgFileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

			p.setImgFile("/wonpick/resources/uploadImgs/" + imgFileName);

		}

		int result = pService.insertBoard(p);

		if (result > 0) { // 게시글 등록 성공
			session.setAttribute("alertMsg", "게시글 등록 성공");

			// 게시글 목록 페이지로 url 재요청
			return "redirect:/";

		} else { // 게시글 등록 실패
			session.setAttribute("alertMsg", "게시글 등록 실패");

			return "redirect:/";
		}

	}

	@RequestMapping("/videoPostList")
	public String videoPostList() {
		return "board/videoList";
	}
}
