package com.won.wonpick.member.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import com.won.wonpick.member.model.dao.MemberDao;
import com.won.wonpick.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService{
	
	private final SqlSessionTemplate sqlSession;
	private final MemberDao mDao;

	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}

	@Override
	public int idCheck(String id) {
		return mDao.idCheck(sqlSession, id);
	}

	@Override
	public Member updateMember(Member m) {
		int result = mDao.updateMember(sqlSession, m);
		if(result>0) {
			return mDao.loginMember(sqlSession, m);
		}else {
			return null;
		}
		
	}
	@Override
	public Member updateProfile(Member m) {
		int result = mDao.updateProfile(sqlSession, m);
		if(result>0) {
			return mDao.loginMember(sqlSession, m);
		}else {
			return null;
		}
		
	}

	@Override
	public int deleteMember(String id, String pwd) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public String findId(Member m) {
		return mDao.findId(sqlSession, m);
	}

	@Override
	public int changePwdUser(Member m) {
		return mDao.changePwdUser(sqlSession, m);
	}

	@Override
	public int changePassword(Member m) {
		return mDao.changePassword(sqlSession, m);
	}

	@Override
	public Member getMemberById(String userId) {
		return mDao.selectMemberById(sqlSession, userId);
	}

	@Override
	public ArrayList<Member> recentPostMember() {
		return  mDao.recentPostMember(sqlSession);
	}

}
