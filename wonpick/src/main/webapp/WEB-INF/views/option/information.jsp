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
	min-width: 300px;
	height: 850px;
	margin: 30px auto;
	background-color: #ffffff;
	padding: 0 10%;
	border: none;
	border-radius: 10px;
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
	min-width: 300px;
	align-items: center;
	transition: ease-in-out 0.4s;
}

.strong {
	font-size: x-large;
	margin: 30px 0px;
}

.comment-content {
	width: 100%;
	height: 180px;
	border-radius: 20px;
	background-color: #f0f0f0;
	border: 0px;
	padding: 30px;
	border: none;
	resize: none;
	font-size: 17px;
}

#profileImagePreview {
	margin-top: 30px;
	margin: 20px;
	width: 80px;
	height: 80px;
	border-radius: 50%;
	background-color: #ddd;
	object-fit: cover;
}

.nameId {
	margin-top: 30px;
}

.nameId p {
	font-size: 80%;
}

@media all and (min-width:0px) and (max-width:1100px) {
	.right-div {
		display: none;
	}
}

<!-- 정보수정 -->
fieldset {
            border: none;
            padding: 0;
            margin: 0;
        }

        .input-group {
            margin-bottom: 20px;
            position: relative;
        }

        input[type=text], 
        input[type=password], 
        input[type=email], 
        input[type=tel], 
        select {
            width: 100%;
            padding: 12px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
            color: #333;
            font-family: 'Poppins', sans-serif;
            box-sizing: border-box;
        }

        .phone-input {
            display: flex;
            justify-content: space-between;
            width:500px;
        }

        .phone-input input {
            flex: 1;
        }

        .phone-input button {
            height: 42px;
            margin-top: 10px;
            margin-left: 10px;
            width: 30%;
            background-color: #888;
            color: white;
            border: none;
            padding: 0;
            text-align: center;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .gender-container {
            display: flex;
            justify-content: space-between;
        }

        .gender-container .gender {
            text-align: center;
            cursor: pointer;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
            padding: 12px;
            margin-right: 5px;
            transition: background-color 0.3s ease;
            border-radius: 5px;
            flex: 1;
        }

        .gender-container .gender:last-child {
            margin-right: 0;
        }

        .gender-container .gender.active {
            background-color: #333;
            color: #fff;
        }

        .address-input {
            position: relative;
        }

        .input-group img {
            position: absolute;
            width: 30px;
            right: 10px;
            top: 65%;
            transform: translateY(-50%);
            cursor: pointer;
        }

        .agree label {
            font-size: 0.9em;
            display: block;
            margin: 10px 0;
        }

        .agree input[type=checkbox] {
            margin-right: 10px;
        }

        input[type=submit] {
            width: 100%;
            background-color: #333;
            color: white;
            padding: 14px 0;
            margin: 8px 0;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-family: 'Poppins', sans-serif;
        }

        input[type=submit]:hover {
            background-color: #000;
        }

        .error {
            font-size: 0.8em;
            color: #ff4d4d;
            position: absolute;
            top: 12px;
            right: 10px;
        }

        .valid {
            font-size: 0.8em;
            color: #2ecc71;
            position: absolute;
            top: 12px;
            right: 10px;
        }

        /* 아이디 입력 필드에서만 오류 메시지의 위치 조정 (중복확인 버튼 왼쪽 정렬)*/
        #userId-group .error {
            left: 110px; 
            right: auto;
        }

        #userId-group .valid {
            left: 245px;
            right: auto;
        }

        .birth div {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .birth select {
            width: 30%; /* 선택 박스의 너비를 설정 */
        }

        .birth p {
        	
            margin-bottom: 8px;
        }
</style>
</head>
<body>


	<%@ include file="/WEB-INF/views/common/menuBar.jsp"%>

	<div class="content">
		<div class="profile-header">
			<div class="strong">
				<strong>정보 수정</strong>
			</div>
			<div class="profile-body">

				<img id="profileImagePreview" src="${loginUser.pfImg }"
					onerror="src='/wonpick/resources/img/logo.jpg'"
					class="chat-profile">



				<div class="nameId">
					<b>${loginUser.nickName}</b><br>
					<p>${loginUser.userId }</p>
				</div>

			</div>
			<div class="strong">
				<strong>소개</strong>
			</div>
			<div class="soge-field">

				<textarea name="introduce" id="introduce" maxlength="200"
					class="comment-content" value="${loginUser.introduce }" disabled>${loginUser.introduce }</textarea>

			</div>
			
			<div class="strong">
				<strong>정보</strong>
			</div>
			<form action="/wonpick/member/updateMember" method="post">
				<fieldset>
					<div class="input-group">이름
						<input type="text" id="userName" name="userName" value="${loginUser.userName}" placeholder="${loginUser.userName}(변경불가)" readonly	onkeyup="ck_name()"> <span id="msgName"></span>
					</div>
					<div class="input-group">닉네임
						<input type="text" id="nickName" name="nickName" value="${loginUser.nickName}" placeholder="닉네임 변경(현재 닉네임:${loginUser.nickName })"	onkeyup="ck_nickName()"> <span id="msgNickName"></span>
					</div>
					
					<div class="input-group">전화번호
							<input type="tel" id="phone" name="phone" value="${loginUser.phone}" readonly placeholder="현재 번호:${loginUser.phone } (변경 불가)" onkeyup="ck_phone();">

					</div>
					
					<div class="input-group">이메일
						<input type="email" id="email" name="email"
							value="${loginUser.email}"
							placeholder="${loginUser.email }(변경 불가)" readonly
							onkeyup="ck_email()"> <span id="msgId"></span>
					</div>

					<div class="input-group">주소
							<input type="text" id="address" name="address"
								value="${loginUser.address}"
								placeholder="주소 변경(현재 주소:${ loginUser.address})" required
								onclick="searchAddress()" /> <img
								src="https://i.imgur.com/Cs7Y9G0.png" onclick="searchAddress()" />
					</div>
					<div class="input-group">생년월일
							<input type="text" id="birth" name="birth"
								value="${loginUser.birth}"
								placeholder="생년월일 : ${loginUser.birth } (변경 불가)"
								onkeyup="ck_phone();" readonly>
					</div>
					<input type="hidden" name="userId" value="${ loginUser.userId }">
					<input type="submit" value="변경 하기">
				</fieldset>
			</form>
		</div>









	</div>
	<jsp:include page="../common/optionSideBar.jsp" />

<script>
        function ck_id() {
            const userId = document.getElementById("userId");
            const msgUserId = document.getElementById("msgUserId");
            const userIdForm = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
            // 아이디 변경시 중복확인 버튼 비활성화 풀기
            $("#checkId").removeAttr("disabled");

            if (!userIdForm.test(userId.value)) {
                msgUserId.className = 'error';
                msgUserId.innerHTML = "숫자포함 최소 6자리 이상";
                msgUserId.style.display = "block";
                userId.focus();
                $("#checkId").css('backgroundColor', '#888');
                $("#checkId").hover(function(){
                    $(this).css('backgroundColor', '#888');
                }, function(){
                    $(this).css('backgroundColor', '#888');
                });
            } else {
                msgUserId.className = 'valid';
                msgUserId.innerHTML = "ok";
                msgUserId.style.display = "block";
                $("#checkId").css('backgroundColor', '#333');
                $("#checkId").hover(function(){
                    $(this).css('backgroundColor', '#000');
                }, function(){
                    $(this).css('backgroundColor', '#333');
                });
            }   
        }

        function ck_email() {
            const email = document.getElementById("email");
            const msgId = document.getElementById("msgId");
            const emailForm = /([\w\-]+\@[\w\-]+\.[\w\-]+)/;

            if (!emailForm.test(email.value)) {
                msgId.className = 'error';
                msgId.innerHTML = "이메일 형식을 확인하세요";
                msgId.style.display = "block";
                email.focus();
            } else {
                msgId.className = 'valid';
                msgId.innerHTML = "ok";
                msgId.style.display = "block";
            }   
        }

        function ck_pwd() {
            const pwd = document.getElementById("pwd");
            const msgPw = document.getElementById("msgPw");
            const pwdForm = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;

            if (!pwdForm.test(pwd.value)) {
                msgPw.className = 'error';
                msgPw.innerHTML = "숫자포함 최소 6자리 이상";
                msgPw.style.display = "block";
                pwd.focus();
            } else {
                msgPw.className = 'valid';
                msgPw.innerHTML = "ok";
                msgPw.style.display = "block";
            }   
        }

        function ck_pwd2() {
            const pwd_ck = document.getElementById("pwd_ck");
            const pwd = document.getElementById("pwd").value;
            const msgPwck = document.getElementById("msgPwck");

            if (pwd_ck.value != pwd) {
                msgPwck.className = 'error';
                msgPwck.innerHTML = "비밀번호가 일치하지 않습니다.";
                msgPwck.style.display = "block";
                pwd_ck.focus();
            } else {
                msgPwck.className = 'valid';
                msgPwck.innerHTML = "ok";
                msgPwck.style.display = "block";
            }   
        }

        function ck_name() {
            const userName = document.getElementById("userName");
            const msgName = document.getElementById("msgName");
            const nameForm = /^[가-힣]{2,6}$/;  // 2글자 이상 6글자 이하 한글만

            if (!nameForm.test(userName.value)) {
                msgName.className = 'error';
                msgName.innerHTML = "2~6글자 한글로만 작성하세요.";
                msgName.style.display = "block";
                userName.focus();
            } else {
                msgName.className = 'valid';
                msgName.innerHTML = "ok";
                msgName.style.display = "block";
            }   
        }

        function ck_nickName() {
            const nickName = document.getElementById("nickName");
            const msgNickName = document.getElementById("msgNickName");
            const nickNameForm = /^[a-zA-Z가-힣0-9]{3,10}$/;  // 3글자 이상 10글자 이하, 영어, 한글, 숫자만 가능

            if (!nickNameForm.test(nickName.value)) {
                msgNickName.className = 'error';
                msgNickName.innerHTML = "3~10글자로 입력하세요. 특수문자는 불가합니다.";
                msgNickName.style.display = "block";
                nickName.focus();
            } else {
                msgNickName.className = 'valid';
                msgNickName.innerHTML = "ok";
                msgNickName.style.display = "block";
            }   
        }   

        function searchAddress() {
            new daum.Postcode({
                oncomplete: function (data) {
                    document.getElementById('address').value = data.address;
                }
            }).open();
        }

       

       

        function joinCheck() {
            const userId = document.getElementById("userId");
            const userIdForm = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
            
            $("#birth").val($("#year").val()+"-"+$("#month").val()+"-"+$("#day").val());
            console.log($("#birth").val());

            if(!userIdForm.test(userId.value) || $("#checkId").attr("disabled") != 'disabled') {
                alert("아이디 중복확인을 해야합니다.");
                return false;
            }

            const email = document.getElementById("email");
            const msgId = document.getElementById("msgId");
            const emailForm = /([\w\-]+\@[\w\-]+\.[\w\-]+)/;

            if (!emailForm.test(email.value)) {
                alert("이메일 형식을 확인하세요.");
                return false;
            }

            const pwd = document.getElementById("pwd");
            const msgPw = document.getElementById("msgPw");
            const pwdForm = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;

            if (!pwdForm.test(pwd.value)) {
                alert("비밀번호 형식을 확인하세요.");
                return false;
            }

            if (pwd.value !== $("#pwd_ck").val() ) {
                alert("비밀번호와 비밀번호 확인이 다릅니다.");
                return false;
            }

            const userName = document.getElementById("userName");
            const msgName = document.getElementById("msgName");
            const nameForm = /^[가-힣]{2,6}$/;

            if (!nameForm.test(userName.value)) {
                alert("이름 형식을 확인하세요.");
                return false;
            }
            
            const nickName = document.getElementById("nickName");
            const msgNickName = document.getElementById("msgNickName");
            const nickNameForm = /^[a-zA-Z가-힣0-9]{3,10}$/;

            if (!nickNameForm.test(nickName.value)) {
                alert("닉네임 형식을 확인하세요.");
                return false;
            }

            if($("input[name=gender]").val() == undefined) {
                alert("성별을 선택하세요.");
                return false;
            }

            if($("#phone").attr("readonly") != 'readonly') {
                alert("휴대폰 인증을 받으세요.");
                return false;
            }

            if($("#address").val() == "") {
                alert("주소를 입력하세요.");
                return false;
            }
 
        }
    </script>
</body>

</html>