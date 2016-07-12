<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.0/css/font-awesome.min.css">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link href="/resources/w3/css/w3_airyblue.css" rel="stylesheet" type="text/css" />
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
</style>
<title>데이트 코스</title>
</head>
<script type="text/javascript">
   var loginId = '${login}';
   $(document).ready(function(){
      $("#bt_insert").click(function(){
         if(loginId==null){
            alert('로그인이 필요합니다.')
         }else{
            self.location='/userCourse/insert';
         }
      })
      $("#bt_showAll").click(function(){
    	self.location='/userCourse/listAll';  
      })
         $("#keyword").keydown(function(e){
            if(e.keyCode==13){
               var keyword = $("#keyword").val();
               searchKeyword(keyword);
            }
         })//엔터 검색
         $("#searchKeyword").click(function(){
            var keyword = $("#keyword").val();
            searchKeyword(keyword);
         })//검색키 클릭시
   })
   function userCourse(course_no,keyword){
	   if(keyword!=null){
	      self.location='/userCourse/read?no='+course_no+'&keyword='+keyword;
	   }else{
	      self.location='/userCourse/read?no='+course_no;
	   }
   }
	function searchKeyword(keyword){
		location.href= "/userCourse/listAll?keyword="+keyword;
	}
</script>
<body >
<div class="w3-container">
<div class="w3-theme-l2  w3-round-large">
<div class="w3-center w3-padding">
  <h4 style="">널 꼬신 데이트 코스</h4>
  <h1 class="w3-xxxlarge w3-animate-bottom" style="">데이트 코스조</h1>
  </div>
   <div class="row w3-container">
        <div class="col-xs-4"></div>
        <div class="col-xs-4 w3-centerd">
           <input id="keyword" class="w3-text-theme w3-input w3-theme-border w3-border w3-round-large" type="text" style="width:100%;" placeholder="검색">
        </div>
        <button id="searchKeyword" class="w3-theme-l2 w3-border w3-theme-border w3-hover-theme w3-round-xlarge w3-btn w3-large" style="height:39px">
        <i class="fa fa-search">&nbsp;검색</i></button>
     </div>
    <div class="w3-padding-32">
       <div class="w3-round-large w3-padding-32">
         <button id="bt_showAll" class="w3-margin w3-right w3-theme w3-border w3-hover-theme-dark w3-round-xlarge w3-btn">
         전체 데이트 코스</button>
         <button id="bt_insert" class="w3-margin w3-right w3-theme w3-border w3-hover-theme-dark w3-round-xlarge w3-btn">데이트 코스 등록</button>
      </div>
    </div>
<div class="w3-row w3-large w3-theme-l2 w3-round-large w3-margin-top" style="height:40px">
       <div class="col-xs-8 w3-left-align w3-medium" >번호&nbsp;&nbsp;&nbsp;&nbsp;제목</div>
       <div class="col-xs-1 w3-center w3-medium" >작성자</div>
       <div class="col-xs-1 w3-center w3-medium" >조회수</div>
       <div class="col-xs-2 w3-center w3-medium">작성일</div>
</div> 

</div>
</div>
<div class="w3-container">
<div class="w3-accordion" id="courseList">
   <c:forEach items="${course}" var="course">
          <button onclick="userCourse(${course.course_no},'${param.keyword }')" class="w3-padding-16 w3-hover-theme w3-btn-block w3-white w3-border">
          <div class="row">
             <div class="col-xs-8 w3-left-align" style="padding-left:20px "><small>${course.course_no }</small>
             &nbsp;&nbsp;&nbsp;&nbsp;${course.course_title}
             &nbsp;<small>[ ${course.course_replycnt} ]</small></div>

             <div class="col-xs-1 w3-center">
                ${course.course_writer }
             </div>
             <div class="col-xs-1 w3-center">
                <small>${course.course_viewcnt }</small>
             </div>
             <div class="col-xs-2 w3-align-center">
                <fmt:formatDate pattern="yy-MM-dd HH:mm" value="${course.course_regdate }"/>
             </div>
         </div>
         </button>
   </c:forEach>
</div>
</div>

   <div class="text-center">
      <ul class="w3-pagination">
         <c:if test="${pageMaker.prev}">
            <li><a href="/userCourse/listAll${pageMkaer.makeSearch(pageMaker.startPage-1) }"
            class="w3-hover-theme">&laquo;</a></li>
         </c:if>
         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
            <li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
               <a href="/userCourse/listAll${pageMaker.makeSearch(idx) }" class="w3-hover-theme">${idx}</a>
            </li>
         </c:forEach>
         <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <li><a href="/userCourse/listAll${pageMkaer.makeSearch(pageMaker.endPage+1) }"
            class="w3-hover-theme">&raquo;</a></li>
         </c:if>
      </ul>
   </div>

</body>
</html>
