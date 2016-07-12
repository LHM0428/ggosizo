<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
 <script type="text/javascript" src="/resources/user/js/find_id.js"></script>
<!--  <link rel="stylesheet" href="/resources/user/css/find_id.css"> -->

<title>아이디찾기</title>
</head>
<body>
<div class="w3-container w3-row">
	<div class="w3-col m3">&nbsp;</div>
	<div class="w3-col m6">
		<div class="w3-card-8 w3-white">
			<div class="w3-container w3-center w3-orange w3-text-white w3-round">
				<h2>아이디 찾기</h2>
			</div>
		</div>
		<div class="w3-container w3-card-8 w3-white w3-round">
			<h6>가입하신 방법에 따라 아이디 찾기가 가능합니다.</h6>
			<hr>
			이름
			<input type="text" class="w3-input w3-animate-input" placeholder="이름을 입력하세요" id="name" style="width:30%" required="required">
			  
			이메일
			<input type="text" class="w3-input w3-animate-input" placeholder="e-mail을 입력하세요" id="email" style="width:30%" required="required">
			<br>
			<div id="input" >${findId }</div>
			<br>
			<div align="center">
				<input type="button" class="w3-btn w3-blue w3-round" value="아이디 찾기" id="check"> 
				<input type="reset" class="w3-btn w3-red w3-round" value="취소" id="cancel">
			</div>
			<br>
		</div>
	</div>
</div>
	
</body>
</html>