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
.search {
	width: 100%;
}

.search-box {
	width: 70%;
	height: 50px;
	padding: 0px 10px;
	border: 0px;
	border-top-left-radius: 5px;
	border-bottom-left-radius: 5px;
	margin-top: 40px;
	margin-bottom: 40px;
	margin-right: 0px;
	margin-left: 80px;
	position: relative;
	background-color: #f0f0f0;
	border-radius: 15px;
	border-bottom-right-radius: 0px;
	border-top-right-radius: 0px;
}

.search-button {
	margin-top: 40px;
	margin-left: 0px;
	background-color: #f0f0f0;
	width: 150px;
	height: 50px;
	border: none;
	border-top-right-radius: 5px;
	border-bottom-right-radius: 5px;
	cursor: pointer;
	border-radius: 15px;
	border-top-left-radius: 0px;
	border-bottom-left-radius: 0px;
}

.search-button>div {
	background:
		url(https://e7.pngegg.com/pngimages/827/272/png-clipart-computer-icons-search-box-others-miscellaneous-magnifier-thumbnail.png)
		no-repeat 99% center #f0f0f0;
	background-size: 27px;
	display: inline-block;
	width: 30px;
	height: 30px;
}

.searchrecord {
	background-color: #fff;
	width: calc(70% + 150px);;
	height: 700px;
	margin-left: 50px;
	border-radius: 15px;
	display: none;
	padding: 50px;
}


.searchrecord li {
	margin: 50px;
}

<!-- 검색 리스트 -->
.post {
	border:1px solid #000;
	padding: 20px 100px;
	margin-bottom: 15px;
	border-radius: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	max-width: 750px;
}

.post-header {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.post-profile-img {
	width: 45px;
	height: 45px;
	border-radius: 50%;
	object-fit: cover;
}

.post-info h3 {
	margin: 0;
	font-size: 14px;
	font-weight: bold;
}

.post-time {
	font-size: 12px;
	color: #888;
}

.post-options {
	font-size: 20px;
	cursor: pointer;
}

.post-image {
	width: 100%;
	margin-top: 15px;
	border-radius: 10px;
}

.post-content {
	margin-top: 10px;
}

.post-actions ion-icon {
	font-size: 20px;
	margin-right: 10px;
	cursor: pointer;
}

.heart {
	width: 21px;
	height: 22px;
	margin-right: 10px;
	cursor: pointer;
	margin-bottom: 11px;
}

.view-comments {
	color: #888;
	font-size: 12px;
	cursor: pointer;
}

#detailPost {
	background-color: #fff;
	border: none;
}
</style>
</head>

<body>

	<%@ include file="/WEB-INF/views/common/menuBar.jsp"%>

	<!-- 기다운 : 검색창 기능 추가 -->
	<div class="content">

		<%@ include file="/WEB-INF/views/common/storyBar.jsp"%>
		<header>

			<div class="search">
					<form action="/wonpick/post/searchPostList" method="post">
				<div style="display: flex;">
					<input type="text" placeholder="검색" name="keyword" class="search-box">
					<button type="submit" class="search-button">
						<div></div>
					</button>
				</div>
					</form>
				<!-- https://e7.pngegg.com/pngimages/827/272/png-clipart-computer-icons-search-box-others-miscellaneous-magnifier-thumbnail.png -->
				<div>
					<div class="searchrecord">
						
					</div>

					<div class="autoSearch">
						<%@ include file="/WEB-INF/views/search/searchList.jsp"%>
					</div>
				</div>
			</div>
		</header>


	</div>
	<script>
		$(function() {

			$('.autoSearch').css('display', 'block');

			$('.search-box').click(function() {
				const $s = $('.searchrecord');
				const $a = $('.autoSearch');
				// $를 변수명 앞에 붙이게 되면 보통 jQuery방식으로 선택된 요소를 의미함!
				// .next() : 선택된 요소의 뒤에 오는 요소(현재 코드 기준 p요소)
				if ($s.css('display') == 'none') {

					$s.siblings('.searchrecord').slideUp();

					$a.slideUp();
					$s.slideDown();

				}
			});

			$('.search-button').click(function() {
				const $s = $('.searchrecord');
				const $a = $('.autoSearch');

				if ($s.css('display') != 'none') {
					$s.slideUp();

					$a.siblings('.autoSearch').slideDown();
					$a.slideDown();
				}
			});

		})
		
		
	</script>
</body>

	<jsp:include page="../common/sideBar.jsp" />
</html>