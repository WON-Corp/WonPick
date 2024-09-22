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

	public Post postDetail(SqlSessionTemplate sqlSession, int postId) {
		return sqlSession.selectOne("postMapper.postDetail", postId);
	}

	public int updateCount(SqlSessionTemplate sqlSession, int postId) {
		return sqlSession.update("postMapper.updateCount", postId);
	}
	public ArrayList<Post> selectSaveList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("postMapper.selectSaveList");
	}

	public ArrayList<Post> searchPostList(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("postMapper.searchPostList", keyword);
	}

	public ArrayList<Post> selectProfilePostList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("postMapper.selectProfilePostList", userId);
	}
}
