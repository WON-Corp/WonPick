package com.won.wonpick.admin.service;

import java.util.List;

import com.won.wonpick.errorPost.model.vo.ErrorPost;
import com.won.wonpick.member.model.vo.Member;

public interface AdminService {
	
	public int getTotalMemberCount();
	 
	 List<Member> getWithdrawnMembers();
	    
	 List<Member> getAllMembers();

	int updateMember(Member member);

	int deleteUser(String id);

	List<ErrorPost> getAllReports();

	int respondToReport(ErrorPost errorPost);

	String getPhoneNumber(String userId);

	int deleteReport(int errorPostId);

	int getTotalPostCount();

	int getUnresolvedReportCount();

	int getThisMonthWithdrawnUserCount();
    
}
