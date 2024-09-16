package com.won.wonpick.postComment.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.won.wonpick.postComment.model.vo.PostComment;

@Repository	
public class PostCommentDao {

	public int postCommentCount(SqlSessionTemplate sqlSession, int postId) {
		return sqlSession.selectOne("postCommentMapper.postCommentCount", postId);
	}

	public ArrayList<PostComment> postCommentList(SqlSessionTemplate sqlSession, int postId) {
		return (ArrayList)sqlSession.selectList("postCommentMapper.postCommentList", postId);
	}
	
	

}
