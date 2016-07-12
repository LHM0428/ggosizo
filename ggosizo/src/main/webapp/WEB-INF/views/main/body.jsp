<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
 <link rel="stylesheet" href="/resources/main/css/body.css">
 <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
 <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
 <link rel="stylesheet" href="http://www.w3schools.com/lib/w3-theme-black.css">
 <!-- <link href="/resources/w3/css/w3_bodacious.css" rel="stylesheet" type="text/css" /> -->
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
 <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
 
<!-- <script src="/resources/slideImg/section_slide_show.js"></script> -->
<!-- <script src="/resources/slideImg/section_slide_show.css"></script> -->

<script type="text/javascript">
		 $(document).ready(function(){
			var formObj = $("form[role='form']");
			 
			 $('#searchBtn').on("click",function(event) {
				 var category = $('input[type=radio][name=category]:checked').val()
				 search(category)
				});
			 
			 $("#keyword").keydown(function(e){
		            if(e.keyCode==13){
					 var category = $('input[type=radio][name=category]:checked').val()
		            	search(category)
		            }
		         })//엔터 검색
		 }); 
function search(category){
		var keyword = $("#keyword").val();
		if(category=='카페'){
			self.location = "/cafe/searchList?keyword="+keyword;
		}else if(category=='맛집'){
			self.location = "/restaurant/searchList?keyword="+keyword;
		}else if(category=='축제'){
			/* http://localhost:8282/festival/list?page=1&perPageNum=10&searchType=t&keyword=2&month= */
			self.location = "/festival/list"
				+ "?page=1&perPageNum=10"
				+ "&searchType=t"
				+ "&keyword="+keyword
				+ "&month=";
		}else{
			self.location ="/userCourse/listAll?keyword="+keyword;
		}
	}		 


</script>
</head>
<body>
	<table border="1" align="center" cellpadding="1" style="width: 100%;" class="w3-table w3-border">
		<tr>
			<td colspan="2">
				<!-- search -->
				<center>
		<form role="form" id="search" action="/cafe/searchList" method="get">
		<div class="w3-container w3-white w3-border-black w3-border w3-round-large w3-card-2 w3-padding w3-margin-bottom" style="width: 100%">
			<input class="w3-radio" type="radio" name="category" value="데이트코스"><label class="w3-validate">데이트코스</label>
			<input class="w3-radio" type="radio" name="category" value="맛집"><label class="w3-validate">맛집</label>
			<input class="w3-radio" type="radio" name="category" value="카페"><label class="w3-validate">카페</label>
			<input class="w3-radio" type="radio" name="category" value="축제"><label class="w3-validate">축제</label>
			 <div class="w3-row w3-container">
			 <div class="w3-col m3">&nbsp;</div>
			 <div class="w3-col m6  w3-center">
			  	<input id="keyword" class="w3-border w3-input w3-round-large" type="text" style="width:100%;" placeholder="검색">
			 </div>
			 <div class="w3-col m3">
			  	<button type="button" id="searchBtn" class="w3-border w3-teal w3-hover-white w3-round-xlarge w3-btn w3-large" style="height:38px">
			  	<i class="fa fa-search">&nbsp;검색</i></button>
			  </div>
  			</div>
  		</div>
		</form>
		
		
	</center>
			
			</td>
		</tr>
		<tr>
			<td>
				
				<font size="3">
				<ul class="w3-ul w3-card-4">
				<li style="color: #ff0066"><h4><i class="fa fa-bars"></i>
				<a href="/notice/noticePage" style="color: #ff0066">공지사항</a></h4></li>
				<c:forEach var="notice" items="${notice }" varStatus="stat">
				  <c:if test="${stat.index<5}">
					<li class="w3-hover-pink">
					<a style="color: #ff6699;"  href='/notice/read_form?no=${notice.notice_no}'>${notice.notice_title}</a> 
					&nbsp;&nbsp;&nbsp;<span class="w3-medium" style="color: gray">[${notice.notice_regdate }]</span></li>			
				  </c:if>
				</c:forEach>
				</ul>
				</font>
			</td>
			<td rowspan="2" align="center"  height="600px" >
			
				<table class="w3-table w3-striped w3-bordered w3-card-4" align="center">
					<font size="5">
					<tr>
						<td class="w3-xlarge"><a href="/top10"><i class="fa fa-thumbs-up"></i>&nbsp; Top 10</a></td>
					</tr>
					<c:forEach var="top10" items="${top10 }" varStatus="stat">
					  <tr>
					  <c:if test="${stat.index<10}">		
						<td class="w3-large w3-hover-blue" style="color: #0099cc "><a href='/top10_content?rank=${top10.course_no}'>${top10.course_title}</a></td>		
					 
					  </c:if>
					  </tr>
					</c:forEach>
					</font>			
				</table>
				<br><br>
				<a href="http://www.chamisulsoju.com/"><img alt="광고 준비중..." src="/resources/main/image/이슬톡톡.JPG" style="width: 500px"></a>
			</td>
		</tr>
		
		<tr>
			<td style="width: 50%">
			<div class="w3-container w3-pale-yellow w3-round-xlarge w3-card-4">
				<h4 align="center" style="color:#ff9900"><a href="/event/evnet" style="color: orange"><i class="fa fa-heart"></i>&nbsp;이벤트</a><br>
				----------------------------------------</h4>
				<!-- 슬라이드 이미지 -->
				
				<div id="section">
					<div class="slideshow-container">
					
					<div class="mySlides fade">
					  <div class="numbertext">1 / 3</div>
					  <a style="color: #ff9900" href="/event/read_form?page=1&perPageNum=10&no=2"><img src="/resources/main/image/이벤트캡처2.JPG" style="width:100%"></a>
					</div>
					
					<div class="mySlides fade">
					  <div class="numbertext">2 / 3</div>
					  <a href="/event/read_form?no=1"><img src="/resources/main/image/이벤트1.JPG" style="width:100%"></a>
					</div>
					
					<div class="mySlides fade">
					  <div class="numbertext">3 / 3</div>
					 <a href="/event/read_form?page=1&perPageNum=10&no=3"><img src="/resources/main/image/이벤트캡처3.JPG" style="width:100%"></a>
					</div>
					
					<a class="prev" onclick="plusSlides(-1)">❮</a>
					<a class="next" onclick="plusSlides(1)">❯</a>
					
					</div>
					<br>
					
					<div style="text-align:center">
					  <span class="dot" onclick="currentSlide(1)"></span> 
					  <span class="dot" onclick="currentSlide(2)"></span> 
					  <span class="dot" onclick="currentSlide(3)"></span> 
					</div>
					
				</div>
				
				<font size="3">
				<ul style="color:#ffc299">
					<c:forEach var="event" items="${event }" varStatus="stat">
					  <c:if test="${stat.index<3}">
						<li><a style="color: #ff751a" href='/event/read_form?no=${event.event_no}'>${event.event_title}</a>
						 &nbsp;&nbsp;<font color="#ffb380">[${event.event_regdate }]</font></li>				
					  </c:if>
					</c:forEach>
				</ul>
				</font>
				</div>
			</td>
		</tr>
	</table>
<!-- 
<div id="section">
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 3</div>
  <img src="/resources/main/image/경주.JPG" style="width:100%">
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 3</div>
  <img src="/resources/main/image/고창.JPG" style="width:100%">
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 3</div>
  <img src="/resources/main/image/송암.JPG" style="width:100%">
</div>

<a class="prev" onclick="plusSlides(-1)">❮</a>
<a class="next" onclick="plusSlides(1)">❯</a>

</div>
<br>

<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span> 
  <span class="dot" onclick="currentSlide(2)"></span> 
  <span class="dot" onclick="currentSlide(3)"></span> 
</div>

</div>
	메뉴창
<div class="all" id="dropdownmenu">
	<div class="dropdown1">
	  <button onclick="myFunction('1')" class="dropbtn1" id="dropbtn1">먹거리</button>
	  <div id="myDropdown1" class="dropdown-content1">
	    <a href="#">먹거리1</a>
	    <a href="#">먹거리2</a>
	    <a href="#">먹거리3</a>
	  </div>
	</div>
	<div class="dropdown2">
	  <button onclick="myFunction('2')" class="dropbtn2" id="dropbtn2" >놀거리</button>
	  <div id="myDropdown2" class="dropdown-content2">
	    <a href="#">놀거리1</a>
	    <a href="#">놀거리2</a>
	    <a href="#">놀거리3</a>
	  </div>
	</div>
	<div class="dropdown3">
	  <button onclick="myFunction('3')" class="dropbtn3" id="dropbtn3">볼거리</button>
	  <div id="myDropdown3" class="dropdown-content3">
	    <a href="#">볼거리1</a>
	    <a href="#">볼거리2</a>
	    <a href="#">볼거리3</a>
	  </div>
	</div>
	<div class="dropdown4">
	  <button onclick="myFunction('4')" class="dropbtn4" id="dropbtn4">오시는길</button>
	  <div id="myDropdown4" class="dropdown-content4">
	    <a href="#">오시는길1</a>
	    <a href="#">오시는길2</a>
	    <a href="#">오시는길3</a>
	  </div>
	</div>
</div>
	검색창
<div id="search_zip">
	<br>
	<input type="text" name="search" placeholder="Search..">
	<a href="#"><i class="fa fa-search"></i></a>
  
    <a href="#  "><button class="detail_search_button">Click Me</button></a> 
</div>   
    -->
</body>

<style>
{box-sizing:border-box}
		body {font-family: Verdana,sans-serif;margin:0}
		
		/* Slideshow container */
		.slideshow-container {
		  max-width: 700px;
		  position: relative;
		  margin: auto;
		}
		
		/* Next & previous buttons */
		.prev, .next {
		  cursor: pointer;
		  position: absolute;
		  top: 0;
		  top: 50%;
		  width: auto;
		  padding: 16px;
		  margin-top: -22px;
		  color: white;
		  font-weight: bold;
		  font-size: 18px;
		  transition: 0.6s ease;
		  border-radius: 0 3px 3px 0;
		}
		
		/* Position the "next button" to the right */
		.next {
		  right: 0;
		  border-radius: 3px 0 0 3px;
		}
		
		/* On hover, add a black background color with a little bit see-through */
		.prev:hover, .next:hover {
		  background-color: rgba(0,0,0,0.8);
		}
		
		/* Caption text */
		.text {
		  color: #f2f2f2;
		  font-size: 15px;
		  padding: 8px 12px;
		  position: absolute;
		  bottom: 8px;
		  width: 80%;
		  text-align: center;
		}
		
		/* Number text (1/3 etc) */
		.numbertext {
		  color: #f2f2f2;
		  font-size: 12px;
		  padding: 8px 12px;
		  position: absolute;
		  top: 0;
		}
		
		/* The dots/bullets/indicators */
		.dot {
		  cursor:pointer;
		  height: 13px;
		  width: 13px;
		  margin: 0 2px;
		  background-color: #bbb;
		  border-radius: 50%;
		  display: inline-block;
		  transition: background-color 0.6s ease;
		}
		
		.active, .dot:hover {
		  background-color: #717171;
		}
		
		/* Fading animation */
		.fade {
		  -webkit-animation-name: fade;
		  -webkit-animation-duration: 30s;
		  animation-name: fade;
		  animation-duration: 30s;
		}
		
		@-webkit-keyframes fade {
		  from {opacity: .4} 
		  to {opacity: 1}
		}
		
		@keyframes fade {
		  from {opacity: .4} 
		  to {opacity: 1}
		}
		
		/* On smaller screens, decrease text size */
		@media only screen and (max-width: 300px) {
		  .slprev, .slnext,.text {font-size: 11px}
		}

		/* #brand {
			margin-left: 505px;
		} */
</style>
<script type="text/javascript">
//-------------------------------------------------슬라이드이미지 기능
var slideIndex = 1;
//showSlides(slideIndex);
currentSlide(1);
function plusSlides(n) {
showSlides(slideIndex += n);
}

function currentSlide(n) {
showSlides(slideIndex = n);
}

function showSlides(n) {
var i;
var slides = document.getElementsByClassName("mySlides");
var dots = document.getElementsByClassName("dot");
if (n > slides.length) {slideIndex = 1}    
if (n < 1) {slideIndex = slides.length} ;
for (i = 0; i < slides.length; i++) {
  slides[i].style.display = "none";  
}
for (i = 0; i < dots.length; i++) {
  dots[i].className = dots[i].className.replace(" active", "");
}
slides[slideIndex-1].style.display = "block";  
dots[slideIndex-1].className += " active";
}

</script>

</html>