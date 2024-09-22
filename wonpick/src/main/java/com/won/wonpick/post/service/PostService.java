package com.won.wonpick.post.service;

import java.util.ArrayList;

import com.won.wonpick.post.model.vo.Post;

public interface PostService {

	ArrayList<Post> selectList();

	int insertBoard(Post p);

	Post postDetail(int postId);

	int updateCount(int postId);
	
	ArrayList<Post> selectSaveList();

	ArrayList<Post> searchPostList(String keyword);

	ArrayList<Post> selectProfilePostList(String userId);
}
