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
		margin-left: 120px;
		padding: 0;
	}
	.slide {
		min-width: 100%;
		margin: 0;
	}
	.slider-container {
		width: 100%;
	}
}

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

.title {
	font-size: 24px;
	font-weight: bold;
	color: #333;
	margin-top: 20px;
	margin-bottom: 100px;
}

.slider-container {
	position: relative;
	width: 100%;
	height: 300px;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 10%;
	overflow: hidden;
}

.slider {
	display: flex;
	transition: transform 0.5s ease-in-out;
	width: 90%;
}

.slide {
	min-width: 30%;
	height: 300px;
	background-color: #eaeaea;
	border-radius: 10px;
	margin: 0 10px;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 1.5rem;
	color: #888;
}

/* 좌우 화살표 */
.prev, .next {
	position: absolute;
	top: 50%;
	transform: translateY(-50%);
	background-color: rgba(0, 0, 0, 0.5);
	color: white;
	font-size: 2rem;
	padding: 10px;
	cursor: pointer;
	border-radius: 50%;
	border: none;
	z-index: 2;
	display: flex;
	justify-content: center;
	align-items: center;
	width: 40px;
	height: 40px;
}

.prev {
	left: 10%;
}

.next {
	right: 10%;
}

.prev ion-icon, .next ion-icon {
	font-size: 1.5rem;
}

/* 사진 및 릴스 탭 스타일 */
.tab-container {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.tab {
	padding: 10px 20px;
	margin: 0 10px;
	cursor: pointer;
	font-weight: bold;
}

.active-tab {
	background-color: #000;
	color: white;
	border-radius: 20px;
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
			<li class="list"><a href="<%= contextPath %>/message.me"> <span
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
		<div class="alram">
			<div class="title">저장 목록</div>
			<div class="slider-container photos" id="slider-container">
				<!-- 사진 슬라이더 -->
				<div class="slider" id="slider">
					<div class="slide">1</div>
					<div class="slide">2</div>
					<div class="slide">3</div>
				</div>
				<button class="prev" onclick="prevSlide()">
					<ion-icon name="chevron-back-outline"></ion-icon>
				</button>
				<button class="next" onclick="nextSlide()">
					<ion-icon name="chevron-forward-outline"></ion-icon>
				</button>
			</div>

			<!-- 사진 및 릴스 탭 -->
			<div class="tab-container">
				<div class="tab active-tab" id="photos-tab" onclick="showPhotos()">사진</div>
				<div class="tab" id="reels-tab" onclick="showReels()">릴스</div>
			</div>
		</div>
	</div>

	<div class="right-div">
		<ul class="right-menubar">
			<li onclick="location.href='<%= contextPath %>/myProfile.me'"><ion-icon
					name="person-outline"></ion-icon> <span class="text">프로필 편집</span>
			</li>
			<li onclick="location.href='<%= contextPath %>/setAlert.me'"><ion-icon
					name="notifications-outline"></ion-icon> <span class="text">알림
					설정</span></li>
			<li><ion-icon name="bookmark-outline"></ion-icon> <span
				class="text">저장목록</span></li>
			<li onclick="location.href='<%= contextPath %>/information.me'">
				<ion-icon name="lock-closed-outline"></ion-icon> <span class="text">개인정보</span>
			</li>
		</ul>
	</div>
	<script>
    let currentSlide = 0;

    function showSlide(index) {
        const slider = document.getElementById("slider");
        const slides = slider.children.length;
        if (index >= slides) {
            currentSlide = 0; // 마지막 슬라이드 이후 첫번째 슬라이드로 이동
        } else if (index < 0) {
            currentSlide = slides - 1; // 첫번째 슬라이드 이전에 마지막 슬라이드로 이동
        } else {
            currentSlide = index;
        }
        slider.style.transform = 'translateX(-' + currentSlide * 100 + '%)';
    }

    function nextSlide() {
        showSlide(currentSlide + 1);
    }

    function prevSlide() {
        showSlide(currentSlide - 1);
    }

    function showPhotos() {
        document.getElementById('photos-tab').classList.add('active-tab');
        document.getElementById('reels-tab').classList.remove('active-tab');
        document.getElementById('slider-container').classList.remove('reels');
        document.getElementById('slider-container').style.height = "300px";  // 사진 탭의 기본 높이로 설정
        const slides = document.getElementsByClassName('slide');
        for (let slide of slides) {
            slide.style.height = "300px";  // 사진 탭의 기본 슬라이드 높이로 설정
        }
    }

    function showReels() {
        document.getElementById('photos-tab').classList.remove('active-tab');
        document.getElementById('reels-tab').classList.add('active-tab');
        document.getElementById('slider-container').classList.add('reels');
        document.getElementById('slider-container').style.height = "500px";  // 릴스 탭의 높이로 변경
        const slides = document.getElementsByClassName('slide');
        for (let slide of slides) {
            slide.style.height = "500px";  // 릴스 탭의 슬라이드 높이로 설정
        }
    }
</script>


	<script>
        $(document).ready(function () {
            // 우측 메뉴 바의 li 클릭 시 동적 페이지 전환
            $('.right-menubar li').click(function () {
                var pageUrl = $(this).data('url');
                var pageTitle = $(this).data('title');

                // 로딩 스피너 표시
                $('.spinner').show();

                // AJAX 요청으로 새로운 페이지 내용 불러오기
                $.ajax({
                    url: pageUrl,
                    method: 'GET',
                    success: function (response) {
                        // .profile-header 내용을 새로운 HTML로 업데이트
                        $('#profile-header').html(response);

                        // 페이지 타이틀 변경
                        document.title = pageTitle;

                        // 브라우저의 주소를 변경하고 히스토리에 추가
                        history.pushState({ pageUrl: pageUrl }, pageTitle, pageUrl);
                    },
                    error: function () {
                        alert('페이지를 불러오는 중 오류가 발생했습니다.');
                    },
                    complete: function () {
                        // 로딩 스피너 숨김
                        $('.spinner').hide();
                    }
                });
            });
        });
        // 뒤로가기/앞으로가기 시 콘텐츠 업데이트 처리
        window.onpopstate = function (event) {
            if (event.state && event.state.pageUrl) {
                // 로딩 스피너 표시
                $('.spinner').show();

                // AJAX 요청으로 해당 페이지 내용 불러오기
                $.ajax({
                    url: event.state.pageUrl,
                    method: 'GET',
                    success: function (response) {
                        $('#profile-header').html(response);
                        document.title = event.state.title;
                    },
                    error: function () {
                        alert('페이지를 불러오는 중 오류가 발생했습니다.');
                    },
                    complete: function () {
                        $('.spinner').hide();
                    }
                });
            }
        };
    </script>
</body>

</html>