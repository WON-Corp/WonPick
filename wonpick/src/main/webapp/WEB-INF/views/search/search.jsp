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
						<c:forEach var="list" items="${ list }">
			<div class="content">
			<div class="feed">
				<div class="post">
					<div class="post-header">
						<div class="post-info">
							<br>
							<h3>${ list.userId }</h3>
							<span class="post-time">${ list.postingTime }</span>
						</div>
						<img src="${ list.userPfImg }"
							onerror="src='/wonpick/resources/img/logo.jpg'"
							class="post-profile-img">
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
							data-target="#detailPostModal"
							onclick="getDetailPost(${ list.postId });">
							<p>
								<strong>${ list.postTitle }</strong>
							</p>
						</button>
					</div>
					<div class="post-comments">
						<button type="button" id="detailPost" data-toggle="modal"
							data-target="#detailPostModal"
							onclick="getDetailPost(${ list.postId });">
							<p>&nbsp; ${ list.postContent }</p>
						</button>
						<div class="post-actions">
							<button id="detailPost" onclick="postPick(${ list.postId })"><img src="/wonpick/resources/img/logo.jpg" id="likeimg${ list.postId }" alt="WonPick 로고" class="heart"></button>
							<button id="detailPost" onclick="confirmPostPick(${list.postId})"><ion-icon name="bookmark-outline"></ion-icon></button>
						</div>
						<button type="button" id="detailPost" data-toggle="modal"
							data-target="#detailPostModal"
							onclick="getDetailPost(${ list.postId });">
							<p class="view-comments"><span id="postLike${ list.postId }">댓글보기</span> &nbsp;<span id="commentCount${ list.postId }">댓글보기</span></p>
							<script>
							
							function confirmPostPick(postId) {
							    // confirm 창을 띄워 사용자가 저장할지 결정하게 함
							    if (confirm("저장하시겠습니까?\n(이미 저장된 게시물의 경우 저장목록에서 삭제됩니다)")) {
							        // 사용자가 '예'를 선택한 경우
							        postSave(postId);
							    } else {
							        // 사용자가 '아니오'를 선택한 경우
							        console.log('저장 취소됨');
							    }
							}
							function postSave(postId ) {
							    $.ajax({
							        url: '/wonpick/saveList/insertSaveList', // 서버 URL 지정
							        type: 'POST',               // HTTP 메소드
							        data: {
							            postId : postId  // 데이터 포함
							        },
							        success: function(response) {
							            // 요청 성공 시 수행할 작업
							            if(response == "Success"){
							            	alert("게시물을 저장했습니다");
							            }else if(response == "Failed"){
							            	alert("저장목록에서 삭제 되었습니다");
							            }
							           	
							        },
							        error: function(xhr, status, error) {
							            // 요청 실패 시 수행할 작업
							            //alertMsg("이미 저장된 게시물이거나 저장 할 수 없는 게시물입니다.")
							            console.error('Error:', status, error);
							        }
							    });
							    
							}
							
							
							// 좋아요 추가, 삭제
							function postPick( postId ) {
								$.ajax({
						            url: "/wonpick/postLike/insertPostLike",
						            type: 'post',
						            data: { postId: postId , userId: "${ loginUser.userId }" },
						            success: function(result) {
						                if(result == "Success"){
							            	
						                	
						                	
							            }else if(result == "Failed"){
							            	
							            }

						            },
						            error: function(err) {
						                	
						            }
						        });
								
								const imgElement = document.getElementById("likeimg"+postId);
							    
							    // 현재 이미지 경로
							    const currentSrc = imgElement.src;
							    
							    // 원래 이미지 경로와 변경할 이미지 경로
							    const originalImageSrc = "/wonpick/resources/img/logo.jpg";
							    const newImageSrc = "/wonpick/resources/img/heart.jpg";
							    
							    // 현재 이미지에 따라 경로를 토글
							    if (currentSrc.includes(originalImageSrc)) {
							      imgElement.src = newImageSrc;
							    } else {
							      imgElement.src = originalImageSrc;
							    }
							  
								
							}
									
									$(function(){
										 
										 
										$.ajax({
											url : "/wonpick/postLike/selectLike",
											type : 'post',
											data : {postId : ${list.postId} , userId : "${loginUser.userId}"},
											success: function(result){
												const imgElement = document.getElementById("likeimg"+${list.postId});

												if(result == "yes"){
												
													imgElement.src = "/wonpick/resources/img/heart.jpg";
												
												}else if(result == "no"){
													
													imgElement.src = "/wonpick/resources/img/logo.jpg";
													
												}
											},
											error: function(err){
												
											}
										});
									});
									
									$(function() {
										$.ajax({
								            url: "/wonpick/postComment/postCommentCount",
								            type: 'post',
								            data: { postId: ${ list.postId } },
								            success: function(result) {
												
												if(result == 0) {
												$("#commentCount${ list.postId }").text("댓글 0개")
											}
												else {
								                $("#commentCount${ list.postId }").text("댓글 "+result+"개")
											}
								            },
								            error: function(err) {
								                
								            }
								        });
									});
									
									// 좋아요 갯수 가져오기
									$(function() {
										$.ajax({
								            url: "/wonpick/postLike/postLikeCount",
								            type: 'post',
								            data: { postId: ${ list.postId } },
								            success: function(result) {
												
												if(result == 0) {
												$("#postLike${ list.postId }").text("Pick 0개")
											}
												else {
						                $("#postLike${ list.postId }").text("Pick "+result+"개")
											}
								            },
								            error: function(err) {
								                	
								            }
								        });
									});
			
									
								</script>
						</button>
					</div>
				</div>
			</div>

			<!-- 게시물 페이지 모달 -->
			<div class="modal fade" id="detailPostModal" tabindex="-1"
				aria-labelledby="detailPostModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content content feed">
						<!-- 모달 헤더 부분 -->
						<div class="post-header">
							<div class="post-info">
								<br>
								<h3 id="userId"></h3>
								<span class="post-time" id="postingTime"></span>
							</div>
							<img src="" onerror="src='/wonpick/resources/img/logo.jpg'"
								class="post-profile-img" id="userPfImg">
						</div>
						<img src="" alt="삭제된 파일입니다" class="post-image" id="imgFile" hidden>

						<video src="" class="post-image" controls autoplay loop muted
							id="videoFile" hidden></video>

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
								<button id="detailPost" onclick="postPick(${ list.postId })"><img  src="/wonpick/resources/img/logo.jpg" alt="WonPick 로고"
									class="heart"></button>
								<button id="detailPost" onclick="confirmPostPick(${list.postId})"><ion-icon name="bookmark-outline"></ion-icon></button>
							</div>

							<!-- 여기부터 댓글 리스트 ajax사용 -->
							<div id="postCommentList"></div>
							<!-- 여기까지 -->

							<!-- 모달 바디 부분 -->
							<div class="modal-body">
								<form class="post-info"
									action="/wonpick/postComment/insertComment" method="post">
									<h3 id="userId">${ loginUser.userId }</h3>
									<div class="mb-3">
										<textarea class="form-control" id="errorPostContent"
											name="postComment" placeholder="댓글작성" required
											style="resize: none" maxlength="100"></textarea>
										<input type="hidden" name="userId" value="${ loginUser.userId }"> 
										<input type="hidden" name="postId" value="">

									</div>


									<button class="btn btn-primary">댓글작성</button>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</c:forEach>
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
                $("input[name=postId]").val(result.postId)
                
                if (result.imgFile == '#') {
                	
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
 		
 		// 댓글 ajax
 		$.ajax({
            url: "/wonpick/postComment/postCommentList",
            type: 'post',
            data: { postId: postId },
            success: function(result) {
            	$("#postCommentList").text("");
                for(let item of result){
                	$("#postCommentList").append(
                			'<div class="post-header"><div class="post-info"><br><h3 id="commentUserId">'+item.userId+'</h3>'+
							'<span class="post-time" id="postingTime">'+item.commentTime+'</span></div><div class="post-actions">'+
							'<img src="'+item.userPfImg+'" onerror="src='+"'/wonpick/resources/img/logo.jpg'"+'" class="post-profile-img" id="commentUserPfImg" style="width:30px; height:30px">'+
							'<img src="/wonpick/resources/img/logo.jpg" alt="WonPick 로고" class="heart" style="margin:5px"></div></div>'+
							'<div class="post-comments">'+
							'<p id="postCommentContent">'+item.postComment+'</p></div></div>'
                	);
                } 
            },
            error: function(err) {
                
                    
            }
        });
 		
 	}
	</script>
</body>

	<jsp:include page="../common/sideBar.jsp" />
</html>