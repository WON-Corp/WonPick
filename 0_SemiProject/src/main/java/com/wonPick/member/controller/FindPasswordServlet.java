package com.wonPick.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.wonPick.member.model.service.MemberService;
import com.wonPick.member.model.vo.Member;

@WebServlet("/findPassword.me")
public class FindPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FindPasswordServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.getRequestDispatcher("views/member/findPassword.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");

        
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");

        
        MemberService memberService = new MemberService();
        Member m = memberService.findMemberByPassword(userName, email);

       
        HttpSession session = request.getSession();

        
        if (m != null) {
           
            session.setAttribute("password", m.getPassword());
            response.sendRedirect(request.getContextPath() + "/views/member/findPasswordResult.jsp");
        } else {
           
            session.setAttribute("errorMsg", "입력한 정보에 해당하는 비밀번호가 없습니다.");
            response.sendRedirect(request.getContextPath() + "/findPassword.me");
        }
    }
}
