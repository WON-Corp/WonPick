<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wonpick</title>
<style>
/* 왼쪽 메뉴바 스타일 */
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
	margin-right: 40px;
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


@media all and (min-width:0px) and (max-width:1100px) {
	.sidebar-message {
		display: none;
	}
	.myprofile {
		display: none;
	}
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

        <ul>
            <!--  로고 및 텍스트 -->
            <li class="list"><a href="/wonpick">
                <div class="logo-container">
                    <img src="/wonpick/resources/img/logo.jpg" alt="WonPick 로고" class="logo">
                    <p class="logo-text">WonPick</p>
                </div>
            </a></li>

            <!-- 변경된 네비게이션 메뉴 -->
            <li class="list"><a href="<%= contextPath %>/admin/manageUsers"> 
                <span class="icon">
                    <ion-icon name="people-outline"></ion-icon>
                </span> 
                <span class="text">회원정보 관리</span>
            </a></li>
            <li class="list"><a href="<%= contextPath %>/admin/managePosts"> 
                <span class="icon"> 
                    <ion-icon name="document-text-outline"></ion-icon>
                </span> 
                <span class="text">게시글 관리</span>
            </a></li>
            <li class="list"><a href="<%= contextPath %>/admin/manageReports"> 
                <span class="icon"> 
                    <ion-icon name="alert-circle-outline"></ion-icon>
                </span> 
                <span class="text">문제 신고 관리</span>
            </a></li>
            <li class="list"><a href="<%= contextPath %>/admin/managedrawnUsers"> 
                <span class="icon"> 
                    <ion-icon name="person-remove-outline"></ion-icon>
                </span> 
                <span class="text">탈퇴 회원 관리</span>
            </a></li>
        </ul>

        <div class="footer">
            <p>© 2024 WonPick. All Rights Reserved.</p>
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

    </script>
</body>
</html>