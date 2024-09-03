package com.wonPick.member.model.service;

import static com.wonPick.common.JDBCTemplate.*;

import java.sql.Connection;

import com.wonPick.member.model.dao.MemberDao;
import com.wonPick.member.model.vo.Member;

public class MemberService {

	public Member loginMember(String id, String pwd) {
		
		// Connection 객체를 생성하여 Dao에게 전달
		Connection conn = getConnection();
		
		// Dao 객체에게 DB에 아이디, 비밀번호에 해당하는 데이터가 있는지 확인 요청
		Member m = new MemberDao().loginMember(conn, id, pwd);
		
		
		// Connection 객체 반납(close)
		close(conn);
		
		return m;
	}

	public int insertMember(Member m) {
		
		Connection conn = getConnection();
		
		// insert(DDL) --> int --> 트랜잭션처리(commit, rollback)
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {commit(conn);}	// 회원 데이터 추가 성공
		
		else {rollback(conn);};
		
		close(conn);
		
		return result;
	}

	public int idCheck(String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDao().idCheck(conn, userId);
		
		close(conn);
		
		return result;
	}
	
	public Member findMemberById(String userName, String email) {
        Connection conn = getConnection();
        
        Member m = new MemberDao().findMemberById(conn, userName, email);
        
        close(conn);
        
        return m;
    }

    public Member findMemberByPassword(String userName, String email) {
        Connection conn = getConnection();
        
        Member m = new MemberDao().findMemberByPassword(conn, userName, email);
        
        close(conn);
        
        return m;
    }

}
