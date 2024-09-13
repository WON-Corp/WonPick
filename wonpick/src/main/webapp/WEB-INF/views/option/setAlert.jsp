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

	<%@ include file="../common/menuBar.jsp" %>

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
	<jsp:include page="../common/optionSideBar.jsp"/>
</body>

</html>