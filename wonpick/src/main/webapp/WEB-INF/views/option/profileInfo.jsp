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

    <meta charset="UTF-8">
    
    <title>WonPick</title>
    <style>
        .profile-container {
            width: 100%;
            height: 100vh;
            max-width: 1000px;
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

        .post:hover {
            transform: scale(1.05);
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

        .modal img {
            width: 100%;
            border-radius: 10px;
        }
    
    </style>
</head>

<body>

   <%@ include file="/WEB-INF/views/common/menuBar.jsp" %>
    
    <%
        Member loginUser = (Member) session.getAttribute("loginUser");
        if (loginUser != null) {
    %>
        <div class="content">
            <div class="profile-container">
                <div class="profile-header">
                    <div class="profile-pic" id="profile-pic" 
                    style="background-image: url('<%= loginUser.getPfImg() != null ? loginUser.getPfImg() : "/wonpick/resources/img/logo.jpg" %>');">
                    </div>
                    <div class="profile-info">
                        <button class="pick-btn ${checkedPick ? 'picked' : ''}" data-picked-id="${loginUser.userId}">PICK!</button>
                        <p class="user-id"><%= loginUser.getUserId() %></p>
                        <div class="stats">
                            <span>게시물 <span class="post-count">${postCount != null ? postCount : 0}</span></span> | 
                            <span>pick <span class="pick-count">${pickCount != null ? pickCount : 0}</span></span> | 
                            <span>picked <span class="picked-count">${pickedCount != null ? pickedCount : 0}</span></span>
                        </div>

                        <p class="nickname"><%= loginUser.getNickName() %></p>
                        <p class="bio">내 소개글</p>
                    </div>
                </div>
                <div class="border"></div>
	                <div class="post-grid">
					    <c:forEach var="post" items="${list}">
					        <div class="post">
					            <img src="<%=request.getContextPath()%>${post.imgFile}" alt="Post Image" class="post-image">
					            <p>${post.postTitle}</p>
					        </div>
					    </c:forEach>
					</div>


            </div>
        </div>
    <%
        } else {
            out.println("로그인 정보가 없습니다.");
        }
    %>
    
    <!-- 이미지 팝업 모달 -->
    <div id="imageModal" class="modal">
        <div class="modal-content">
            <img src="" alt="Profile Picture" id="modal-image">
        </div>
    </div>
     
    <jsp:include page="../common/sideBar.jsp"/>
    
<script>
    // PICK 버튼 로직
    document.querySelectorAll('.pick-btn').forEach(button => {
        button.addEventListener('click', function() {
            const pickedId = this.dataset.pickedId;

            fetch('<%= request.getContextPath() %>/post/deletePick?pickedId=' + pickedId, {
                method: 'POST'
            })
            .then(response => response.json())
            .then(data => {
                if (data.isPicked) {
                    this.classList.add('picked');
                } else {
                    this.classList.remove('picked');
                }
                this.parentElement.querySelector('.pick-count').innerText = data.pickCount;
            });
        });
    });

    // 프로필 사진 클릭 시 모달 열기
    document.getElementById('profile-pic').addEventListener('click', function() {
        const modal = document.getElementById('imageModal');
        const modalImg = document.getElementById('modal-image');
        const profileImgUrl = '<%= loginUser.getPfImg() != null ? loginUser.getPfImg() : "/wonpick/resources/img/logo.jpg" %>';
        
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
</body>

</html>
