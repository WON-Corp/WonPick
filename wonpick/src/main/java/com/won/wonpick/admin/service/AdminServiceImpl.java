package com.won.wonpick.admin.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.won.wonpick.admin.model.dao.AdminDao;
import com.won.wonpick.errorPost.model.vo.ErrorPost;
import com.won.wonpick.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminDao adminDao;
    @Autowired
    private SqlSessionTemplate sqlSession;

    public int getTotalMemberCount() {
        return adminDao.getTotalMemberCount(sqlSession);
    }

    public int getTotalPostCount() {
        return adminDao.getTotalPostCount(sqlSession);
    }

    public int getUnresolvedReportCount() {
        return adminDao.getUnresolvedReportCount(sqlSession);
    }

    public int getThisMonthWithdrawnUserCount() {
        return adminDao.getThisMonthWithdrawnUserCount(sqlSession);
    }

    public List<Member> getAllMembers() {
        return adminDao.getAllMembers(sqlSession);
    }

    public int updateMember(Member member) {
        return adminDao.updateMember(sqlSession, member);
    }

    public int deleteUser(String id) {
        return adminDao.deleteUser(sqlSession, id);
    }
    
	public List<ErrorPost> getAllReports() {
		return adminDao.getAllReports(sqlSession);
	}

    public int respondToReport(ErrorPost errorPost) {
        return adminDao.respondToReport(sqlSession, errorPost);
    }

    public int deleteReport(int errorPostId) {
        return adminDao.deleteReport(sqlSession, errorPostId);
    }

    public List<Member> getWithdrawnMembers() {
        return adminDao.getWithdrawnMembers(sqlSession);
    }

	public String getPhoneNumber(String userId) {
		return adminDao.getPhoneNumber(sqlSession, userId);
	}

}
