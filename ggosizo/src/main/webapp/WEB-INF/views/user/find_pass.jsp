<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
 <script type="text/javascript" src="/resources/user/js/find_pass.js"></script>
<!--  <link rel="stylesheet" href="/resources/user/css/find_pass.css"> -->
 
<title>비밀번호찾기</title>
</head>
<body>
<div class="w3-container w3-row">
	<div class="w3-col m3">&nbsp;</div>
	<div class="w3-col m6">
		<div class="w3-card-8 w3-white">
			<div class="w3-container w3-center w3-deep-orange w3-text-white w3-round">
				<h2>비밀번호 찾기</h2>
			</div>
		</div>
		<div class="w3-container w3-card-8 w3-white w3-round">
			<h6>가입하신 방법에 따라 비밀번호 찾기가 가능합니다.</h6>
			<hr>
			아이디
			<input class="w3-input w3-animate-input" style="width:40%" type="text" placeholder="ID를 입력하세요" maxlength="20" id="u_id">
			이메일
			<input class="w3-input w3-animate-input" style="width:40%" type="text" placeholder="e-mail을 입력하세요" maxlength="30" id="u_email">
			휴대폰번호
			<div class="w3-row">
				<div class="w3-third">
					<input class="w3-input w3-border" type="text" placeholder="One" maxlength="3" id="u_tel1" value="010">
				</div>
				<div class="w3-third">
					<input class="w3-input w3-border" type="text" placeholder="Two" maxlength="4" id="u_tel2">
				</div>
				<div class="w3-third">
					<input class="w3-input w3-border" type="text" placeholder="Three" maxlength="4" id="u_tel3">
				</div>
			</div>
		    <br>
				<div align="center">
					<input class="w3-btn w3-blue w3-round" type="button" value="확인" id="check">
					<input class="w3-btn w3-red w3-round" type="button" value="취소" id="cancel">
				</div>
				<br>
		</div>
	</div>
	</div>
</body>
</html>