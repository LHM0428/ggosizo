<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">


 <script type="text/javascript" src="/resources/user/js/user_delete.js"></script>
 <link rel="stylesheet" href="/resources/user/css/user_delete.css">
<title>회원 탈퇴</title>
</head>
<body>
<div style=" text-align: center">
  탈퇴하시겠습니까?<br>
  아이디 : <input type="text" id=u_id value="${login }" readonly="readonly">
  비밀번호 : <input type="password" id="u_pass">
  <br>
  <br>
  <hr>
  
  <input type="button" id="ok" value="보내기">
  <input type="button" id="cancel" value="취소하기">
  </div>
</body>
</html>