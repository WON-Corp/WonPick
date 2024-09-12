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

        /* my profile 창 */
        .myprofile {
            width: 300px;
            height: 129px;
            box-sizing: border-box;
            position: fixed;
            right: 0;
            top: 0;
            border-left: 1px solid #ddd;
            border-bottom: 1px solid #ddd;
            overflow: hidden;
            
        }

        .myprofile h4{
            margin-top: 10px;
            margin-left: 10px;
            margin-bottom: 5px;
        }

        .myprofile img {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background-color: #ddd;
            margin: 10px 15px;
            object-fit: cover;
        }

        .myprofile .myname {
            position: absolute;
            top: 65px;

        }
        
        .logout {
            cursor: pointer;
            font-size: x-small;
            color: #aaa;
            margin-top: 0px;
        }
        /* my profile 창 끝 */

        /* 오른쪽 WM창 */

        .sidebar-message {
            width: 300px;
            background-color: #fff;
            max-height: 1000px;
            padding: 10px 15px;
            box-sizing: border-box;
            position: fixed;
            right: 0;
            /* Todo --수정 */
            top: 130px;
            bottom: 0;
            border-left: 1px solid #ddd;
            overflow-y: auto;
        }

        .sidebar-message h3 {
            margin-bottom: 15px;

            font-size: 16px;
            font-weight: bold;
            color: #333;
        }

        .message-list {
            list-style: none;

            padding: 0;
            margin: 0;
        }

        .message-list li {
            display: flex;

            align-items: center;
            padding: 8px 5px;
            border-bottom: 1px solid #ddd;
            cursor: pointer;
        }

        .message-list li:hover {
            background-color: #f0f0f0;

            transition: 0.4s ease-in-out;
        }

        .message-list img {
            width: 50px;

            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
            object-fit: cover;
        }

        .message-list .message-info {
            display: flex;

            flex-direction: column;
            justify-content: center;
        }

        .message-list .message-info .name {
            font-weight: bold;

            color: #333;
        }

        .message-list .message-info .message-text {
            font-size: 14px;

            color: #888;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .message-list .message-info .time {
            font-size: 11px;

            color: #aaa;
            margin-top: 2px;
        }

        /* 오른쪽 WM창 끝 */

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


    <!-- 문제신고 페이지 모달 -->
    <div class="modal fade" id="errorPostModal" tabindex="-1" aria-labelledby="errorPostModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
           <!-- 모달 헤더 부분 -->
            <div class="modal-header">
              <img src="#" alt="" style="border-radius: 15px; width: 45px;">
              <h2 class="modal-title fs-5" id="errorPostModalLabel">&nbsp;문제신고</h2>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
            </div>
            <!-- 모달 바디 부분 -->
            <div class="modal-body">
              <form action="errorPost" method="post">    <!-- 폼태그 액션속성 수정 필요-->
                <div class="mb-3">
                  <label for="errorPostContent" class="col-form-label">내용 </label>
                  <textarea type="password" class="form-control" id="errorPostContent" name="errorPostContent" placeholder="최대한 자세히 입력해주세요..." required></textarea>
                  <input type="hidden" name="userId" value="${ loginUser.userId }">
                </div>

               <button class="btn btn-danger">신고 보내기</button>
               <button type="button" class="btn btn-primary">파일 추가</button>
              </form>
            </div>
          </div>
        </div>
      </div>

      <!-- 문제신고 확인 페이지 모달 -->
    <div class="modal fade" id="errorPostListModal" tabindex="-1" aria-labelledby="errorPostListModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
           <!-- 모달 헤더 부분 -->
            <div class="modal-header">
              <img src="#" alt="" style="border-radius: 15px; width: 45px;">
              <h2 class="modal-title fs-5" id="errorPostListModalLabel">&nbsp;문제신고목록</h2>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
            </div>
            <!-- 모달 바디 부분 -->
            <div class="modal-body">
              <form action="errorPost" method="post">    <!-- 폼태그 액션속성 수정 필요-->
                <table class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>No.</th>
                            <th>작성자</th>
                            <th>작성일</th>
                            <th>내용</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>keydown</td>
                            <td>2024-08-01</td>
                            <td>내용 삽입....이거길어지면 어디까지 길어질수 있는지 봐야하넨</td>
                        </tr>                             
                    </tbody>
                </table>
              </form>
            </div>
          </div>
        </div>
      </div>

    <!-- 내 프로필 -->
    <div class="myprofile">
        <h4>내 프로필</h4>
        <div class="myprofile2">
        <img src="resources/img/logo.jpg" onerror="src='resources/img/logo.jpg'">
        <span class="myname">${ loginUser.nickName }</span>
        </div>
    </div>
    <script>
        function userLogout() {
            location.href = "member/logout";
        }
    </script>


    <div class="sidebar-message">
        <h3>메시지</h3>
        <ul class="message-list">
            <li>
                <img src="resources/img/profile01.png" onerror="src='resources/img/logo.jpg'">
                <div class="message-info">
                    <span class="name">이지은</span>
                    <span class="message-text">얏호</span>
                    <span class="time">1분</span>
                </div>
            </li>
            <li>
                <img src="resources/img/profile02.jpg" onerror="src='resources/img/logo.jpg'">
                <div class="message-info">
                    <span class="name">유지민</span>
                    <span class="message-text">저녁 뭐먹지?</span>
                    <span class="time">20분</span>
                </div>
            </li>
            <li>
                <img src="resources/img/profile03.jpg" onerror="src='resources/img/logo.jpg'">
                <div class="message-info">
                    <span class="name">김민정</span>
                    <span class="message-text">3분 전에 활동</span>
                    <span class="time"></span>
                </div>
            </li>
            <!-- 메시지 목록 표시됨 -->

            <!-- 문제신고 목록 버튼 및 스크립트 여기서부터 -->
            <li><button type="button" id="errorPostList" data-toggle="modal" data-target="#errorPostListModal">
                급한대로 잠깐 여기다가 만들었습니다. 추후 꼭 수정</button></li>
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