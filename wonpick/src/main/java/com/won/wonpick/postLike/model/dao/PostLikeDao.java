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
		
		int result = sqlSession.selectOne("postLikeMapper.userPostLike", pl);
		
		if(result>0) {
			return sqlSession.selectOne("postLikeMapper.insertPostLike", pl);
		} else {
			return sqlSession.selectOne("postLikeMapper.deletePostLike", pl);
		}
		
		
	}

}
