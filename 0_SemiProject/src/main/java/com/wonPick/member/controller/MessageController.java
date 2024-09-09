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
 * Servlet implementation class MessageController
 */
@WebServlet("/message.me")
public class MessageController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MessageController() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String userId = request.getParameter("userId");
        String messageContent = request.getParameter("messageContent");

        int result = new MemberService().sendMessage(userId, messageContent);

        HttpSession session = request.getSession();


        request.getRequestDispatcher("views/member/massage.jsp").forward(request, response);
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}