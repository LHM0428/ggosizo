<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script type="text/javascript" src="/resources/user/js/user_insert.js"></script>
<title>회원가입</title>
</head>
<body>
<div class="w3-container w3-row">
<div class="w3-col m3">&nbsp;</div>
<div class="w3-col m6">
<c:if test="${empty login }">
<form id="insert_form" method="post">
	<div class="w3-card-8 w3-white">
		<div class="w3-container w3-center w3-teal w3-text-white w3-round">
			<h2>회원가입</h2>
		</div>
	</div>
<div class="w3-container w3-card-8 w3-white w3-round">
	<br>
	<label>아이디</label><br>
	 <div class="w3-row">
	 	<div class="w3-half">
			<input class="w3-input w3-animate-input" style="width:80%" type="text" name="u_id" maxlength="12" placeholder="6~12자리,영문,숫자를 입력하세요">
	 	</div>
	 	<div class="w3-half">
			<input class="w3-btn w3-round" id="idCheck" value="중복확인" style="width:40%" readonly="readonly">
	 	</div>
	 </div>
	<span>
	<label>비밀번호</label>
	<input class="w3-input w3-animate-input" style="width:40%" type="password" name="u_pass1" maxlength="12" placeholder="6~12자리,영문,숫자를 입력하세요"></span>
	<span>
	<label>비밀번호 확인</label>
	<input class="w3-input w3-animate-input" style="width:40%" type="password" name="u_pass2" maxlength="12" placeholder="비밀번호를 재입력하세요"></span>
	<span>
	<label>이름</label>
	<input class="w3-input w3-animate-input" style="width:40%" type="text" name="u_name" maxlength="12"></span>
	<span>
	<label>성별</label><br>
	<input class="w3-radio" type="radio" name="u_gender" value="남" checked>
	<label class="w3-validate">남</label>
	<input class="w3-radio" type="radio" name="u_gender2" value="여">
	<label class="w3-validate">여</label>
	</span>
	<br>
	<label>생년월일</label>
	<div class="w3-row">
	  <div class="w3-third">
	    <input class="w3-input w3-border" type="text" name="u_year" maxlength="4" placeholder="Year">
	  </div>
	  <div class="w3-third">
	    <input class="w3-input w3-border" type="text" name="u_month" maxlength="2" placeholder="Month">
	  </div>
	  <div class="w3-third">
	    <input class="w3-input w3-border" type="text" name="u_day" maxlength="2" placeholder="Day">
	  </div>
	</div>
	<label>메일주소</label>
	<div class="w3-row">
		<div class="w3-half">
			<input class="w3-input" type="text" name="u_email1" maxlength="20">
		</div>
		<div class="w3-half">
			@<select class='w3-btn w3-white w3-hover-black w3-round-large' name="u_email2" maxlength="20">
		      <option>naver.com</option>
			  <option>nate.com</option>
			  <option>daum.net</option>
			  <option>gmail.com</option>
			  <option>hotmail.com</option>
		      <option>intizen.com</option>
			  <option>freechal.com</option>
		    </select>
		</div>
	</div>
	<label>휴대폰 번호</label>
	<div class="w3-row">
	  <div class="w3-third">
	    <input class="w3-input w3-border" type="text" name="u_tel1" maxlength="3" value="010" placeholder="One">
	  </div>
	  <div class="w3-third">
	    <input class="w3-input w3-border" type="text" name="u_tel2" maxlength="4" placeholder="Two">
	  </div>
	  <div class="w3-third">
	    <input class="w3-input w3-border" type="text" name="u_tel3" maxlength="4" placeholder="Three">
	  </div>
	</div>
	<label class="w3-left">주소</label><br>
			<span id="sp1"></span>
			<span id="sp2">  
	          <select class='w3-btn w3-white w3-hover-black w3-round-large' name="u_addr2" maxlength="300">
	          </select>
          	</span>
  <div class="w3-section w3-center">
 	 <input class="w3-btn w3-blue w3-center w3-round" type="button" value="가입" id="formCheck">
 	 <input class="w3-btn w3-red w3-center w3-round" type="reset" value="취소" name="cancel">
  </div>
 </div>
</form>
</c:if>
</div>
</div>
<div class="w3-col m3"></div>
<c:if test="${!empty login }">
<script type="text/javascript">
	window.location.replace('http://localhost:8282/main');
</script>
</c:if>
</body>

</html>