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
	.content {
		margin-right: 0px;
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

textarea {
	width: 100%;
	height: 200px;
	border-radius: 20px;
	background-color: #f0f0f0;
	border: 0px;
	padding: 20px;
	border: none;
	resize: none;
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

	<div class="content">
		<div class="profile-header">
			<div class="strong"
				onclick="location.href='<%=request.getContextPath()%>/myProfile.me'">
				<strong>프로필 편집</strong>
			</div>
			<div class="profile-body">

				<div class="upload-img">
					<button type="button" class="profile-edit">
						<img src="resources/uploadImgs/wonpick-20240913174846899.jpg"
							onerror="src='resources/uploadImgs/wonpick-20240913174846899.jpg" class="chat-profile">
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
	<%--<%@ include file="../common/optionSideBar.jsp" %> --%>
	<jsp:include page="../common/optionSideBar.jsp"/>



</body>

</html>