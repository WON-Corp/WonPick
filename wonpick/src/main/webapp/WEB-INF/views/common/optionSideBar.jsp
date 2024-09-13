<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 오른쪽 메뉴바 스타일 */
.right-div {
	width: 14%;
	display: flex;
	justify-content: flex-start;
}

.right-menubar {
	width: 100%;
	margin-top: 70px;
	list-style: none;
	padding: 0;
}

.right-menubar li {
	padding: 15px 20px;
	margin-bottom: 15px;
	border-radius: 10px;
	font-size: 18px;
	cursor: pointer;
	display: flex;
	align-items: center;
}

.right-menubar li:hover {
	background-color: #e0e0e0;
	transition: all 0.4s;
}

.right-menubar li ion-icon {
	font-size: 28px;
	margin-right: 15px;
	color: #333;
}

.right-menubar li .text {
	font-size: 16px;
	color: #333;
}
.right-div ul li a{
 text-decoration: none;
 width:100%;
 }
</style>
</head>
<body>
<%
	String contextPath = request.getContextPath();
	
	
	
    %>
<div class="right-div">

		<ul class="right-menubar">
			<li><a type="button" href="<%= contextPath %>/myprofile/profile"><ion-icon name="person-outline"></ion-icon>
			<span class="text">내 정보</span></a></li>
			<li><a  type="button" href="<%= contextPath %>/member/editprofile"><ion-icon name="person-outline"></ion-icon>
			<span class="text">프로필 편집</span></a></li>
			<li><a type="button" href="<%= contextPath %>/#/#"><ion-icon name="notifications-outline"></ion-icon>
			<span class="text">저장 목록</span></a></li>
			<li><a type="button" href="<%= contextPath %>/#/#"><ion-icon name="bookmark-outline"></ion-icon>
			<span class="text">알림 설정</span></a></li>
			<li><a type="button" href="<%= contextPath %>/#/#"><ion-icon name="lock-closed-outline"></ion-icon>
			<span class="text">정보 수정</span></a></li>
		</ul>
</div>
	
</body>
</html>