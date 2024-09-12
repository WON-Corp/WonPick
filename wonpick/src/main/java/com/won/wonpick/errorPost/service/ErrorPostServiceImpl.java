package com.won.wonpick.errorPost.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.won.wonpick.errorPost.model.dao.ErrorPostDao;
import com.won.wonpick.errorPost.model.vo.ErrorPost;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ErrorPostServiceImpl implements ErrorPostService {
	
	private final SqlSessionTemplate sqlSession;
	private final ErrorPostDao epDao;
	
	@Override
	public int insertError(ErrorPost ep) {
		return epDao.insertError(sqlSession, ep);
	}

	@Override
	public ArrayList<ErrorPost> selectErrorPostList(ErrorPost ep) {
		return epDao.selectErrorPostList(sqlSession, ep);
	}

}
