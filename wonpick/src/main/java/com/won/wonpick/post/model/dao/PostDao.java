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
	public ArrayList<Post> selectSaveList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("postMapper.selectSaveList", userId);
	}

	public ArrayList<Post> searchPostList(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("postMapper.searchPostList", keyword);
	}
	
	/* 관리자 포스트 수정/삭제 기능 */

	public int deletePost(SqlSessionTemplate sqlSession, Post p) {
		
		return sqlSession.update("postMapper.deletePost", p);
	}
	
	public int updatePost(SqlSessionTemplate sqlSession, Post post) {
	    return sqlSession.update("postMapper.updatePost", post);
	}

   /* 마이페이지 화면 포스트 출력 기능 */
	public ArrayList<Post> selectProfilePostList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("postMapper.selectProfilePostList", userId);
	}

}
