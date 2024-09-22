package com.won.wonpick.post.service;

import java.util.ArrayList;
import java.util.List;

import com.won.wonpick.post.model.vo.Post;

public interface PostService {


	int insertBoard(Post p);

	Post postDetail(int postId);

	ArrayList<Post> selectList();
	
	ArrayList<Post> selectSaveList();

	ArrayList<Post> searchPostList(String keyword);

	List<Post> getAllPosts();
	
    int updatePost(Post post);
    
    int deletePost(int postId);
	
	int updateCount(int postId);
}
