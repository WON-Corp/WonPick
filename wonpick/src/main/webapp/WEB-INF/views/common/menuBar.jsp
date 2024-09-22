<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>Insert title here</title>

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
	margin-right: 330px;
	padding: 20px;
	transition: margin-left 0.4s, margin-right 0.4s;
}

/* nav가 열릴 때 좌우 여백도 같이 줄어들음 */
.navigation.open ~.content {
	margin-left: 250px;
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

/* 문제 신고 창 */
.errorPostList {
	font-size: small;
}

/* 더보기 팝업 메뉴 */
.more-popup {
	position: fixed;
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
	.content {
		margin-right: 30px;
	}
}


<!--
문제 신고 페이지 모달 속성-->.upload-container {
	width: 700px;
	background-color: white;
	border-radius: 10px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
	overflow: hidden;
	display: flex;
	flex-direction: column;
}

.upload-header {
	background-color: #f8f8f8;
	padding: 10px 15px;
	font-weight: bold;
	text-align: center;
	border-bottom: 1px solid #ddd;
}

.upload-content {
	display: flex;
	flex-direction: column;
	align-items: center;
	padding: 20px;
}

.image-preview {
	width: 100%;
	height: 400px;
	background-color: #333;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-size: 18px;
	position: relative;
	cursor: pointer;
	overflow: hidden;
	border-radius: 10px;
}

.image-preview img {
	max-width: 100%;
	max-height: 100%;
	object-fit: cover;
}

.image-preview input[type="file"] {
	display: none;
}

.image-preview.dragover {
	background-color: #444;
}

.title-input {
	width: 100%;
	border: none;
	resize: none;
	outline: none;
	font-size: 16px;
	margin: 20px 0;
	border: 1px solid #ddd;
	padding: 10px;
	border-radius: 5px;
}

.caption-input {
	width: 100%;
	height: 100px;
	border: none;
	resize: none;
	outline: none;
	font-size: 16px;
	margin: 20px 0;
	border: 1px solid #ddd;
	padding: 10px;
	border-radius: 5px;
}

.upload-footer {
	padding: 10px;
	text-align: right;
}

.upload-footer button {
	color: #fff;
	padding: 8px 16px;
	border: none;
	border-radius: 5px;
	font-size: 14px;
	cursor: pointer;
}

#deleteImg {
	background-color: rgb(35, 59, 59);
}

#more-popup > ul > li > a {
	width: 100%;
	color: #000;
	text-decoration: none;
}
</style>


</head>
<body>
	<%
	String contextPath = request.getContextPath();
	
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
			<li class="list"><a href="/wonpick">
					<div class="logo-container">
						<img src="/wonpick/resources/img/logo.jpg" alt="WonPick 로고" class="logo">
						<p class="logo-text">WonPick</p>
					</div>
			</a> <!-- list 로고 끝 --></li>
			<li class="list"><a href="/wonpick"> <span class="icon">
						<ion-icon name="home-outline"></ion-icon>
				</span> <span class="text">홈</span>
			</a></li>
			<li class="list"><a href="/wonpick/post/searchPage"> <span class="icon"> <ion-icon
							name="search-outline"></ion-icon>
				</span> <span class="text">검색</span>
			</a></li>
			<li class="list"><a href="/wonpick/post/videoPostList"> <span class="icon"> <ion-icon
							name="caret-forward-circle-outline"></ion-icon>
				</span> <span class="text">영상</span>
			</a></li>
			<li class="list"><a href="/wonpick/message/message"> <span class="icon"> <ion-icon
							name="chatbubble-outline"></ion-icon>
				</span> <span class="text">메시지</span>
			</a></li>
			<li class="list"><a href="/wonpick/option/setAlert"> <span class="icon"> <ion-icon
							name="notifications-outline"></ion-icon>
				</span> <span class="text">알림</span>
			</a></li>
			<li class="list"><a type="button" id="boardPost"
				data-toggle="modal" data-target="#boardPostModal"> <span
					class="icon"> <ion-icon name="color-wand-outline"></ion-icon>
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
			<li><a href="<%= contextPath %>/myprofile/profile"><ion-icon
						name="settings-outline"></ion-icon>내 정보</a></li>
			
			<li><a href="<%= request.getContextPath() %>/myprofile/profileInfo"><ion-icon name="images-outline"></ion-icon> 내 활동</a></li>
			<c:choose>
				<c:when test="${ loginUser.status eq 'A'}">
					<button type="button" id="errorPostList" data-toggle="modal"
						data-target="#errorPostListModal">
						<li><ion-icon name="warning-outline"></ion-icon>문제 신고 목록</li>
					</button>
					<button type="button" id="#" data-toggle="modal" data-target="#" onclick="moveAdminPage()">
						<li><ion-icon name="warning-outline"></ion-icon>관리자 페이지</li>
					</button>
				</c:when>
				<c:otherwise>
					<button type="button" id="errorPost" data-toggle="modal"
						data-target="#errorPostModal">
						<li><ion-icon name="warning-outline"></ion-icon>문제 신고</li>
					</button>
				</c:otherwise>
			</c:choose>
			<button type="button" onclick="userLogout()">
				<li><ion-icon name="log-out-outline"></ion-icon> 로그아웃</li>
			</button>
		</ul>
	</div>

	<!-- 로그아웃, 설정페이지 이동 스크립트영역 -->
	<script>
        function userLogout() {
            location.href = "<%= contextPath %>/member/logout";
        }
        
        function moveAdminPage() {
            location.href = "<%= contextPath %>/admin/adminMain";
        }
     
    </script>

	<!-- 문제신고 페이지 모달 -->
	<div class="modal fade" id="errorPostModal" tabindex="-1"
		aria-labelledby="errorPostModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 모달 헤더 부분 -->
				<div class="modal-header">
					<img src="/wonpick/resources/img/logo.jpg" alt=""
						style="border-radius: 15px; width: 45px;">
					<h2 class="modal-title fs-5" id="errorPostModalLabel">&nbsp;문제신고</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">&times;</button>
				</div>
				<!-- 모달 바디 부분 -->
				<div class="modal-body">
					<form action="<%= contextPath %>/errorPost/insertError"
						method="post">
						<!-- 폼태그 액션속성 수정 필요-->
						<div class="mb-3">
							<label for="errorPostTitle" class="col-form-label">제목 </label> <input
								type="text" class="form-control" id="errorPostTitle"
								name="errorPostTitle" placeholder="제목을 입력해주세요..." maxlength="33" required>
							<br> <label for="errorPostContent" class="col-form-label">내용
							</label>
							<textarea class="form-control" id="errorPostContent"
								name="errorContent" placeholder="최대한 자세히 입력해주세요..." maxlength="200" required></textarea>
							<input type="hidden" name="userId" value="${ loginUser.userId }">
						</div>

						<button class="btn btn-danger">신고 보내기</button>
						<button type="button" class="btn btn-primary">파일 추가</button>
					</form>
				</div>
			</div>
		</div>
	</div>



	<!-- 문제신고 확인 페이지 모달 -->
	<div class="modal fade" id="errorPostListModal" tabindex="-1"
		aria-labelledby="errorPostListModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- 모달 헤더 부분 -->
				<div class="modal-header">
					<img src="/wonpick/resources/img/logo.jpg" alt=""
						style="border-radius: 15px; width: 45px;">
					<h2 class="modal-title fs-5" id="errorPostListModalLabel">&nbsp;문제신고목록</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">&times;</button>
				</div>
				<!-- 모달 바디 부분 -->
				<div class="modal-body">
					<form action="#" method="post">
						<!-- 폼태그 액션속성 수정 필요-->
						<table class="table table-striped">
							<thead class="thead-dark">
								<tr>
									<th>No.</th>
									<th>제목</th>
									<th>작성자</th>
									<th>작성일</th>
									<th>내용</th>
								</tr>
							</thead>
							<c:if test="${not empty epArr}">
								<tbody class="errorPostList">
									<c:forEach var="list" items="${ epArr }">
										<tr>
											<td>${ list.errorPostId }</td>
											<td>${ list.errorPostTitle }</td>
											<td>${ list.userId }</td>
											<td>${ list.postingDate }</td>
											<td>${ list.errorContent }</td>
										</tr>
									</c:forEach>

								</tbody>
							</c:if>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- 게시글 작성 페이지 모달 -->
	<div class="modal fade" id="boardPostModal" tabindex="-1"
		aria-labelledby="boardPostModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<!-- 모달 헤더 부분 -->
				<div class="modal-header">
					<img src="/wonpick/resources/img/logo.jpg" alt=""
						style="border-radius: 15px; width: 45px;">
					<h2 class="modal-title fs-5" id="boardPostModalLabel">&nbsp;새
						게시물 만들기</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">&times;</button>
				</div>
				<!-- 모달 바디 부분 -->
				<div class="modal-body">
					<form enctype="multipart/form-data" class="upload-content"
						action="<%= contextPath %>/post/insert" method="post">

						<div class="image-preview" id="image-preview"
							onclick="document.getElementById('file-input').click()">

							<input type="file" id="file-input" name="uploadImg"
								accept="image/*,video/*"> <img id="preview-img" src="#"
								alt="Image Preview" style="display: none;">
							<video id="preview-video" style="display: none;" width="550px"; controls></video>
							<span>사진과 동영상을 여기에 끌어다 놓으세요</span>
						</div>

						<input type="text" class="title-input" name="postTitle"
							placeholder="제목" maxlength="33"required>
						<textarea class="caption-input" name="postContent"
							placeholder="내용 입력" maxlength="666" required></textarea>
						<input type="hidden" name="userId" value="${ loginUser.userId }">
						<input type="hidden" name="userPfImg" value="${ loginUser.pfImg }">


						<div class="upload-footer">
							<button type="button" id="deleteImg"
								onclick="document.getElementById('file-input').click()">이미지 변경</button>
							<button type="submit" class="btn btn-primary">공유하기</button>
						</div>
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
        
        <!-- 게시글 작성을 위한 스크립트 -->
        const fileInput = document.getElementById('file-input');
        const imagePreview = document.getElementById('image-preview');
        const previewImg = document.getElementById('preview-img');
        const previewVideo = document.getElementById('preview-video');
        const form = document.getElementById('upload-form');
        const deleteImgButton = document.getElementById('deleteImg');

        // 드래그 앤 드롭을 위한 이벤트 리스너들
        imagePreview.addEventListener('dragover', (e) => {
            e.preventDefault();
            imagePreview.classList.add('dragover');
        });

        imagePreview.addEventListener('dragleave', (e) => {
            e.preventDefault();
            imagePreview.classList.remove('dragover');
        });

        imagePreview.addEventListener('drop', (e) => {
            e.preventDefault();
            imagePreview.classList.remove('dragover');
            const files = e.dataTransfer.files;
            if (files.length > 0) {
                fileInput.files = files;
                displayImage(files[0]);
            }
        });

        // 파일 선택을 위한 이벤트 리스너
        fileInput.addEventListener('change', function() {
        const file = this.files[0];
        if (file) {
            handleFile(file);
        }
    	});
        // 파일 처리 함수 (이미지 또는 동영상)
        function handleFile(file) {
            const fileType = file.type;

            if (fileType.startsWith('image/')) {
                displayImage(file);
            } else if (fileType.startsWith('video/')) {
                displayVideo(file);
            }
        }

	     // 이미지 미리보기를 표시하는 함수
	     function displayImage(file) {
	     const reader = new FileReader();
	     reader.onload = function(e) {
	         previewImg.src = e.target.result;
	         previewImg.style.display = 'block';
	         previewVideo.style.display = 'none';  // 동영상 미리보기 숨김
	         imagePreview.querySelector('span').style.display = 'none';
	     };
	     	 reader.readAsDataURL(file);
	  	 }
	   	 // 동영상 미리보기를 표시하는 함수
	       function displayVideo(file) {
	            const videoUrl = URL.createObjectURL(file);
	            previewVideo.src = videoUrl;
	            previewVideo.style.display = 'block';
	            previewImg.style.display = 'none';  // 이미지 미리보기 숨김
	            imagePreview.querySelector('span').style.display = 'none';
	        }
	     // 동영상 클릭 시 파일 선택 창 열리지 않도록 방지
	        previewVideo.addEventListener('click', (e) => {
	            e.stopPropagation();  // 기본 동작 방지
	        });
	       
	        deleteImgButton.addEventListener('click', () => {
	            // 파일 입력 필드를 초기화
	            fileInput.value = '';
	            
	            // 미리보기 이미지와 동영상 숨기기
	            previewImg.style.display = 'none';
	            previewVideo.style.display = 'none';
	            imagePreview.querySelector('span').style.display = 'block';  // 기본 안내 문구 다시 표시

	           
	        });
	        
    </script>

</body>
</html>