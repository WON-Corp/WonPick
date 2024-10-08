package com.won.wonpick.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.won.wonpick.member.model.vo.Member;

@Repository	
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}

	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		int result = sqlSession.insert("memberMapper.insertMember", m);
		sqlSession.insert("memberMapper.insertSetAlert", m);
		return result;
	}

	public int idCheck(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("memberMapper.idCheck", id);
	}

	public String findId(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.findId", m);
	}

	public int changePwdUser(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.changePwdUser", m);
	}

	public int changePassword(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.changePassword", m);
	}

	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateMember", m);
	}

	public int updateProfile(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("memberMapper.updateProfile", m);
	}

	public Member selectMemberById(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("memberMapper.selectMemberById", userId);
	}

	public ArrayList<Member> recentPostMember(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectRecentPost");
	}

}
