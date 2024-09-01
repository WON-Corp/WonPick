package com.kh.wonPick.view;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.wonPick.controller.MemberController;
import com.kh.wonPick.model.Member;

/**
 * Servlet implementation class login
 */
@WebServlet("/main")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		
		int m = new MemberController().logIn((String)userId, (String)userPw);
		
		if (m == 0) {
			request.getRequestDispatcher("views/login_fail.jsp").forward(request, response);
		} else {
			
			request.getRequestDispatcher("views/wonPickMain.jsp").forward(request, response);
			request.setAttribute("userId", userId);
			request.setAttribute("userPw", userPw);
			
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
