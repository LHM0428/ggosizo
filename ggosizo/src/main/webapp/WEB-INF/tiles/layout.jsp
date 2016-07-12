<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">  

 <script type="text/javascript" src="/resources/main/js/nav.js"></script>
 <link rel="stylesheet" href="/resources/main/css/nav.css">
  <script type="text/javascript" src="/resources/main/js/header.js"></script>
 <link rel="stylesheet" href="/resources/main/css/header.css">
 <script type="text/javascript" src="/resources/main/js/footer.js"></script>
 <link rel="stylesheet" href="/resources/main/css/footer.css">
 <script type="text/javascript" src="/resources/main/js/body.js"></script>
 <link rel="stylesheet" href="/resources/main/css/body.css">
 <script type="text/javascript" src="/resources/main/js/sidebar.js"></script>
 <link rel="stylesheet" href="/resources/main/css/sidebar.css">
<!--  <script type="text/javascript" src="/resources/manage/js/manage_adv.js"></script>
 <link rel="stylesheet" href="/resources/manage/css/manage_adv.css"> -->


<title>꼬시조 - 데이트 정보 추천 사이트</title>
</head>
<body>
<div id="wrapper">
  <div id="header">
    <tiles:insertAttribute name="header"></tiles:insertAttribute>
  </div>
  <div id="nav">
    <tiles:insertAttribute name="nav"></tiles:insertAttribute>
  </div>
  <br>
  <div class="w3-row">
  <div class="w3-col" style="width:12%">&nbsp;</div>
  <div class="w3-col" style="width:73%">
	  <div id="body">
	    <tiles:insertAttribute name="body"></tiles:insertAttribute>
	  </div>
  </div>
  <div class="w3-col" style="width:14%">
	  <div id="sidebar">
	    <tiles:insertAttribute name="sidebar"></tiles:insertAttribute>
	  </div>
  </div>
  </div>
  <br>
  <div id="footer">
    <tiles:insertAttribute name="footer"></tiles:insertAttribute>
</div>
</div>
</body>
</html>