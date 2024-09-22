<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <title>회원 정보 관리</title>
    <style>
    
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
        <h1>회원 정보 관리</h1>

        <!-- 회원 정보 테이블 -->
        <table id="userTable">
            <thead>
                <tr>
                    <th>회원 ID</th>
                    <th>이름</th>
                    <th>닉네임</th>
                    <th>상태</th>
                    <th>관리자 기능</th>
                </tr>
            </thead>
            <tbody>
			    <c:forEach var="user" items="${userList}">
			        <tr id="row-${user.userId}">
			            <td id="id-${user.userId}">${user.userId}</td>
			            <td id="name-${user.userId}">${user.userName}</td>
			            <td id="nickname-${user.userId}">${user.nickName}</td>
			            <td id="status-${user.userId}">${user.status}</td>
			            <td>
			                <button class="action-btn" onclick="editUser('${user.userId}')">수정</button>
			                <button class="action-btn save-btn" id="save-${user.userId}" style="display:none;" onclick="saveUser('${user.userId}')">저장</button>
			                <button class="action-btn delete-btn" onclick="confirmDelete('${user.userId}')">삭제</button>
			            </td>
			        </tr>
			    </c:forEach>
			</tbody>
        </table>
    </div>
</div>

<script>
function editUser(userId) {
    $("#name-" + userId).html('<input type="text" value="' + $("#name-" + userId).text() + '" />');
    $("#nickname-" + userId).html('<input type="text" value="' + $("#nickname-" + userId).text() + '" />');
    $("#status-" + userId).html('<input type="text" value="' + $("#status-" + userId).text() + '" />');
    
    // 수정 버튼을 숨기고 저장 버튼을 표시
    $("#save-" + userId).show();
}

function saveUser(userId) {
    let userData = {
        userId: $("#id-" + userId).text(),
        userName: $("#name-" + userId + " input").val(),
        nickName: $("#nickname-" + userId + " input").val(),
        status: $("#status-" + userId + " input").val()
    };

    $.ajax({
        url: '/wonpick/admin/updateUser',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(userData),
        success: function(response) {
            alert("회원 정보가 수정되었습니다.");
            
            $("#name-" + userId).html(userData.userName);
            $("#nickname-" + userId).html(userData.nickName);
            $("#status-" + userId).html(userData.status);
            
            // 저장 버튼을 숨기기
            $("#save-" + userId).hide();
        },
        error: function(err) {
            console.error(err);
            alert("회원 정보 수정에 실패했습니다.");
        }
    });
}


    function confirmDelete(userId) {
        if (confirm("정말로 이 사용자를 삭제하시겠습니까?")) {
            window.location.href = '/wonpick/admin/deleteUser?id=' + userId;
        }
    }
</script>


</body>
</html>
