<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>오류 페이지</title>
</head>
<body>
<%
response.setStatus(HttpServletResponse.SC_OK);
%>
<center>
<p>정상적인 작동 범위를 벗어났습니다.</p>
잠시 후 메인 페이지로 이동합니다.
<a href="/main">메인페이지 이동하기 </a>

</center>
<script type="text/javascript">
window.onload=function(){
setTimeout(function(){
	window.location.replace("/main");
},3000)
}
</script>
</body>
</html>