<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>탈퇴 회원 관리</title>
    <style>
        /* 테이블 스타일 */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
            text-align: center;
        }

        th, td {
            padding: 12px;
        }

        th {
            background-color: #f2f2f2;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .action-btn {
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        .delete-btn {
            background-color: #f44336;
        }

        .action-btn:hover {
            opacity: 0.8;
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

<%@ include file="../common/adminSideBar.jsp" %>
<div class="content">
    <div class="admin-page">
        <h1>탈퇴 회원 관리</h1>

        <!-- 탈퇴 회원 테이블 -->
        <table id="withdrawnUserTable">
            <thead>
                <tr>
                    <th>회원 ID</th>
                    <th>이름</th>
                    <th>닉네임</th>
                    <th>상태</th>

                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${withdrawnUserList}">
                    <tr id="row-${user.userId}">
                        <td>${user.userId}</td>
				        <td>${user.userName}</td>
				        <td>${user.nickName}</td>
				        <td>${user.status}</td>

                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</div>


</body>
</html>
