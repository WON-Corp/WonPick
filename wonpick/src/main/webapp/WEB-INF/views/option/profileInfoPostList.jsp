<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 아이콘 링크 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<title>WonPick</title>
<style>
.feed {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: center;
}

.post-list {
	background-color: #fff;
	padding: 20px 20px;
	margin-right: 10px;
	margin-bottom: 10px;
	border-radius: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
	max-width: 250px;
}

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

.post-info, .post-profile-img {
	cursor: pointer;
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

.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 24;
  cursor : pointer;
}
</style>

</head>

<body>



	<!-- 게시물 -->
	<div class="feed">
		<c:if test="${ not empty list }">
			<c:forEach var="list" items="${ list }">
				<div class="post-list">
					<div class="post-header" data-user-id="${list.userId}">
						<div class="post-info">
							<br>
							<h3>${ list.userId }</h3>
							<span class="post-time">${ list.postingTime }</span>
						</div>
						<c:choose >
						<c:when test="${list.userId == loginUser.userId}">
						<a onclick="postDelet('${list.userId }')"><span class="material-symbols-outlined">
close
</span></a>
						</c:when>
						<c:otherwise>
						<img src="${ list.userPfImg }"
							onerror="src='/wonpick/resources/img/logo.jpg'"
							class="post-profile-img">
						</c:otherwise>
						</c:choose>
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
							<p style="font-size: small; color: #888;">&nbsp; ...더보기</p>
						</button>
						<div class="post-actions">
							<button id="detailPost" onclick="postPick(${ list.postId })">
								<img src="/wonpick/resources/img/logo.jpg"
									id="likeimg${ list.postId }" alt="WonPick 로고" class="heart">
							</button>
							<button id="detailPost" onclick="confirmPostPick(${list.postId})">
								<img src="/wonpick/resources/img/bookmark-off.jpg"
									id="bookmark${ list.postId }" alt="WonPick 로고" class="heart">
							</button>
						</div>
						<button type="button" id="detailPost" data-toggle="modal"
							data-target="#detailPostModal"
							onclick="getDetailPost(${ list.postId });">
							<p class="view-comments">
								<span id="postLike${ list.postId }">댓글보기</span> &nbsp;<span
									id="commentCount${ list.postId }">댓글보기</span>
							</p>
							<script>
							function postDelet(userId){
								if (confirm("삭제하시겠습니까?")) {
							        // 사용자가 '예'를 선택한 경우
							        postDelete(userId);
							    } else {
							        // 사용자가 '아니오'를 선택한 경우
							        console.log('저장 취소됨');
							    }
							}
							function postDelete(userId){
								$.ajax({
									url : "/wonpick/post/deletePost",
									type : 'post',
									data : {userId : userId , postId : ${list.postId}},
									success : function (result){
										if(result == 0){
											alert("게시물을 삭제했습니다.")
											location.href="/wonpick/myprofile/profileInfo?userId="+userId;
										}else{
											alert("게시물 삭제에 실패했습니다.")
										}
									},
									error : function (err){
										consol.log(err)
									}
								});
							}
							
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
							
							
							//게시물 저장하고 저장 유무의 따라 아이콘 색 변화
							function postSave(postId) {
								
							    $.ajax({
							        url: '/wonpick/saveList/insertSaveList', // 서버 URL 지정
							        type: 'POST',               // HTTP 메소드
							        data: {
							            postId : postId  // 데이터 포함
							        },
							        success: function(response) {
							        	const updatedImgElement = document.getElementById("bookmarkImg");
										
										updatedImgElement.src = "";
							            // 요청 성공 시 수행할 작업
							            if(response == "Success"){
							            	alert("게시물을 저장했습니다");
							            	updatedImgElement.src = "/wonpick/resources/img/bookmark-on.jpg";
							            }else if(response == "Failed"){
							            	updatedImgElement.src = "/wonpick/resources/img/bookmark-off.jpg";
							            	alert("저장목록에서 삭제 되었습니다");
							            	
							            }
							           	
							        },
							        error: function(xhr, status, error) {
							            // 요청 실패 시 수행할 작업
							            //alertMsg("이미 저장된 게시물이거나 저장 할 수 없는 게시물입니다.")
							            console.error('Error:', status, error);
							        }
							    });
							    const imgElement = document.getElementById("bookmark"+postId);
							    
							 // 현재 이미지 경로
							    const currentSrc = imgElement.src;
							 
							 // 원래 이미지 경로와 변경할 이미지 경로
							    const originalImageSrc = "/wonpick/resources/img/bookmark-off.jpg";
							    const newImageSrc = "/wonpick/resources/img/bookmark-on.jpg";
							    
							    if (currentSrc.includes(originalImageSrc)) {
								      imgElement.src = newImageSrc;
								    } else {
								      imgElement.src = originalImageSrc;
								    }
							}
							
							//게시물을 불러 올 때 저장 유무에 따라 아이콘 변화
							$(function(){
								$.ajax({
									url : '/wonpick/saveList/selectSaveList',
									type : 'post',
									data : {postId : ${list.postId} , userId : "${loginUser.userId}"},
									success: function(result){
										const imgElement1 = document.getElementById("bookmark"+${list.postId});

										if(result == "yes"){
										
											imgElement1.src = "/wonpick/resources/img/bookmark-on.jpg";
										
										}else if(result == "no"){
											
											imgElement1.src = "/wonpick/resources/img/bookmark-off.jpg";
											
										}
									},
									error: function(err){
										
									}
								});
							});
							
							
							// 좋아요 추가, 삭제 2
		                     function updateLikeCount(postId) {
		                         $.ajax({
		                             url: "/wonpick/postLike/postLikeCount",
		                             type: 'post',
		                             data: { postId: postId },
		                             success: function(result) {
		                                 if (result == 0) {
		                                     $("#postLike" + postId).text("Pick 0개");
		                                 } else {
		                                     $("#postLike" + postId).text("Pick " + result + "개");
		                                 }
		                             },
		                             error: function(err) {
		                                 console.error(err);
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
						            	const updatedImgElement = document.getElementById("heartImg");
										
										updatedImgElement.src = "";
						                if(result == "Success"){
						                	updatedImgElement.src = "/wonpick/resources/img/heart.jpg";
							            	updateLikeCount(postId);
							            }else if(result == "Failed"){
							            	updatedImgElement.src = "/wonpick/resources/img/logo.jpg";
							            	updateLikeCount(postId);
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
							
							function postPickModal() {
								postPick($("input[name=postId]").val());
							}
							
							function confirmPostPickModal() {
								confirmPostPick($("input[name=postId]").val());
							}
									// 페이지가 로딩될 때 아이콘 색 유무
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


				<!-- 게시물 페이지 모달 -->
				<div class="modal fade" id="detailPostModal" tabindex="-1"
					aria-labelledby="detailPostModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content post">
							<!-- 모달 헤더 부분 -->
							<div class="post-header" data-user-id="${list.userId}">
								<div class="post-info">
									<br>
									<h3 id="userId"></h3>
									<span class="post-time" id="postingTime"></span>
								</div>
								<!-- 댓글에 유저 프로필 띄우기 -->
								<img src="" onerror="src='/wonpick/resources/img/logo.jpg'"
									class="post-profile-img" id="userPfImg">
							</div>
							<img src="" alt="삭제된 파일입니다" class="post-image" id="imgFile"
								hidden>

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
									<button id="detailPost" onclick="postPickModal()">
										<img src="/wonpick/resources/img/logo.jpg"
											id="heartImg" alt="WonPick 로고" class="heart">
									</button>
									<button id="detailPost"
										onclick="confirmPostPickModal()">
										<img src="/wonpick/resources/img/bookmark-off.jpg"
											id="bookmarkImg" alt="WonPick 로고" class="heart">
									</button>
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
											<input type="hidden" name="userId"
												value="${ loginUser.userId }"> <input type="hidden"
												name="postId" value="">

										</div>


										<button type="button" class="btn btn-primary" onclick="commentPost(postId)";>댓글작성</button>
									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
		<c:if test="${ empty list }">
			<h2 style="color: #888; margin-top: 200px">포스팅된 게시물이 없습니다.</h2>
		</c:if>
	</div>




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
	getComment(postId);
}

function commentPost() {
	$.ajax({
    url: "/wonpick/postComment/insertComment",
    type: 'post',
    data: { 
    	postId: $("input[name=postId]").val(),
    	userId: $("input[name=userId]").val(),
    	postComment: $("textarea[name=postComment]").val()
    	},
    success: function(result) {
    	getComment($("input[name=postId]").val());
    	$("textarea[name=postComment]").val("");
    },
    error: function(err) {

    }
});
	
	
	
}

function getComment(postId){
	// 모달창 띄울 때 아이콘 적용상태
		changeHeart(postId);
		checkSvaeList(postId);
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
					'<button type="button" id="detailPost" onclick="postComment(\''+item.postCommentId+'\')"><img src="/wonpick/resources/img/logo.jpg" id="commentPick'+item.postCommentId+'" alt="WonPick 로고" class="heart" style="margin:5px"></button></div></div>'+
					'<div class="post-comments">'+
					'<p id="postCommentContent">'+item.postComment+'</p></div></div>'
        	);
        	checkLikeStatus(item.postCommentId);
        } 
    },
    error: function(err) {
        
            
    }
});
}
function changeHeart(postId){
		
		$.ajax({
		url : "/wonpick/postLike/selectLike",
		type : 'post',
		data : {postId : postId , userId : "${loginUser.userId}"},
		success: function(result){
			
			
			const updatedImgElement = document.getElementById("heartImg");
			
			updatedImgElement.src = "";
			
			if(result == "yes"){
				
				updatedImgElement.src = "/wonpick/resources/img/heart.jpg";
			
			}else if(result == "no"){
				
				updatedImgElement.src = "/wonpick/resources/img/logo.jpg";
			}
		},
		error: function(err){
			
		}
	});
	
}
function checkSvaeList(postId){
	$.ajax({
	url : '/wonpick/saveList/selectSaveList',
	type : 'post',
	data : {postId : postId , userId : "${loginUser.userId}"},
	success: function(result){
		const updatedImgElement = document.getElementById("bookmarkImg");
		
		updatedImgElement.src = "";

		if(result == "yes"){
		
			updatedImgElement.src = "/wonpick/resources/img/bookmark-on.jpg";
		
		}else if(result == "no"){
			
			updatedImgElement.src = "/wonpick/resources/img/bookmark-off.jpg";
			
		}
	},
	error: function(err){
		
	}
});
}
 	function checkLikeStatus(postCommentId) {
 	    $.ajax({
 	        url: "/wonpick/postComment/checkCommentPick",
 	        type: 'post',
 	        data: { postCommentId: postCommentId },
 	        success: function(result) {
 	            const imgElement = document.getElementById("commentPick" + postCommentId);
 	           if(result == "yes"){
 	        	   
 	        	   imgElement.src = "/wonpick/resources/img/heart.jpg";
 	           }else if(result == "no"){
 	        	  console.log(result);
 	        	  imgElement.src = "/wonpick/resources/img/logo.jpg";
 	           }
 	        },
 	        error: function(err) {
 	            console.log(err);
 	            console.log("아작스 실패")
 	        }
 	    });
 	}
 	// 댓글 좋아요 기능 us
 	function postComment(postCommentId){
 		$.ajax({
 					url : "/wonpick/postComment/selectCommentPick",
 					type : 'post',
 					data : {postCommentId : postCommentId
 							},
 					success : function (result){
 					
 						const imgElement = document.getElementById("commentPick"+postCommentId);
 						
 						//yes 가 좋아요 누른거
 						if(result == "yes"){
 							imgElement.src = "/wonpick/resources/img/heart.jpg";
 						}else if(result == "no"){
 							imgElement.src = "/wonpick/resources/img/logo.jpg";
 							
 							
 						}
 					},
 					error : function (err){
 						console.log(err)
 						console.log("ajax 실패")
 					}
 			});
	 	}
 
</script>

</html>