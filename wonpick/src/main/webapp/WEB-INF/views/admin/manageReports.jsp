<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <title>문제 신고 관리</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        table, th, td {
            border: 1px solid #ddd;
        }
        
        th, td {
            padding: 12px;
            text-align: center;
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
    <h1>문제 신고 관리</h1>
	
<table id="reportTable">
    <thead>
        <tr>
 			<th>문제 신고 번호</th>
            <th>문의 제목</th>
            <th>문의 내용</th>
            <th>글쓴이 ID</th>
            <th>작성일</th>
            <th>관리 기능</th>
            <th>답변 상태</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="report" items="${reportList}">
            <tr id="row-${report.errorPostId}">
                <td>${report.errorPostId}</td>
                <td>${report.errorPostTitle}</td>
                <td>${report.errorContent}</td>
                <td>${report.userId}</td>
                <td>${report.postingDate}</td>
				<td>
				<c:choose>
				    <c:when test="${report.responsed eq 'Y'}">
				        답변 완료
				    </c:when>
				    <c:otherwise>
				        <button class="action-btn" onclick="respondReport('${report.errorPostId}','${report.userId}')">답변</button>
				        <button class="action-btn delete-btn" onclick="confirmDelete('${report.errorPostId}')">삭제</button>
				    </c:otherwise>
				</c:choose>
				</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>

    <script>
    function respondReport(errorPostId, userId) {
        const answer = confirm("문제신고에 답변하시겠습니까?");
        if (answer) {
            const postData = {
                errorPostId: errorPostId,
                userId: userId
            };
            

            $.ajax({
                url: "/wonpick/admin/respondReport",
                type: "POST",
                data: JSON.stringify(postData),
                contentType: "application/json",
                success: function(response) {
                	location.href = "sms:"+response+"?body=문제신고 답변입니다!";
                    location.reload();
                },
                error: function(err) {
                    console.error(err);
                    alert("답변 등록에 실패했습니다.");
                }
            });
        }
    }

    function confirmDelete(errorPostId) {
        if (confirm("이 신고를 삭제하시겠습니까?")) {
            window.location.href = '/wonpick/admin/deleteReport?errorPostId=' + errorPostId;
        }
    }
</script>


</body>
</html>
