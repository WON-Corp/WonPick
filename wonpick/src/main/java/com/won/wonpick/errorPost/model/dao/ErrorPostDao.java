package com.won.wonpick.errorPost.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.won.wonpick.errorPost.model.vo.ErrorPost;

@Repository	
public class ErrorPostDao {

	public int insertError(SqlSessionTemplate sqlSession, ErrorPost ep) {
		return sqlSession.insert("errorPostMapper.insertErrorPost", ep);
	}

	public ArrayList<ErrorPost> selectErrorPostList(SqlSessionTemplate sqlSession, ErrorPost ep) {
		return (ArrayList)sqlSession.selectList("errorPostMapper.selectErrorPostList", ep);
	}

}
