package com.won.wonpick.post.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.won.wonpick.post.model.vo.Post;

@Repository	
public class PostDao {

	public ArrayList<Post> selectList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("postMapper.selectList");
	}

	public int insertBoard(SqlSessionTemplate sqlSession, Post p) {
		return sqlSession.insert("postMapper.insertBoard", p);
	}

}
