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

<jsp:include page="../common/optionSideBar.jsp"/>
</body>

</html>