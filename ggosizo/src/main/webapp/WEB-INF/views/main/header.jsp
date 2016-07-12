<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.0/css/font-awesome.min.css">
<style>
header, .w3-navbar{font-family: "Raleway", sans-serif}
a{text-decoration: none;}
</style>
<!-- --------------------------로그인메뉴 구성------------------------------ -->
<header>
  <center>
    <div id="logMenu" class="loginMenu" align="right" style="margin-right: 200px;margin-top: 30px">
      <c:if test='${empty login}'>
        <a href="/user/login" style="color: #e6005c">로그인</a> &nbsp;
        <a href="/user/insert" style="color: #e6005c">회원가입</a> &nbsp;
        <a href="#" style="color: #e6005c">사이트맵</a>
      </c:if>
      <c:if test="${!empty login}">
          ${login } 님
          <input type="button" class="user_info_edit" value="회원정보수정"  onclick="location.href='/mypage?infoModify=true'" >
          <input type="button" class="user_logout" value="로그아웃" onclick="logoutcall()">
          <input type="button" class="user_mypage" value="마이페이지" onclick="location.href='/mypage'">
      </c:if>
    </div>
<div id="mainBg" style="padding-bottom: 10px">
  		<a href="/main"><img  src="/resources/main/image/1_main.jpg" style="width: 40%; height: auto;" id="brand" ></a>
</div>
  </center>
</header>

<!-- --------------------------로그인메뉴 구성 끝------------------------------ -->
