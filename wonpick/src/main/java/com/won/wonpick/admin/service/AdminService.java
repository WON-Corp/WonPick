package com.won.wonpick.admin.service;

import java.util.List;
import com.won.wonpick.member.model.vo.Member;

public interface AdminService {
	
	 int getTotalMemberCount();
	 
	 List<Member> getWithdrawnMembers();
	    
	 List<Member> getAllMembers();
    
}
