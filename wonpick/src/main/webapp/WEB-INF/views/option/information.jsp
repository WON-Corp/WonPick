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
            font-family: 'Poppins', sans-serif;
            background-color: #f0f0f0;
            margin: 50px 0;
            padding: 0;
            color: #333;
            align-items: center;
            height: auto;
        }

        .main {
        	margin-left:400px;
        	margin-top:100px;
            margin-right:400px;
            width: 100%;
            max-width: 700px;
            background-color: #ffffff;
            padding: 30px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
        }

        .main h4 {
            margin-bottom: 30px;
            text-align: center;
            font-size: 1.5em;
            color: #333;
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
        }

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

        .address-input img {
            position: absolute;
            width: 20px;
            right: 10px;
            top: 50%;
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




	<%@ include file="/WEB-INF/views/common/menuBar.jsp" %>

    <div class="main">
        <h4>정보 수정(닉네임과 주소 수정 가능)</h4>
        <form action="/wonpick/member/updateMember" method="post">
            <fieldset>
                <div class="input-group" id="userId-group">
                    <div class="phone-input">
                        <input type="text" id="userId" name="userId" value="${loginUser.userId}" placeholder="${loginUser.userId }(변경 불가)" readonly onkeyup="ck_id()">
                       
                    </div>
                    <span id="msgUserId"></span>
                </div>
                <div class="input-group">
                    <input type="email" id="email" name="email" value="${loginUser.email}" placeholder="${loginUser.email }(변경 불가)" readonly onkeyup="ck_email()">
                    <span id="msgId"></span>
                </div>
                <div class="input-group">
                    <input type="hidden" id="pwd" name="password" value="${loginUser.password}" placeholder="로그인 페이지의 비밀번호 변경을 이용해 주세요." readonly onkeyup="ck_pwd()">
                    <span id="msgPw"></span>
                </div>  
               
                <div class="input-group">
                    <input type="text" id="userName" name="userName" value="${loginUser.userName}" placeholder="${loginUser.userName}(변경불가)" readonly onkeyup="ck_name()"> 
                    <span id="msgName"></span>
                </div>
                <div class="input-group">
                    <input type="text" id="nickName" name="nickName" value="${loginUser.nickName}" placeholder="닉네임 변경(현재 닉네임:${loginUser.nickName })" onkeyup="ck_nickName()" > 
                    <span id="msgNickName"></span>
                </div>
               
                <div class="input-group">
                    <div class="phone-input">
                        <input type="tel" id="phone" name="phone" value="${loginUser.phone}" readonly placeholder="현재 번호:${loginUser.phone } (변경 불가)" onkeyup="ck_phone();">
                       
                    </div>
                </div>
                
                <div class="input-group">
                    <div class="address-input">
                        <input type="text" id="address" name="address" value="${loginUser.address}" placeholder="주소 변경(현재 주소:${ loginUser.address})" required onclick="searchAddress()" />
                        <img src="https://i.imgur.com/Cs7Y9G0.png" onclick="searchAddress()" />
                    </div>
                </div>
                <div class="input-group">
                    <div class="phone-input">
                        <input type="text" id="birth" name="birth" value="${loginUser.birth}" placeholder="생년월일 : ${loginUser.birth } (변경 불가)" onkeyup="ck_phone();">
                       
                    </div>
                </div>
                
                <input type="submit" value="변경 하기" >
            </fieldset>
        </form>
    </div>

    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

        function ck_phone() {
            if($("#phone").val() == ''){
                $("#checkPhone").attr("disabled", true);
                $("#checkPhone").css('backgroundColor', '#888');
                $("#checkPhone").hover(function(){
                    $("#checkPhone").css('backgroundColor', '#888');
                }, function(){
                    $("#checkPhone").css('backgroundColor', '#888');
                });
            } else {
                $("#checkPhone").removeAttr("disabled");
                $("#checkPhone").css('backgroundColor', '#333');
                $("#checkPhone").hover(function(){
                    $("#checkPhone").css('backgroundColor', '#000');
                }, function(){
                    $("#checkPhone").css('backgroundColor', '#333');
                });
            }
        }

        function selectGender(gender) {
        	// 0901 Gender 속성 수정
            document.getElementById("wrap_man").classList.remove("active");
            document.getElementById("wrap_woman").classList.remove("active");
            document.getElementById("wrap_" + gender).classList.add("active");

            document.getElementById("man").checked = false;
            document.getElementById("woman").checked = false;
            document.getElementById(gender).checked = true;
        }
        
        function sendVerificationCode() {
            alert("휴대전화 인증번호를 전송했습니다.");
            $("#phone").attr("readonly", true);
            $("#verificationCodeInput").prop("disabled", false);
            // TODO:: 실제 인증번호 전송 로직 구현 예정
        }

        function searchAddress() {
            new daum.Postcode({
                oncomplete: function (data) {
                    document.getElementById('address').value = data.address;
                }
            }).open();
        }

        $(document).ready(function(){            
            let now = new Date();
            let year = now.getFullYear();
            let mon = (now.getMonth() + 1) > 9 ? ''+(now.getMonth() + 1) : '0'+(now.getMonth() + 1); 
            let day = (now.getDate()) > 9 ? ''+(now.getDate()) : '0'+(now.getDate());           
            
            //년도 selectbox만들기               
            for(let i = 1900 ; i <= year ; i++) {
                $('#year').append('<option value="' + i + '">' + i + '</option>');    
            }

            // 월별 selectbox 만들기            
            for(let i=1; i <= 12; i++) {
                let mm = i > 9 ? i : "0"+i ;            
                $('#month').append('<option value="' + mm + '">' + mm + '</option>');    
            }
            
            // 일별 selectbox 만들기
            for(let i=1; i <= 31; i++) {
                let dd = i > 9 ? i : "0"+i ;            
                $('#day').append('<option value="' + dd + '">' + dd+ '</option>');    
            }

            $("#year  > option[value="+year+"]").attr("selected", "true");        
            $("#month  > option[value="+mon+"]").attr("selected", "true");    
            $("#day  > option[value="+day+"]").attr("selected", "true");       
        });

        // 전체 선택/해제
        document.getElementById("check_all").addEventListener("click", function () {
            const checkboxes = document.querySelectorAll('.agree .normal');
            checkboxes.forEach(function (checkbox) {
                checkbox.checked = document.getElementById("check_all").checked;
            });
        });

        // 개별 체크박스 해제 시 전체 동의 체크박스 해제
        const normalCheckboxes = document.querySelectorAll('.agree .normal');
        normalCheckboxes.forEach(function (checkbox) {
            checkbox.addEventListener('change', function () {
                if (!this.checked) {
                    document.getElementById("check_all").checked = false;
                }
            });
        });

        // 아이디 중복체크
        function idCheck() {
            const userId = $("#userId").val();

            $.ajax({
                url:'/wonpick/member/idCheck',
                type: 'get',
                data: { userId: userId },
                success: function(result) {
                    if(userId === "") {
                        alert("아이디를 입력하세요!")
                    } else {
                        const userIdForm = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;
                        if (!userIdForm.test(userId)) {
                            alert("아이디 형식이 부적합합니다")
                        } else { 
                            if(result == 'NNN'){
                                alert("사용중인 아이디입니다.");
                                $("#userId").val("");
                                $("#userId").focus();
                            } else if(result == 'NNY') {
                                const yn = confirm("사용 가능합니다. 사용하시겠습니까?");
                                if(yn){
                                    $("#checkId").attr("disabled",true);
                                    $("#checkId").hover(function(){
                                        $("#checkId").css('backgroundColor', '#888');
                                    }, function(){
                                        $("#checkId").css('backgroundColor', '#888');
                                    });
                                } else {
                                    $("#enroll-form input[name=userId]").focus();
                                };
                            };
                        };
                    };
                },
                error: function(err) {
                    console.log(err);
                }
            });	
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
	<jsp:include page="../common/optionSideBar.jsp"/>

</body>

</html>