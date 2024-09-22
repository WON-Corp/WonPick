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





.title {
	font-size: 24px;
	font-weight: bold;
	color: #333;
	margin-top: 40px;
	margin-left : 40px;
	margin-bottom: 100px;
}



body {
       
        height: 100vh;
        margin-left : 200px;
        font-family: Arial, sans-serif;
    }
    .slider-container{
    
    display: flex;
        justify-content: center;
    }
    .grid-container {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        grid-gap: 10px;
        width: 80%;
        padding: 20px;
        
    }
    .grid-item {
        background-color: white;
  		border : 1px solid black;
        text-align : center;
        font-size: 20px;
        margin : 30px;
        width: 240px;
        height : 370px;
        border-radius : 10px;
    }
     .grid-item img{
        margin-top : 10px;
        width: 200px;
        height : 350px;
        
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
	
	
	


	
	<%@ include file="/WEB-INF/views/common/menuBar.jsp" %>

	<div class="content">
		
			<div class="title">저장 목록</div>
			<%@ include file="/WEB-INF/views/option/savedPostList.jsp"%>
	</div>

	

<jsp:include page="../common/optionSideBar.jsp"/>
<%
	session.removeAttribute("list");
	%>
</body>

</html>