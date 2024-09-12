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
		margin-right: -30px;
		margin-left: 120px;
		padding: 0;
	}
}

/* 안쪽 content 스타일 */
.alram {
	width: 100%;
	height: 850px;
	margin: 30px auto;
	background-color: #ffffff;
	padding: 40px 10%;
	border: 1px solid #ddd;
	border-radius: 10px;
	line-height: 40px;
}

.alram h2 {
	font-size: 24px;
	font-weight: bold;
	color: #333;
	margin-top: 20px;
	margin-bottom: 100px;
}

.section h3 {
	font-size: 20px;
	font-weight: 600;
	color: #444;
	margin-bottom: 20px;
}

.toggle-container {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 25px;
}

.toggle-container p {
	margin-left: 15px;
	font-size: 17px;
}

.radio-group {
	flex-direction: column;
	justify-content: flex-start;
	/* 세로로 정렬 */
	align-items: flex-start;
}

.radio-group label {
	display: flex;
	align-items: center;
	font-size: 16px;
	color: #555;
	margin-bottom: 10px;
}

/* 기본스타일을 없애고, 버튼모양을 구현. */
input[type="radio"] {
	-webkit-appearance: none;
	/*  웹킷 브라우저에서 기본 스타일 제거 */
	-moz-appearance: none;
	/* 모질라 브라우저에서 기본 스타일 제거  */
	appearance: none;
	/* 기본 브라우저에서 기본 스타일 제거 */
	border: 2px solid #ccc;
	width: 18px;
	height: 18px;
	border: 1px solid #f0f0f0;
	border-radius: 50%;
	background-color: #f0f0f0;
	outline: none;
	/* focus 시에 나타나는 기본 스타일 제거 */
	cursor: pointer;
	margin-right: 15px;
	margin-left: 15px;
}

/* 체크될 시에, 변화되는 스타일 설정 */
input[type='radio']:checked {
	background-color: #3b3b3b;
	/* 체크 시 내부 원으로 표시될 색상 */
	border: 3px solid #f0f0f0;
	/* 테두리가 아닌, 테두리와 원 사이의 색상 */
	box-shadow: 0 0 0 1.6px rgb(228, 228, 228);
	/* 얘가 테두리가 됨 */
}

#switch {
	display: none;
}

.switch_label {
	position: relative;
	width: 55px;
	height: 28px;
	background-color: #ddd;
	border-radius: 30px;
	cursor: pointer;
	transition: background-color 0.2s ease;
}

.switch_label:hover {
	background-color: #ccc;
}

.switch_label .onf_btn {
	position: absolute;
	top: 3px;
	left: 3px;
	width: 22px;
	height: 22px;
	background-color: #fff;
	border-radius: 50%;
	transition: all 0.2s;
}

#switch:checked+.switch_label {
	background-color: rgb(35, 59, 59);
}

#switch:checked+.switch_label .onf_btn {
	left: 30px;
}

.section {
	margin-bottom: 25px;
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
	<%
	if (session.getAttribute("loginUser") == null) {
	%>
	<script>
			onload() = function() {
				location.href = "/wonPick/views/wonPickLogin.jsp"
			}
		</script>
	<%
	}
	%>

	<%
	String contextPath = request.getContextPath(); // => /jsp

	String alertMsg = (String) session.getAttribute("alertMsg");
	%>

	<%
	if (alertMsg != null) {
	%>
	<script>
			alert("<%=alertMsg%>
		");
	</script>
	<%
	session.removeAttribute("alertMsg");
	%>
	<%
	}
	%>

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
				href="<%=request.getContextPath()%>/message.me"> <span
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

		menuToggle.onclick = function() {
			navigation.classList.toggle('open');
		}

		moreBtn.onclick = function(e) {
			e.preventDefault();
			morePopup.classList.toggle('active');
		}

		// 페이지 외부 클릭 시 팝업 닫기
		window.onclick = function(event) {
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
		<div class="alram">
			<h2>알림 설정</h2>
			<!-- 알림 설정 제목 -->

			<!-- Wonpick 알림 -->
			<div class="section">
				<h3>Wonpick 알림</h3>
				<div class="toggle-container">
					<p>알림 설정</p>
					<div class="wrapper">

						<input type="checkbox" id="switch"> <label for="switch"
							class="switch_label"> <span class="onf_btn"></span>
						</label>
					</div>
				</div>
			</div>

			<!-- PickUp 알림 -->
			<div class="section">
				<h3>PickUp</h3>
				<div class="radio-group">
					<label> <input type="radio" name="pickup" value="해제">
						해제
					</label> <label> <input type="radio" name="pickup" value="팔로우"
						checked> 팔로우
					</label> <label> <input type="radio" name="pickup" value="모든사람">
						모든 사람
					</label>
				</div>
			</div>

			<!-- 댓글 알림 -->
			<div class="section">
				<h3>댓글</h3>
				<div class="radio-group">
					<label> <input type="radio" name="comment" value="해제">
						해제
					</label> <label> <input type="radio" name="comment" value="팔로우"
						checked> 팔로우
					</label> <label> <input type="radio" name="comment" value="모든사람">
						모든 사람
					</label>
				</div>
			</div>
		</div>
	</div>
	<div class="right-div">
		<ul class="right-menubar">
			<li onclick="location.href='<%=contextPath%>/myProfile.me'"><ion-icon
					name="person-outline"></ion-icon> <span class="text">프로필 편집</span>
			</li>
			<li><ion-icon name="notifications-outline"></ion-icon> <span
				class="text">알림 설정</span></li>
			<li onclick="location.href='<%=contextPath%>/saveList.me'"><ion-icon
					name="bookmark-outline"></ion-icon> <span class="text">저장목록</span></li>
			<li onclick="location.href='<%=contextPath%>/information.me'">
				<ion-icon name="lock-closed-outline"></ion-icon> <span class="text">개인정보</span>
			</li>
		</ul>
	</div>

	<script>
		$(document).ready(function() {
			// 우측 메뉴 바의 li 클릭 시 동적 페이지 전환
			$('.right-menubar li').click(function() {
				var pageUrl = $(this).data('url');
				var pageTitle = $(this).data('title');

				// 로딩 스피너 표시
				$('.spinner').show();

				// AJAX 요청으로 새로운 페이지 내용 불러오기
				$.ajax({
					url : pageUrl,
					method : 'GET',
					success : function(response) {
						// .profile-header 내용을 새로운 HTML로 업데이트
						$('#profile-header').html(response);

						// 페이지 타이틀 변경
						document.title = pageTitle;

						// 브라우저의 주소를 변경하고 히스토리에 추가
						history.pushState({
							pageUrl : pageUrl
						}, pageTitle, pageUrl);
					},
					error : function() {
						alert('페이지를 불러오는 중 오류가 발생했습니다.');
					},
					complete : function() {
						// 로딩 스피너 숨김
						$('.spinner').hide();
					}
				});
			});
		});
		// 뒤로가기/앞으로가기 시 콘텐츠 업데이트 처리
		window.onpopstate = function(event) {
			if (event.state && event.state.pageUrl) {
				// 로딩 스피너 표시
				$('.spinner').show();

				// AJAX 요청으로 해당 페이지 내용 불러오기
				$.ajax({
					url : event.state.pageUrl,
					method : 'GET',
					success : function(response) {
						$('#profile-header').html(response);
						document.title = event.state.title;
					},
					error : function() {
						alert('페이지를 불러오는 중 오류가 발생했습니다.');
					},
					complete : function() {
						$('.spinner').hide();
					}
				});
			}
		};
	</script>
</body>

</html>