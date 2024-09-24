package com.won.wonpick.admin.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.won.wonpick.errorPost.model.vo.ErrorPost;
import com.won.wonpick.member.model.vo.Member;
import com.won.wonpick.post.model.vo.Post;

@Repository
public class AdminDao {

    public int getTotalMemberCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.getTotalMemberCount");
    }

    public int getTotalPostCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.getTotalPostCount");
    }

    public int getUnresolvedReportCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.getUnresolvedReportCount");
    }

    public int getThisMonthWithdrawnUserCount(SqlSessionTemplate sqlSession) {
        return sqlSession.selectOne("adminMapper.getThisMonthWithdrawnUserCount");
    }

    public List<Member> getAllMembers(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("adminMapper.getAllMembers");
    }

    public int updateMember(SqlSessionTemplate sqlSession, Member member) {
        return sqlSession.update("adminMapper.updateMember", member);
    }

    public int deleteUser(SqlSessionTemplate sqlSession, String id) {
        return sqlSession.update("adminMapper.deleteUser", id);
    }
    
    public List<Post> getAllPosts(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("adminMapper.getAllPosts");
    }

    public int updatePost(SqlSessionTemplate sqlSession, Post post) {
        return sqlSession.update("adminMapper.updatePost", post);
    }

    public int deletePost(SqlSessionTemplate sqlSession, int postId) {
        return sqlSession.update("adminMapper.deletePost", postId);
    }
    
    public List<ErrorPost> getAllReports(SqlSessionTemplate sqlSession) {
        return sqlSession.selectList("errorPostMapper.selectErrorPostList");
    }
    
    public int respondToReport(SqlSessionTemplate sqlSession, ErrorPost errorPost) {
        return sqlSession.update("adminMapper.respondToReport", errorPost);
    }

    public int deleteReport(SqlSessionTemplate sqlSession, int errorPostId) {
        return sqlSession.delete("adminMapper.deleteReport", errorPostId);
    }


	public List<Member> getWithdrawnMembers(SqlSessionTemplate sqlSession) {
		return sqlSession.selectList("adminMapper.getWithdrawnMembers");
	}

	public String getPhoneNumber(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("adminMapper.getPhoneNumber", userId);
	}


}

