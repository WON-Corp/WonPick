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
	height: 870px;
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


.section {
	margin-bottom: 25px;
	
}

.btn-primary {
    float: right;
}

</style>
</head>

<body>
	<%
	if (session.getAttribute("loginUser") == null) {
	%>
	<script>
			onload() = function() {
				location.href = "/wonpick/views/wonPickLogin.jsp"
			}
		</script>
	<%
	}
	%>

	<%@ include file="/WEB-INF/views/common/menuBar.jsp" %>

<div class="content">
    <div class="alram">
        <h2>알림 설정</h2>

        <div class="section">
            <h3>게시물 좋아요</h3>
            <div class="toggle-container">
                <p>게시물 좋아요 알림</p>
                <input type="checkbox" id="postAlert" value="Y" 
                ${setAlert != null && setAlert.postAlert == 'Y' ? 'checked' : ''}>
            </div>
        </div>

        <div class="section">
            <h3>Pick</h3>
            <div class="toggle-container">
                <p>Pick 알림</p>
                <input type="checkbox" id="pickAlert" value="Y" 
                ${setAlert != null && setAlert.pickAlert == 'Y' ? 'checked' : ''}>
            </div>
        </div>

        <div class="section">
            <h3>댓글</h3>
            <div class="toggle-container">
                <p>댓글 알림</p>
                <input type="checkbox" id="commentAlert" value="Y" 
                ${setAlert != null && setAlert.commentAlert == 'Y' ? 'checked' : ''}>
            </div>
        </div>

        <div class="section">
            <h3>댓글 좋아요</h3>
            <div class="toggle-container">
                <p>댓글 좋아요 알림</p>
                <input type="checkbox" id="commentLikeAlert" value="Y" 
                ${setAlert != null && setAlert.commentLikeAlert == 'Y' ? 'checked' : ''}>
            </div>
        </div>


        <!-- 저장 버튼 -->
        <div class="section">
            <button type="button" class="btn btn-primary" onclick="updateAlertSettings()">저장</button>
        </div>

    </div>
</div>

	<jsp:include page="../common/optionSideBar.jsp"/>

	<script>
	function updateAlertSettings() {
	    const userId = "${loginUser.userId}";


	    const postAlert = document.getElementById('postAlert').checked ? 'Y' : 'N';
	    const pickAlert = document.getElementById('pickAlert').checked ? 'Y' : 'N';
	    const commentAlert = document.getElementById('commentAlert').checked ? 'Y' : 'N';
	    const commentLikeAlert = document.getElementById('commentLikeAlert').checked ? 'Y' : 'N';


	    $.ajax({
	        url: '/wonpick/setalert/update',
	        type: 'post',
	        data:{
	            userId: userId,
	            postAlert: postAlert,
	            pickAlert: pickAlert,
	            commentAlert: commentAlert,
	            commentLikeAlert: commentLikeAlert,
	        },
	        success: function(response) {
	            alert('알림 설정이 저장되었습니다.');
	        },
	        error: function(error) {
	            console.log(error);
	            alert('알림 설정 저장에 실패했습니다.');
	        }
	    });
	}

	</script>

	<jsp:include page="../common/optionSideBar.jsp"/>
</body>

</html>