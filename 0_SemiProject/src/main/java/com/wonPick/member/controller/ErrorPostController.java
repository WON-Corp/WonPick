package com.wonPick.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wonPick.member.model.service.MemberService;

/**
 * Servlet implementation class ErrorPostController
 */
@WebServlet("/errorPost")
public class ErrorPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ErrorPostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 요청시 전달된 데이터 추출 (아이디, 패스워드)
		String id = request.getParameter("userId");
		String epc = request.getParameter("errorPostContent");
		
		int result = new MemberService().errorPost(id, epc);
		HttpSession session = request.getSession();
		
		if(result > 0) {
			session.setAttribute("alertMsg", "문제신고에 성공하였습니다.");
			response.sendRedirect("/wonPick/views/wonPickMain.jsp");
		} else {
			session.setAttribute("alertMsg", "문제신고에 실패하였습니다.");
			response.sendRedirect("/wonPick/views/wonPickMain.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
