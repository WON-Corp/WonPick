package com.kh.wonPick.controller;

import java.util.ArrayList;

import com.kh.wonPick.model.Member;
import com.kh.wonPick.model.dao.MemberDAO;

public class MemberController {

	public int logIn(String userId, String userPw) {
		ArrayList<Member> list = new MemberDAO().fileRead();

		// 조회된 결과에 따라 사용자에게 결과 표시
		if (list.isEmpty()) {
			return 0;
		} else {
			
			for (Member m:list) {

				if (m.getUserId().equals(userId) && m.getUserPw().equals(userPw)) {
					return 1;
				};
			}
			return 0;
		}
	}

}
