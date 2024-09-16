<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>WonPick</title>
<style>
.post {
	background-color: #fff;
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


	<c:if test="${ empty list }">
		<script>
			location.href = "errorPost/selectErrorList";
		</script>
	</c:if>


	<%@ include file="common/menuBar.jsp"%>


	<div class="content">

		<%@ include file="common/storyBar.jsp"%>

		<!-- 게시물 -->
		<c:forEach var="list" items="${ list }">
			<div class="feed">
				<div class="post">
					<div class="post-header">
						<div class="post-info">
							<br>
							<h3>${ list.userId }</h3>
							<span class="post-time">${ list.postingTime }</span>
						</div>
						<img src="${ list.userPfImg }"
							onerror="src='/wonpick/resources/img/logo.jpg'" class="post-profile-img">
					</div>
					<c:if test="${ not empty list.imgFile }">
						<c:if
							test="${ not fn:contains( list.imgFile, '.mp4') && not fn:contains( list.imgFile, '.avi')}">
							<img src="${ list.imgFile }" alt="삭제된 파일입니다" class="post-image">
						</c:if>
						<c:if
							test="${ fn:contains( list.imgFile, '.mp4') || fn:contains( list.imgFile, '.avi')}">
							<video src="${ list.imgFile }" class="post-image" controls
								autoplay loop muted></video>
						</c:if>
					</c:if>
					<img src="/wonpick/resources/img/sizing_space.jpg" alt="공백"
						class="post-image">
					<div class="post-content">
						<button type="button" id="detailPost" data-toggle="modal"
							data-target="#detailPostModal" onclick="getDetailPost(${ list.postId });">
							<p>
								<strong>${ list.postTitle }</strong>
							</p>
						</button>
					</div>
					<div class="post-comments">
						<button type="button" id="detailPost" data-toggle="modal"
							data-target="#detailPostModal" onclick="getDetailPost(${ list.postId });">
							<p>&nbsp; ${ list.postContent }</p>
						</button>
						<div class="post-actions">
							<img src="/wonpick/resources/img/logo.jpg" alt="WonPick 로고" class="heart">
							<ion-icon name="chatbubble-outline"></ion-icon>
							<ion-icon name="bookmark-outline"></ion-icon>
						</div>
						<button type="button" id="detailPost" data-toggle="modal"
							data-target="#detailPostModal" onclick="getDetailPost(${ list.postId });">
							<p class="view-comments">댓글 -개</p>
						</button>
					</div>
				</div>
			</div>

			<!-- 게시물 페이지 모달 -->
			<div class="modal fade" id="detailPostModal" tabindex="-1"
				aria-labelledby="detailPostModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="post">
						<!-- 모달 헤더 부분 -->
						<div class="post-header">
							<div class="post-info">
								<br>
								<h3 id="userId"></h3>
								<span class="post-time" id="postingTime"></span>
							</div>
							<img src=""
								onerror="src='/wonpick/resources/img/logo.jpg'" class="post-profile-img" id="userPfImg">
						</div>

						<!-- 모달 바디 부분 -->
						<div class="modal-body">

							
							<img src="" alt="삭제된 파일입니다" class="post-image" id="imgFile" hidden>
									
							<video src="" class="post-image" controls
										autoplay loop muted id="videoFile" hidden></video>
								
							<img src="/wonpick/resources/img/sizing_space.jpg" alt="공백"
								class="post-image">
							<div class="post-content">
								
									<p>
										<strong id="postTitle"></strong>
									</p>
								
							</div>
							<div class="post-comments">
								
									<p id="postContent"></p>
								
								<div class="post-actions">
									<img src="/wonpick/resources/img/logo.jpg" alt="WonPick 로고"
										class="heart">
									<ion-icon name="chatbubble-outline"></ion-icon>
									<ion-icon name="bookmark-outline"></ion-icon>
								</div>
								
									<p class="view-comments">댓글 -개</p>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>

	</div>



	<%@ include file="common/sideBar.jsp"%>


	<%
	session.removeAttribute("list");
	%>
</body>

<script>
 	function getDetailPost(postId){
 		$.ajax({
            url: "/wonpick/post/postDetail",
            type: 'post',
            data: { postId: postId },
            success: function(result) {
                
                $("#userId").text(result.userId);
                document.getElementById("userPfImg").src = result.userPfImg;
                $("#postTitle").text(result.postTitle);
                $("#postContent").text(result.postContent);
                
                if (result.imgFile == undefined) {
                	
                	$("#imgFile").attr("hidden", true);
                	$("#videoFile").attr("hidden", true);
                	
                } else if (result.imgFile.includes(".mp4") || result.imgFile.includes(".avi")){
                	
                	document.getElementById("videoFile").src = result.imgFile;
					$("#videoFile").removeAttr("hidden");
					$("#imgFile").attr("hidden", true);
					
                } else {
                	
                	document.getElementById("imgFile").src = result.imgFile;
					$("#imgFile").removeAttr("hidden");
					$("#videoFile").attr("hidden", true);
                }
                
            },
            error: function(err) {
                
                    
            }
        });
 		
 	}
</script>

</html>