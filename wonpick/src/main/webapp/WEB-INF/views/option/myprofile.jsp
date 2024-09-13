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

@media all and (min-width:0px) and (max-width:1100px) {
	.sidebar-message {
		display: none;
	}
	.myprofile {
		display: none;
	}
	.right-menubar {
		display: none;
	}


	/* 내 프로필 수정 스타일 */
}

.profile-header {
	width: 100%;
	height: 850px;
	margin: 30px auto;
	background-color: #ffffff;
	padding: 0 10%;
	border: 1px solid #ddd;
	border-radius: 10px;
}

.profile-edit {
	width: 100px;
	height: 100px;
	border: 1px solid #ddd;
	border-radius: 50%;
	margin: 20px;
}

.profile-body {
	background-color: #f0f0f0;
	display: flex;
	height: 150px;
	border-radius: 50px;
}

.profile-middle {
	padding: 10px;
	line-height: 35px;
}

.chage-img {
	float: left;
	background-color: black;
	color: white;
	margin-top: 45px;
	border-radius: 30px;
	width: 100px;
	height: 50px;
}

.chage-img:active {
	box-shadow: inset -.3rem -.1rem 1.4rem #8888, inset .3rem .4rem .8rem
		#8888;
	cursor: pointer;
}

.soge-field {
	height: 100px;
	margin-top: 30px;
	border-radius: 30px;
}

strong {
	font-size: x-large;
}

.soge {
	margin-top: 30px;
}

.strong {
	margin: 50px 0px;
}

.upload-img {
	height: 100%;
}

.frofile-middle {
	width: 100%;
	height: 100%;
	padding-top: 45px;
}

.chage-pro {
	padding-right: 20px;
	height: 100%;
}

textarea{
	width: 100%;
	height: 100px;
	border-radius: 20px;
	background-color: #f0f0f0;
	padding: 20px;
	font-size: 17px;
	
}

.comment_length {
	margin-left: calc(100% - 80px);
}

.save-info {
	margin-top: 30px;
	float: right;
	background-color: black;
	color: #fff;
	border: none;
	border-radius: 10px;
	padding: 15px;
	min-height: 30px;
	min-width: 120px;
	cursor: pointer;
}

.save-info:active {
	box-shadow: inset -.3rem -.1rem 1.4rem #8888, inset .3rem .4rem .8rem
		#8888;
	cursor: pointer;
}

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
	.container{
 			flex: 1;
            margin-left: 120px;
            margin-right: 330px;
            padding: 20px;
            transition: margin-left 0.4s, margin-right 0.4s;
	}
	.comment-content{
	border : none;
	resize : none;
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

	<%@ include file="../common/menuBar.jsp"  %>

	<div class="container">
		<div class="profile-header">
			<div class="strong"
				onclick="location.href='<%=request.getContextPath()%>/myProfile.me'">
				<strong>내 정보</strong>
			</div>
			<div class="profile-body">

				<div class="upload-img">
					<button type="button" class="profile-edit">
						<img src="resources/profile01.png"
							onerror="src='resources/logo.jpg'" > class="chat-profile">
					</button>
				</div>
				<div class="frofile-middle">
					<c:if test="${loginUser.nickName == null }">
					<c:when>
					<b></b><br>
					</c:when>
					<c:otherwise>
					<b>${loginUser.nickName}</b><br>
					</c:otherwise>
					</c:if>
					<p>${longinUser.userid }</p>
				</div>
				<div class="chage-pro">
					<button type="button" class="chage-img">사진변경</button>
				</div>
			</div>
			<div class="strong">
				<strong>소 개</strong>
			</div>
			<div class="soge-field">

				<textarea name="소개" id="소개" maxlength="200" class="comment-content"></textarea>
				<span class="comment_length">0</span> / 200 <br>
				<button type="submit" class="save-info">저장</button>
				
			</div>
		</div>
	</div>
	<div class="right-div">
		<ul class="right-menubar">
			<li><a  href="<%= contextPath %>/member/editprofile"><ion-icon name="person-outline"></ion-icon> 
			<span class="text">프로필 편집</span></a></li>
			<li><a href="<%= contextPath %>/#/#"><ion-icon name="notifications-outline"></ion-icon> 
			<span class="text">저장 목록</span></a></li>
			<li><a href="<%= contextPath %>/#/#"><ion-icon name="bookmark-outline"></ion-icon> 
			<span class="text">알림 설정</span></a></li>
			<li><a href="<%= contextPath %>/#/#"><ion-icon name="lock-closed-outline"></ion-icon>
			<span class="text">정보수정</span></a></li>
		</ul>
	</div>



</body>

</html>