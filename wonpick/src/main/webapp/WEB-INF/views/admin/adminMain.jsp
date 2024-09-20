<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Wonpick</title>

<!-- Font and Icons -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700;800&display=swap" rel="stylesheet">
<script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>

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

    .overview-item:hover .icon-background {
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

<%@ include file="../common/adminSideBar.jsp" %>
<div class="content">
    <div class="admin-page">
        <h1>WonPick</h1>
        <div class="dashboard-overview">
            <div class="overview-item">
                <ion-icon class="icon-background" name="person-circle-outline"></ion-icon>
                <h2>회원정보 관리</h2>
                <p>현재 등록된 회원 수: 14명</p>
            </div>
            <div class="overview-item">
                <ion-icon class="icon-background" name="document-text-outline"></ion-icon>
                <h2>게시글 관리</h2>
                <p>총 게시글 수: 21개</p>
            </div>
            <div class="overview-item">
                <ion-icon class="icon-background" name="alert-circle-outline"></ion-icon>
                <h2>문제 신고 관리</h2>
                <p>미처리 신고: 2건</p>
            </div>
            <div class="overview-item">
                <ion-icon class="icon-background" name="person-remove-outline"></ion-icon>
                <h2>탈퇴 회원 관리</h2>
                <p>총 탈퇴 회원: 1명</p>
            </div>
        </div>
    </div>
</div>
</body>

</html>
