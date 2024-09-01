package com.wonPick.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wonPick.member.model.service.MemberService;
import com.wonPick.member.model.vo.Member;

/**
 * Servlet implementation class InsertMemberController
 */
@WebServlet("/insert.me")
public class InsertMemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 데이터 추출(8개의 데이터)
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
//		String userPwdCheck = request.getParameter("userPwdCheck");	--> view에서 확인 해줘야함 
		String userName = request.getParameter("userName");
		String nickName = request.getParameter("nickName");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
//		Date birth = (Date)(request.getParameter("yy")+ "-" +request.getParameter("mm")+ "-" +request.getParameter("dd")); 생일 저거 어케받아오냐
		
		// 생일 년월일 분리된것 합쳐서 Date형으로 형변환
		String yy = request.getParameter("yy");
		String mm = request.getParameter("mm");
		String dd = request.getParameter("dd");
		String date = yy+"-"+mm+"-"+dd;
		Date birth = Date.valueOf(date);
		

		
		Member m = new Member(userId, password, userName, nickName, email, phone, gender, birth , "", "");
		
		int result = new MemberService().insertMember(m);
		
		if (result > 0) {	// 회원가입 성공
			HttpSession session = request.getSession();
			session.setAttribute("joinMsg", "회원가입 성공.");
			
			// url 재요청 (/jsp)
			response.sendRedirect(request.getContextPath());
			
		} else {		// 회원가입 실패
			HttpSession session = request.getSession();
			session.setAttribute("joinMsg", "회원가입에 실패하였습니다.");
			
			// 에러페이지로 응답 (errorPage.jsp) 페이지 포워딩
			response.sendRedirect(request.getContextPath());
		}
	}

}
