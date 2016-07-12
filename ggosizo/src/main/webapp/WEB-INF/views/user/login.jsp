<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script type="text/javascript" src="/resources/user/js/login.js"></script>
<link rel="stylesheet" href="/resources/user/css/login.css">
<title>로그인</title>
</head>
<body>
<center>
		<span class="w3-text-green">
		<h1>GGOSIZO</h1>
		</span>
			<!--/top-->
			<!--contents-->
      <form method="post" action="/user/loginPOST" id="login_form">
		  <input type="text" name="u_id" class="id_text" placeholder="아이디" /> 
          <input type="password" name="u_pass" class="pass_text" placeholder="비밀번호" /> 
          <input type="button" name="ok_btn" class="ok_btn" value="로그인" />
      </form>
		<div id="bottom">
			<ul class="bot">
				<li><a href="/user/findid">아이디 찾기</a></li>
				<li><a href="/user/findpass">비밀번호 찾기</a></li>
				<li style="border-right: none;"><a href="/user/insert">회원가입</a></li>
			</ul>
		</div>
		<!--/bottom-->
  </center>
  <c:if test="${!empty login }">
    <script type="text/javascript">
    	window.location.replace('/main');
    </script>
  </c:if>
<br>
<br>
</body>
</html>