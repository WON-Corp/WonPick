package com.won.wonpick.postLike.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.won.wonpick.postLike.model.dao.PostLikeDao;
import com.won.wonpick.postLike.model.vo.PostLike;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PostLikeServiceImpl implements PostLikeService {
	
	private final SqlSessionTemplate sqlSession;
	private final PostLikeDao plDao;
	
	
	@Override
	public int postLikeCount(int postId) {
		return plDao.postLikeCount(sqlSession, postId);
	}


	@Override
	public int userPostLike(PostLike pl) {
		return plDao.userPostLike(sqlSession, pl);
	}


}
