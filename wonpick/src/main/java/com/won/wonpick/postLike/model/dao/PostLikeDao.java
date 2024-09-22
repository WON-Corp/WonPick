package com.won.wonpick.postLike.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.won.wonpick.postLike.model.vo.PostLike;

@Repository	
public class PostLikeDao {

	public int postLikeCount(SqlSessionTemplate sqlSession, int postId) {
		return sqlSession.selectOne("postLikeMapper.postLikeCount", postId);
	}

	public int userPostLike(SqlSessionTemplate sqlSession, PostLike pl) {
		sqlSession.insert("postLikeMapper.insertPostLikeAlert", pl);
		return sqlSession.insert("postLikeMapper.insertPostLike", pl);
	}
	
	public int deletePostLike(SqlSessionTemplate sqlSession, PostLike pl) {
		return sqlSession.delete("postLikeMapper.deletePostLike" , pl);
	}
	public int selectUserPostLike(SqlSessionTemplate sqlSession, PostLike pl) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("postLikeMapper.userPostLike", pl);
	}

}
