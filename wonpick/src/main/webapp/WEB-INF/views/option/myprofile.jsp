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

@media all and (min-width:0px) and (max-width:1100px) {


	
	.content {
		margin-right: 0px;
	}

	/* 내 프로필 수정 스타일 */
}

.profile-header {
   width: 90%;
   min-width:300px;
   height: 850px;
   margin: 30px auto;
   background-color: #ffffff;
   padding: 0 10%;
   border: 1px solid #ddd;
   border-radius: 10px;
   transition: ease-in-out 0.4s;
   margin-left:90px;
   
}


.profile-edit {
   width: 70px;
   height: 70px;
   border: 1px solid #ddd;
   border-radius: 50%;
   margin-left: 40px;
   margin-right: 20px;
   transition: ease-in-out 0.4s;
}

.profile-body {
   background-color: #f0f0f0;
   display: flex;
   height: 110px;
   border-radius: 50px;
   min-width:300px;
   align-items: center;
   transition: ease-in-out 0.4s;
}

.profile-body b {
   display:flex;
   justify-content:center;
}

.profile-middle {
   padding: 10px;
   line-height: 35px;
   min-width:300px;
}

.chage-img {
   margin-left: auto;
   margin-right:40px;
   background-color: black;
   color: white;
   border-radius: 30px;
   height:40px;
   text-align:center;
   width: 100px;
}

.chage-img:active {
   box-shadow: inset -.3rem -.1rem 1.4rem #8888, inset .3rem .4rem .8rem
      #8888;
   cursor: pointer;
}

.soge-field {
   height: 100px;
   margin-top: 30px;
   border-radius: 30px;
}

.soge {
   margin-top: 30px;
}

.strong {
   font-size: x-large;
   margin: 30px 0px;
}

.upload-img {
   height: 100%;
}

.profile-middle {
   width: 100%;
   height: 100%;
   padding-top: 45px;
}

.comment-content {
   width: 100%;
   height: 180px;
   border-radius: 20px;
   background-color: #f0f0f0;
   border: 0px;
   padding: 20px;
   border: none;
   resize: none;
   font-size: 17px;
}

.comment_length {
   margin-left: calc(100% - 80px);
}

.save-info {
   margin-top: 30px;
   float: right;
   background-color: black;
   color: #fff;
   border: none;
   border-radius: 10px;
   padding: 15px;
   min-height: 30px;
   min-width: 120px;
   cursor: pointer;
}

.save-info:active {
   box-shadow: inset -.3rem -.1rem 1.4rem #8888, inset .3rem .4rem .8rem
      #8888;
   cursor: pointer;
}
.profile-body button img{
	     	width: 70px;
            height: 70px;
            border-radius: 50%;
            background-color: #ddd;
            object-fit: cover;
}
.container-fluid{
transition: margin-left 0.4s;
}
.navigation.open ~.container-fluid {
			margin-left: 250px;
}
</style>
</head>
<body>
	<% if (session.getAttribute("loginUser") == null) {%>
	<script>
			onload() = function() {
				location.href = "/wonpick/views/wonPickLogin.jsp"
			}
		</script>
	<% } %>

	<%@ include file="../common/menuBar.jsp"  %>

   <div class="container-fluid">
      <div class="profile-header">
         <div class="strong"
            onclick="location.href='<%=request.getContextPath()%>/myProfile.me'">
            <strong>내 정보</strong>
         </div>
         <div class="profile-body">

               <button type="button" class="profile-edit">
                  <img src="${ loginUser.pfImg }" 
                      onerror="src='/wonpick/resources/img/logo.jpg'" class="chat-profile">
               </button>
            
               <c:if test="${loginUser.nickName == null }">
               <c:when>
               <b></b><br>
               </c:when>
               <c:otherwise>
               <b>${loginUser.nickName}</b><br>
               </c:otherwise>
               </c:if>
               <p>${longinUser.userid }</p>

               <button type="button" class="chage-img">사진변경</button>
         </div>
         <div class="strong">
            <strong>소개</strong>
         </div>
         <div class="soge-field">

            <textarea name="소개" id="소개" maxlength="200" class="comment-content" readonly>${longinUser.introduce }</textarea>
            
         <div class="strong">
            <strong>정보</strong>
         </div>   
            <textarea name="소개" id="소개" maxlength="200" class="comment-content" disabled></textarea>
            
            
         </div>
      </div>
   </div>
	<%--<%@ include file="../common/optionSideBar.jsp" %> --%>
	<jsp:include page="../common/optionSideBar.jsp"/>



</body>

</html>