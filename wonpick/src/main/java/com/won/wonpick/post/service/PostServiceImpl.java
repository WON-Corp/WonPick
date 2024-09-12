package com.won.wonpick.post.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.won.wonpick.post.model.dao.PostDao;
import com.won.wonpick.post.model.vo.Post;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class PostServiceImpl implements PostService {
	
	private final SqlSessionTemplate sqlSession;
	private final PostDao pDao;
	

	@Override
	public ArrayList<Post> selectList() {
		return pDao.selectList(sqlSession);
	}


	@Override
	public int insertBoard(Post p) {
		return pDao.insertBoard(sqlSession, p);
	}

}
