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

@WebServlet("/findId.me")
public class FindIdServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FindIdServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("views/member/findId.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String userName = request.getParameter("userName");
        String email = request.getParameter("email");

        // 디버깅 메시지 추가
        System.out.println("Received userName: " + userName + ", email: " + email);

        MemberService memberService = new MemberService();
        Member m = memberService.findMemberById(userName, email);

        if (m != null) {
            // 아이디를 찾았을 경우
            HttpSession session = request.getSession();
            session.setAttribute("userId", m.getUserId());

            // 디버깅 메시지 추가
            System.out.println("User found: " + m.getUserId());
            
            request.getRequestDispatcher("views/member/findIdResult.jsp").forward(request, response);
        } else {
            // 아이디를 찾지 못했을 경우
            System.out.println("User not found with the given information.");
            request.setAttribute("errorMsg", "입력한 정보에 해당하는 아이디가 없습니다.");
            request.getRequestDispatcher("views/member/findId.jsp").forward(request, response);
        }
    }
}
