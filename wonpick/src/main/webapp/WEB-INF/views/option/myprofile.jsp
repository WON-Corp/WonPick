	

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
    body {
        background: linear-gradient(to right, #f8f9fa, #e0e0e0);
        background: #fff;
        color: #333;
        margin: 0;
        padding: 0;
    }

    .admin-page {
        text-align: center;
        padding: 50px;
      	background: #fff;
        border-radius: 15px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        max-width: 900px;
        margin: 50px auto;
        backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.3);
    }

    .admin-page h1 {
        margin-bottom: 40px;
        font-size: 2.5rem;
        color: #000;
        letter-spacing: 2px;
        text-transform: uppercase;
        font-family: 'Poppins', sans-serif;
        
    }

    .dashboard-overview {
        display: grid;
        grid-template-columns: repeat(2, 1fr);
        gap: 30px;
    }

    .overview-item {
        background: rgba(255, 255, 255, 0.2);
        color: #000;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        position: relative;
        overflow: hidden;
        border: 1px solid rgba(255, 255, 255, 0.4);
        backdrop-filter: blur(8px);
    }

    .overview-item:hover {
        transform: translateY(-10px);
        text-decoration: none;

    }

    .overview-item h2 {
        font-size: 1.8rem;
        margin-bottom: 15px;
        color: #333;
        z-index: 1;
    }

    .overview-item p {
        font-size: 1rem;
        margin-bottom: 20px;
        z-index: 1;
        font-family: "Nanum Gothic", sans-serif;
    }

    .icon-background {
        position: absolute;
        top: 20px;
        right: 20px;
        font-size: 5rem;
        color: rgba(0, 0, 0, 0.05);
        transition: transform 0.3s ease;
    }

    .overview-item:hover .icon-background a:hover {
        transform: scale(1.1);
        color: rgba(0, 0, 0, 0.1);
    }
    

    @media (max-width: 768px) {
        .admin-page {
            padding: 30px;
        }

        .admin-page h1 {
            font-size: 2rem;
        }

        .overview-item {
            padding: 20px;
        }

        .overview-item h2 {
            font-size: 1.5rem;
        }

        .dashboard-overview {
            grid-template-columns: 1fr;
        }
    }
    
</style>

</head>
<body>

<% if (session.getAttribute("loginUser") == null) {%>
	<script>
			onload() = function() {
				location.href = "/wonPick/views/wonPickLogin.jsp"
			}
		</script>
	<% } %>

	<%@ include file="/WEB-INF/views/common/menuBar.jsp"  %>
<div class="content">
    <div class="admin-page">
        <h1>내 정보 확인</h1>
        <div class="dashboard-overview">
            <a href="<%= contextPath %>/member/editprofile" class="overview-item">
                <ion-icon class="icon-background" name="person-circle-outline"></ion-icon>
                <h2>프로필 편집</h2>
            </a>
            <a href="<%= contextPath %>/post/saveList" class="overview-item">
                <ion-icon class="icon-background" name="document-text-outline"></ion-icon>
                <h2>저장목록</h2>
            </a>
            <a href="#" class="overview-item">
                <ion-icon class="icon-background" name="alert-circle-outline"></ion-icon>
                <h2>알림 설정</h2>
            </a>
            <a href="<%= contextPath %>/member/editinfo" class="overview-item">
                <ion-icon class="icon-background" name="person-outline"></ion-icon>
                <h2>정보수정</h2>
            </a>
        </div>
    </div>
</div>
<jsp:include page="../common/optionSideBar.jsp"/>
</body>

</html>