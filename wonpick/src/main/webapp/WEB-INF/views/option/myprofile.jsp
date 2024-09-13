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
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
	scroll-behavior: smooth;
}

body {
	display: flex;
	height: 100vh;
	overflow-y: auto;
}

/*navigation 스타일 시작*/
.navigation {
	position: fixed;
	width: 75px;
	background-color: #fff;
	padding: 20px;
	transition: width 0.5s;
	border-right: 1px solid #ddd;
	z-index: 99;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
	min-height: 800px;
}

.navigation.open {
	width: 250px;
	min-height: 800px;
}

.navigation .menuToggle {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 60px;
	border-bottom: 1px solid rgba(0, 0, 0, 0.25);
	cursor: pointer;
	display: flex;
	align-items: center;
	justify-content: flex-start;
	padding: 0 23px;
	box-sizing: border-box;
}

.navigation .menuToggle::before {
	content: '';
	position: absolute;
	width: 30px;
	height: 2px;
	background-color: #333;
	transform: translateY(-8px);
	transition: all 0.5s;
}

.navigation.open .menuToggle::before {
	transform: translateY(0px) rotate(45deg);
}

.navigation .menuToggle::after {
	content: '';
	position: absolute;
	width: 30px;
	height: 2px;
	background-color: #333;
	transform: translateY(8px);
	transition: all 0.5s;
	box-shadow: 0 -8px 0 #333;
}

.navigation.open .menuToggle::after {
	transform: translateY(0px) rotate(-45deg);
	box-shadow: 0 0 0 #333;
}

.navigation .logo {
	width: 55px;
	height: 55px;
	border-radius: 50%;
	transition: all 0.5s ease-in-out;
}

.navigation .logo-text {
	font-size: 14px;
	/* 텍스트 크기 조정 */
	color: #333;
	text-align: center;
	font-family: "Ubuntu", sans-serif;
	font-style: italic;
}

/* 네비게이션이 열릴 때 로고와 텍스트 표시 */
.navigation .logo-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	opacity: 0;
	visibility: hidden;
	transition: opacity 1s ease-in,
}

.navigation.open .logo {
	width: 80px;
	height: auto;
}

.navigation.open .logo-container {
	opacity: 1;
	visibility: visible;
	margin-left: 60px;
	margin-bottom: 100px;
	transition-delay: 0.3s;
	/* 로고와 텍스트 표시 0.3 초 딜레이 */
}

.navigation ul {
	display: flex;
	flex-direction: column;
	margin-top: 10px;
	gap: 10px;
	width: 100%;
}

.navigation ul li {
	list-style: none;
	position: relative;
	width: 100%;
	padding: 0 5px;
	transition: all 0.4s;
}

.navigation ul li.active {
	transform: translateX(30px);
}

.navigation ul li a {
	position: relative;
	display: flex;
	align-items: center;
	justify-content: flex-start;
	text-align: center;
	text-decoration: none;
}

.navigation ul li a .icon {
	position: relative;
	display: block;
	width: 55px;
	height: 55px;
	line-height: 55px;
	transition: all .4s;
	border-radius: 10px;
	font-size: 30px;
	color: #222;
}

/* navigation의 텍스트를 가렸다가 */
.navigation ul li a .text {
	position: relative;
	padding: 0 px;
	display: flex;
	align-items: center;
	color: #333;
	opacity: 0;
	visibility: hidden;
	transition: 0.4s;
}

/* navigation의 텍스트 보이게 함 */
.navigation.open ul li a .text {
	opacity: 1;
	visibility: visible;
}

.content {
	flex: 1;
	margin-left: 120px;
	padding: 20px;
	transition: margin-left 0.4s, margin-right 0.4s;
}

/* nav가 열릴 때 좌우 여백도 같이 줄어들음 */
.navigation.open ~.content {
	margin-left: 250px;
	transition: ease-in-out 0.4s;
}

/* 푸터 영역 */
.footer {
	position: absolute;
	bottom: 20px;
	left: 10px;
	opacity: 0;
	transition: opacity 1s ease-in;
	font-size: 12px;
	color: #666;
}

/* navigation이 열렸을 때 푸터가 보이게 함 */
.navigation.open .footer {
	opacity: 1;
	visibility: visible;
}

/* 헤더 시작*/
header {
	display: flex;
	border-radius: 15px;
	background-color: #f5f5f5;
}

/* 대화창 스타일 */
.feed {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	height: 100%;
}

.chat-header {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	padding: 15px;
	background-color: #f5f5f5;
	width: 100%;
	max-width: 1150px;
	margin: 0 auto;
}

.container {
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	height: 100%;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	padding: 10px 30px;
	margin-bottom: 20px;
}

.chat-profile {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	margin-right: 10px;
	object-fit: cover;
}

.chat-username {
	font-size: 16px;
	font-weight: 600;
}

/* 채팅 박스 스타일 */
.chat-box {
	flex: 1;
	height: 100%;
	display: flex;
	flex-direction: column;
	justify-content: flex-end;
	margin-top: 10px;
	transition: 0.4s;
}

.message-sent {
	max-width: 70%;
	margin: 10px 0;
	padding: 10px;
	border-radius: 20px;
	font-size: 14px;
	background-color: rgb(35, 59, 59);
	color: #fff;
	margin-left: auto;
}

.message-received {
	max-width: 70%;
	margin: 10px 0;
	padding: 10px;
	border-radius: 20px;
	font-size: 14px;
	background-color: #e0e0e0;
	color: #333;
	align-self: flex-start;
}

.message {
	display: flex;
	padding: 10px;
	background-color: #fff;
	border-radius: 20px;
	width: 100%;
}

.message input {
	flex: 1;
	border-radius: 20px;
	border: 1px solid #ddd;
	outline: none;
	margin-right: 10px;
	padding: 10px;
}

.message button {
	padding: 10px 20px;
	border-radius: 20px;
	background-color: rgb(35, 59, 59);
	color: #fff;
	border: none;
	cursor: pointer;
}

@media all and (max-width: 1100px) {
	.content {
		margin-right: 50px;
	}
	.message {
		width: calc(100% - 20px);
	}
}

/* 더보기 팝업 메뉴 */
.more-popup {
	position: absolute;
	display: none;
	bottom: 50px;
	left: 170px;
	transform: translateX(-50%);
	width: 200px;
	background-color: #fff;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	z-index: 100;
}

.more-popup.active {
	display: block;
}

.more-popup ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

.more-popup ul li {
	padding: 10px;
	cursor: pointer;
	display: flex;
	align-items: center;
}

.more-popup ul li:hover {
	background-color: #f0f0f0;
}

.more-popup ul li ion-icon {
	margin-right: 10px;
}

.more-popup button {
	width: 100%;
	border: none;
	background-color: #fff;
}

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

	<%
	String contextPath = request.getContextPath();		// => /jsp
	
	String alertMsg = (String)session.getAttribute("alertMsg");
    %>

	<% if (alertMsg != null) {%>
	<script>
			alert("<%= alertMsg%>");
		</script>
	<% session.removeAttribute("alertMsg"); %>
	<% } %>

	<div class="navigation">
		<div class="menuToggle"></div>

		<!-- navigation 아이콘은 https://ionic.io/ionicons 사이트 접속 후 사용함!! -->
		<ul>
			<!--  로고 및 텍스트 -->
			<li class="list"><a href="Main.html">
					<div class="logo-container">
						<img src="resources/logo.jpg" alt="WonPick 로고" class="logo">
						<p class="logo-text">WonPick</p>
					</div>
			</a> <!-- list 로고 끝 --></li>
			<li class="list"><a href="Main.html"> <span class="icon">
						<ion-icon name="home-outline"></ion-icon>
				</span> <span class="text">홈</span>
			</a></li>
			<li class="list"><a href="#"> <span class="icon"> <ion-icon
							name="search-outline"></ion-icon>
				</span> <span class="text">검색</span>
			</a></li>
			<li class="list"><a href="#"> <span class="icon"> <ion-icon
							name="caret-forward-circle-outline"></ion-icon>
				</span> <span class="text">릴스</span>
			</a></li>
			<li class="list">
			<li class="list"><a
				href="<%= request.getContextPath() %>/message.me"> <span
					class="icon"> <ion-icon name="chatbubble-outline"></ion-icon>
				</span> <span class="text">메시지</span>
			</a></li>
			</li>
			<li class="list"><a href="#"> <span class="icon"> <ion-icon
							name="heart-outline"></ion-icon>
				</span> <span class="text">알림</span>
			</a></li>
			<li class="list"><a href="#"> <span class="icon"> <ion-icon
							name="color-wand-outline"></ion-icon>
				</span> <span class="text">만들기</span>
			</a></li>

			<li class="list"><a href="#" id="more-btn"> <span
					class="icon"> <ion-icon name="add-circle-outline"></ion-icon>
				</span> <span class="text">더보기</span>
			</a></li>
		</ul>

		<div class="footer">
			<p>© 2024 WonPick. All Rights Reserved.</p>
		</div>
	</div>

	<div class="more-popup" id="more-popup">
		<ul>
			<li><ion-icon name="settings-outline"></ion-icon> 설정</li>
			<li><ion-icon name="images-outline"></ion-icon> 내 활동</li>
			<li><ion-icon name="moon-outline"></ion-icon> 모드 전환</li>
			<button type="button" id="errorPost" data-toggle="modal"
				data-target="#errorPostModal">
				<li><ion-icon name="warning-outline"></ion-icon>문제 신고</li>
			</button>
			<button type="button" onclick="userLogout()">
				<li><ion-icon name="log-out-outline"></ion-icon> 로그아웃</li>
			</button>
		</ul>
	</div>
	<!-- 문제신고 페이지 모달 -->
	<div class="modal fade" id="errorPostModal" tabindex="-1"
		aria-labelledby="errorPostModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 모달 헤더 부분 -->
				<div class="modal-header">
					<img src="../resources/logo.jpg" alt=""
						style="border-radius: 15px; width: 45px;">
					<h2 class="modal-title fs-5" id="errorPostModalLabel">&nbsp;문제신고</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">&times;</button>
				</div>
				<!-- 모달 바디 부분 -->
				<div class="modal-body">
					<form action="errorPost" method="post">
						<!-- 폼태그 액션속성 수정 필요-->
						<div class="mb-3">
							<label for="errorPostContent" class="col-form-label">내용 </label>
							<textarea type="password" class="form-control"
								id="errorPostContent" name="errorPostContent"
								placeholder="최대한 자세히 입력해주세요..." required></textarea>
							<input type="hidden" name="userId" value="${ loginUser.userId }">
						</div>

						<button class="btn btn-danger">신고 보내기</button>
						<button type="button" class="btn btn-primary">파일 추가</button>
					</form>
				</div>
			</div>
		</div>
	</div>


	<!-- .navigation script 시작 -->
	<script>
        //  토글메뉴 클릭할 때 
        const menuToggle = document.querySelector('.menuToggle');
        const navigation = document.querySelector('.navigation');
        const moreBtn = document.getElementById('more-btn');
        const morePopup = document.getElementById('more-popup');

        menuToggle.onclick = function () {
            navigation.classList.toggle('open');
        }

        moreBtn.onclick = function (e) {
            e.preventDefault();
            morePopup.classList.toggle('active');
        }

        // 페이지 외부 클릭 시 팝업 닫기
        window.onclick = function (event) {
            if (!event.target.matches('#more-btn, #more-btn *')) {
                if (morePopup.classList.contains('active')) {
                    morePopup.classList.remove('active');
                }
            }
        }
        // <!-- .navigation script 끝~~ -->

        function errorPost() {
            return false;
        }
    </script>

	<div class="content">
		<div class="profile-header">
			<div class="strong"
				onclick="location.href='<%=request.getContextPath()%>/myProfile.me'">
				<strong>프로필 편집</strong>
			</div>
			<div class="profile-body">

				<div class="upload-img">
					<button type="button" class="profile-edit">
						<img src="resources/profile01.png"
							onerror="src='resources/logo.jpg'" class="chat-profile">
					</button>
				</div>
				<div class="frofile-middle">
					<b>#닉네임#</b><br>
					<p>#유저네임#</p>
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
			<li onclick="location.href='<%= contextPath %>/member/editprofile'"><ion-icon name="person-outline"></ion-icon> <span
				class="text">프로필 편집</span></li>
			<li onclick="location.href='<%= contextPath %>/setAlert.me'"><ion-icon
					name="notifications-outline"></ion-icon> <span class="text">알림
					설정</span></li>
			<li onclick="location.href='<%= contextPath %>/saveList.me'"><ion-icon
					name="bookmark-outline"></ion-icon> <span class="text">저장목록</span></li>
			<li onclick="location.href='<%= contextPath %>/information.me'">
				<ion-icon name="lock-closed-outline"></ion-icon> <span class="text">개인정보</span>
			</li>
		</ul>
	</div>



</body>

</html>