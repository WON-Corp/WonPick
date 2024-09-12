<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <title>WonPick</title>
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


        .content {
            flex: 1;
            margin-left: 120px;
            margin-right: 330px;
            padding: 20px;
            transition: margin-left 0.4s, margin-right 0.4s;
        }

        /* nav가 열릴 때 좌우 여백도 같이 줄어들음 */
        .navigation.open~.content {
            margin-left: 250px;
        }



        /* 헤더 시작*/
        header {
            padding: 20px 0;
            display: flex;
            justify-content: center;
        }

        .stories {
            display: flex;

            gap: 15px;
            overflow-x: auto;
            padding: 20px 0;
            padding-left: 30px;
        }

        .story {
            display: flex;

            flex-direction: column;
            align-items: center;
            width: 70px;
            text-align: center;
        }

        .story img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            border: 2px solid #356060;
            /* ToDo - 그라데이션 입혀서 새 스토리 확인 */
            object-fit: cover;
        }

        .story span {
            margin-top: 5px;
            font-size: 12px;
            color: #333;
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

    <div class="content">
        <header>
            <!-- 프로필 스토리 섹션 -->
            <div class="stories">
                <div class="story">
                    <img src="resources/img/profile01.png" onerror="src='resources/img/logo.jpg'">
                    <span>아이유</span>
                </div>
                <div class="story">
                    <img src="resources/img/profile02.jpg" onerror="src='resources/img/logo.jpg'">
                    <span>username2</span>
                </div>
                <div class="story">
                    <img src="resources/img/profile03.jpg" onerror="src='resources/img/logo.jpg'">
                    <span>username3</span>
                </div>
                <div class="story">
                    <img src="resources/img/profile04.jpg" onerror="src='resources/img/logo.jpg'">
                    <span>username4</span>
                </div>
                <div class="story">
                    <img src="resources/img/profile05.jpg" onerror="src='resources/img/logo.jpg'">
                    <span>username5</span>
                </div>
                <div class="story">
                    <img src="resources/img/profile06.jpg" onerror="src='resources/img/logo.jpg'">
                    <span>username6</span>
                </div>
                <div class="story">
                    <img src="resources/img/profile07.jpg" onerror="src='resources/img/logo.jpg'">
                    <span>username7</span>
                </div>
                <div class="story">
                    <img src="resources/img/profile08.jpg" onerror="src='resources/img/logo.jpg'">
                    <span>username8</span>
                </div>
                <!-- 필요에 따라 더 많은 프로필 추가 !! -->
            </div>
        </header>

            <script>
                $(function(){
                    // 비동기식 통신
                    $.ajax({
                        url: '/wonpick/errorPostList.do',
                        type: 'post', // 기본값
                        data: { data: data }, 
                        success: function(result) {
                            // 통신 성공 시 실행될 함수. 결과(응답데이터)가 result변수에 담겨져 있을 것임!
                            console.log("통신성공!");
                            console.log(result);

                            $("#result1").text(result);
                        },
                        error: function(error) {
                            // 통신 실패 시 실행될 함수. 오류 결과가 error변수에 담겨져 있을 것임.
                            console.log("통신 실패!");
                            console.log(error);
                        },
                        complete: function() {
                            // 통신 성공여부 상관없이 실행될 함수
                            console.log("통신 성공 여부 상관없이 실행!");
                        }
                    });
                })
            </script>

    </div>
</body>

</html>