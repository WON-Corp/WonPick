package com.won.wonpick.postComment.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.won.wonpick.postComment.model.dao.PostCommentDao;
import com.won.wonpick.postComment.model.vo.PostComment;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PostCommentServiceImpl implements PostCommentService {
	
	private final SqlSessionTemplate sqlSession;
	private final PostCommentDao pcDao;
	
	@Override
	public int postCommentCount(int postId) {
		return pcDao.postCommentCount(sqlSession, postId);
	}

	@Override
	public ArrayList<PostComment> postCommentList(int postId) {
		return pcDao.postCommentList(sqlSession, postId);
	}

	@Override
	public int insertComment(PostComment pc) {
		return pcDao.insertComment(sqlSession, pc);
	}

}
