<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
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

        .feed {
            background-color: #fff;

            padding: 10px;
            margin-top: 20px;
            padding: 0 10%;
            display: flex;
            justify-content: center;
        }
	</style>
</head>
<body>
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
                <!-- 필요에 따라 더 많은 프로필 추가 !! -->
            </div>
        </header>
</body>
</html>