<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.0/css/font-awesome.min.css">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link href="/resources/w3/css/w3_lushmedow.css" rel="stylesheet" type="text/css" />
<script src="/resources/plugin/jquery/jquery.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<style type="text/css">
   .modDiv{
      padding: 10px;
      z-index: 1000;
   }
header,html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
a{text-decoration: none;
color: black;}
		#title{
			background-color: lightblue;
			padding: 5px;
			text-align: center;
		}
	</style>
<title>Top 10</title>
</head>
<body>
<div class="w3-container">
<div class="w3-theme-l1  w3-round-large">
<div class="w3-center w3-padding">
  <h4 style="">데이트 핫플레이스</h4>
  <h1 class="w3-xxxlarge w3-animate-bottom" style="">데이트 코스 베스트 10</h1>
  </div>
   <div class="row w3-container w3-padding-16">
        <div class="col-xs-4"></div>
        <div class="col-xs-4 w3-centerd">
        </div>
     </div>
<div class="w3-row w3-large w3-theme-l1 w3-round-large" style="height:40px">
       <div class="col-xs-8 w3-left-align" >번호&nbsp;&nbsp;&nbsp;&nbsp;제목</div>
       <div class="col-xs-1 w3-center" >작성자</div>
       <div class="col-xs-1 w3-center" >좋아요</div>
       <div class="col-xs-2 w3-center">작성일</div>
</div> 

</div>
</div>
<div class="w3-container">
<div class="w3-accordion" id="courseList">
	<c:forEach var="top10" items="${top10}" varStatus="stat">
          <button onclick="javascript:location.href='/top10_content?rank=${stat.count}'"
           class="w3-padding-16 w3-hover-theme w3-btn-block w3-white w3-border">
          <div class="row">
             <div class="col-xs-8 w3-left-align" style="padding-left:20px "><small>${top10.course_no }</small>
             &nbsp;&nbsp;&nbsp;&nbsp;${top10.course_title}</div>
			
             <div class="col-xs-1 w3-center">
                ${top10.course_writer }
             </div>
             <div class="col-xs-1 w3-center">
                <small>${top10.course_like }</small>
             </div>
             <div class="col-xs-2 w3-align-center">
                <fmt:formatDate pattern="yy-MM-dd HH:mm" value="${top10.course_regdate }"/>
             </div>
         </div>
         </button>
   </c:forEach>
</div>
</div>
</body>
</html>
