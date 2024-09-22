<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.won.wonpick.member.model.vo.Member" %>
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
    .profile-container {
        width: 100%;
        height: 300px;
        max-width: 1000px;
        min-width: 550px;
        margin: 0 auto;
        background-color: #fff;
        padding: 30px;
        transition: transform 0.3s;
    }

    .profile-container:hover {
        transform: translateY(-5px);
    }

    .profile-header {
        display: flex;
        align-items: center;
        margin-bottom: 50px;
        flex-wrap: wrap;
    }

    .profile-pic {
        width: 120px;
        height: 120px;
        background-color: #e0e0e0;
        border-radius: 50%;
        margin-right: 30px;
        overflow: hidden;
        transition: box-shadow 0.3s;
        cursor: pointer;
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
    }
    
    .profile-pic:hover {
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
    }

    .profile-info {
        flex: 1;
        animation: fadeIn 1s;
        position: relative;
        min-width: 300px;
    }

    .pick-btn {
        position: absolute;
        top: 50px;
        right: 20px;
        padding: 8px 16px;
        background-color: #000000;
        color: white;
        border: none;
        height: 45px;
        border-radius: 20px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .post-upload-btn:hover {
        background-color: #575757;
    }
    
    .pick-btn.picked {
        background-color: #28a745;
    }

    .stats {
        margin: 30px 0;
        color: #555;
    }

    .nickname,
    .bio {
        margin: 20px 0;
        color: #555;
    }

    .border {
        border: 1px solid #cfcfcf;
        width: 100%;
        margin: 40px 0;
    }

    .post-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 10px;
    }

    .post {
        background-color: #e0e0e0;
        width: 100%;
        padding-bottom: 100%;
        transition: transform 0.3s;
        position: relative;
        overflow: hidden;
    }

	.myPostList {
		margin: 0px 100px;
	}
    @keyframes fadeIn {
        from {
            opacity: 0;
        }

        to {
            opacity: 1;
        }
    }

    /* 모달 스타일 */
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.7);
    }

    .modal-content {
        margin: 10% auto;
        padding: 20px;
        background-color: #fff;
        width: 80%;
        max-width: 500px;
        border-radius: 10px;
        position: relative;
    }

    .modal #modal-image {
        width: 100%;
        border-radius: 10px;
    }
</style>
</head>

<body>

<%@ include file="/WEB-INF/views/common/menuBar.jsp" %>

<%
    Member member = (Member) request.getAttribute("member");
    if (member != null) {
%>

    <div class="content">
        <div class="profile-container">
            <div class="profile-header">
                <div class="profile-pic" id="profile-pic" 
                style="background-image: url('<%= member.getPfImg() != null ? member.getPfImg() : "/wonpick/resources/img/logo.jpg" %>');">
                </div>
                <div class="profile-info">
                	<c:if test="${ loginUser.userId ne member.userId }">
                    <button type="button" class="pick-btn ${checkedPick ? 'picked' : ''}" data-picked-id="${member.userId}" onclick="pick(this.getAttribute('data-picked-id'))" >PICK!</button>
                    </c:if>
                    <p class="user-id"><%= member.getUserId() %></p>
                    <div class="stats">
                        <span>게시물 <span class="post-count"></span></span> | 
                        <span>pick <span class="pick-count"></span></span> | 
                        <span>collect <span class="picked-count">${pickedCount != null ? pickedCount : 0}</span></span>
                    </div>
                    <p class="nickname"><%= member.getNickName() %></p>
                    <p class="bio"><%= member.getIntroduce() != null ? member.getIntroduce() : "소개글이 없습니다." %></p>
                </div>
            </div>
            <div class="border"></div>
        </div>
		<div class="myPostList">
			<%@ include file="/WEB-INF/views/option/profileInfoPostList.jsp"%>
        </div>       
        
    </div>
<% } else { %>
    <p>사용자 정보를 찾을 수 없습니다.</p>
<% } %>
    
    <!-- 이미지 팝업 모달 -->
    <div id="imageModal" class="modal">
        <div class="modal-content">
            <img src="" alt="Profile Picture" id="modal-image">
        </div>
    </div>
     
     
     
    <jsp:include page="../common/sideBar.jsp"/>
    
    
<script>

	function pick(userId){
		$.ajax({
			url : "/wonpick/pick/pick",
			type : 'post',
			data : {
				userId: userId,
				pickedId: "${ loginUser.userId }"
			},
			success : function (result){
	                console.log(result);
	                // pick-count 클래스를 가진 span 태그의 텍스트를 새로운 pickCount 값으로 업데이트
	                document.querySelector('.pick-count').innerText = result;
				},
			error : function(err){
				console.log(err)
			}
			});
			}
	$(function(){
		$.ajax({
			url : "/wonpick/pick/selectPicked",
			type : 'post',
			data : {userId : "${member.userId}"},
			success : function (result){
				console.log(result);
				document.querySelector('.picked-count').innerText = result;
			},
			error : function (err){
				console.log(err);
				console.log("ajax실패");
			}
		});
	});
	$(function(){
		$.ajax({
			url : "/wonpick/pick/selectPick",
			type : 'post',
			data : {userId : "${member.userId}"},
			success : function (result){
				console.log(result);
				document.querySelector('.pick-count').innerText = result;
			},
			error : function (err){
				console.log(err);
				console.log("ajax실패");
			}
		});
	});


    // 프로필 사진 클릭 시 모달 열기
    document.getElementById('profile-pic').addEventListener('click', function() {
        const modal = document.getElementById('imageModal');
        const modalImg = document.getElementById('modal-image');
        const profileImgUrl = '<%= member.getPfImg() != null ? member.getPfImg() : "/wonpick/resources/img/logo.jpg" %>';
        
        modalImg.src = profileImgUrl;
        modal.style.display = 'block';
    });

    // 모달 외부 클릭 시 닫기
    window.addEventListener('click', function(event) {
        const modal = document.getElementById('imageModal');
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });
</script>

  <%
	session.removeAttribute("list");
	%>
</body>

</html>