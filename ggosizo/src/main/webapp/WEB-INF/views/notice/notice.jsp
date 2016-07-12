<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script type="text/javascript">		
		$(document).ready(function(){
			$('#write').on("click",function(){
				self.location ="/notice/input_form";
			});
		});
	</script>
</head>
<style type="text/css">  

a { text-decoration:none }

</style>
<body>
 <center>
	<button class="w3-btn w3-white w3-border w3-border-pink w3-hover-pink w3-round-xlarge"
	 style="margin-left: 750px" id='write'>글쓰기</button>
	<br><br>
	<div class="w3-container" style="padding-left: 20%; padding-right: 20%" >
	 <table cellpadding="5" width="70%">
   <tr bgcolor="pink">
     <th width="7%">번호</th>
     <th width="15%">작성자</th>
     <th width="45%">제목</th>
     <th width="25%">작성일</th>
     <th width="8%">조회수</th>
   </tr>  
	<c:forEach var="notice" items="${list }" varStatus="stat">
 	  <tr bgcolor="#fff6f6"  class="w3-text-pink">
    	 <td>${notice.notice_no}</td>
    	 <td>${notice.notice_writer}</td>
    	 <td class="w3-hover-pink"><a href="/notice/read_form?no=${notice.notice_no}">
    		${notice.notice_title}</a></td>
    	 <td>${notice.notice_regdate}</td>
    	 <td>${notice.notice_viewcnt}</td>
 	  </tr>
	</c:forEach>  
	 </table>  
	 </div>
  	<br><br>
  	<div class="w3-text-pink">
	<c:forEach var="i" begin="1" end="${totalPage }" step="1">
		[<a href="javascript:location.href='notice.do?page=${ i}'">${ i}</a>]
	</c:forEach>
	</div>
 </center>
 
<script>
    var result = '${msg}';
    
    if(result == 'SUCCESS'){
    	alert("처리가 완료되었습니다.");
    }
    
    </script>
</body>
</html>