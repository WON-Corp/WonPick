<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 폰트 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900&display=swap"
	rel="stylesheet">

<!-- 아이콘 링크 -->
<script type="module"
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<title>WonPick</title>
<style>




/* 안쪽 content 스타일 */
.alram {
	width: 100%;
	height: 850px;
	margin: 30px auto;
	background-color: #ffffff;
	padding: 10%;
	border: 1px solid #ddd;
	border-radius: 10px;
	line-height: 40px;
}

.title {
	font-size: 24px;
	font-weight: bold;
	color: #333;
	margin-bottom: 20px;
}

.description {
	font-size: 14px;
	color: #666;
	margin-bottom: 30px;
	width: 100%;
}

.info-block {
	display: flex;
	justify-content: space-between;
	padding: 15px;
	border: 1px solid #ddd;
	border-radius: 10px;
	background-color: #fff;
	margin-bottom: 20px;
}

.info-block div {
	font-size: 16px;
	font-weight: 500;
	color: #333;
}

.info-block a {
	color: #007bff;
	text-decoration: none;
	font-weight: bold;
}

.info-block a:hover {
	text-decoration: underline;
}

.footer-text {
	font-size: 12px;
	color: #999;
	margin-top: 30px;
}


</style>
</head>

<body>
	<% if (session.getAttribute("loginUser") == null) {%>
	<script>
			onload() = function() {
				location.href = "/wonPick/views/wonPickLogin.jsp"
			}
		</script>
	<% } %>



	<%@ include file="../common/menuBar.jsp" %>

	<div class="content">
		<div class="alram">
			<div class="title">개인정보</div>

			<!-- 개인정보 설명 -->
			<div class="description">
				<p>WONPICK은 회원님의 신원을 확인하고 커뮤니티를 안전하게 유지하기 위해 이 정보를 사용합니다.</p>
			</div>

			<!-- 연락처 정보 -->
			<div class="info-block">
				<div>연락처 정보</div>
				<div>#</div>
			</div>

			<!-- 생일 정보 -->
			<div class="info-block">
				<div>생일</div>
				<div>#</div>
			</div>

			<!-- 신원 확인 -->
			<div class="info-block">
				<div>신원 확인</div>
				<a href="#">#</a> <span class="icon">🔒</span>
			</div>

			<!-- 계정 소유권 및 관리 -->
			<div class="footer-text">
				계정 소유권 및 관리 <br> 데이터 관리, 기념 계정 관리자 수정, 계정 및 프로필 비활성화 또는 삭제 등의
				기능을 이용할 수 있습니다.
			</div>
		</div>
	</div>

	<jsp:include page="../common/optionSideBar.jsp"/>

</body>

</html>