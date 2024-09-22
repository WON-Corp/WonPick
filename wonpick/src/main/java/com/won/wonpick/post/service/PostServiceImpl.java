package com.won.wonpick.post.service;

import java.util.ArrayList;
import java.util.List;

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

	@Override
	public int updateCount(int postId) {
		return pDao.updateCount(sqlSession, postId);
	}

	@Override
	public Post postDetail(int postId) {
		return  pDao.postDetail(sqlSession, postId);
	}
	
	@Override
	public ArrayList<Post> selectSaveList() {
		return pDao.selectSaveList(sqlSession);
	}

	@Override
	public ArrayList<Post> searchPostList(String keyword) {
		return pDao.searchPostList(sqlSession, keyword);
	}
	
    @Override
    public List<Post> getAllPosts() {
        return pDao.selectList(sqlSession);
    }

    @Override
    public int updatePost(Post post) {
        return pDao.updatePost(sqlSession, post);
    }

    @Override
    public int deletePost(int postId) {
        return pDao.deletePost(sqlSession, postId);
    }
}
