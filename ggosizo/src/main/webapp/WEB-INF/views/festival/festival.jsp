<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3-theme-pink.css">
	<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<head>
<style>

	A{text-decoration: none;}

</style>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
	<script type="text/javascript">
		 $(document).ready(function(){
			 
			$('#searchBtn').on("click",function(event) {
					self.location = "list"
							+ '${pageMaker.makeQuery(1)}'
							+ "&searchType="
							+ $("#searchType").val()
							+ "&keyword=" + $('#keywordInput').val()
							+ "&month=";
			}); 
			
			$('#all').on("click",function(event) {
				self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&month=";
			}); 
			$('#jan').on("click",function(event) {
				self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&month=01";
			}); 
			$('#feb').on("click",function(event) {
				self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&month=02";
			}); 
			$('#mar').on("click",function(event) {
				self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&month=03";
			});
			$('#afr').on("click",function(event) {
				self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&month=04";
			});
			$('#may').on("click",function(event) {
				self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&month=05";
			});
			$('#jun').on("click",function(event) {
				self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&month=06";
			});
			$('#jul').on("click",function(event) {
				self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&month=07";
			});
			$('#aug').on("click",function(event) {
				self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&month=08";
			});
			$('#sep').on("click",function(event) {
				self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&month=09";
			});
			$('#auc').on("click",function(event) {
				self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&month=10";
			});
			$('#nov').on("click",function(event) {
				self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&month=11";
			});
			$('#dec').on("click",function(event) {
				self.location = "list"
						+ '${pageMaker.makeQuery(1)}'
						+ "&month=12";
			});
			
			$('#insert').click(function(){
				self.location = "inputForm";
			});
			
		 });	
			
	</script>
	<body>
<center>
<div id="main_header" ></div>
</center>
<div id="main_nav"></div>

<!-- --------------------------슬라이드 이미지 구성------------------------------ -->
<br>
<div id="section" style="padding-left: 8%; padding-right:8%;">
<header class="w3-container w3-theme w3-padding" id="myHeader">
		<div class="w3-center w3-animate-bottom" >
		<h4>Enjoy Festival</h4>
		<h1 class="w3-xxxlarge">이달의 축제 & 행사</h1>
		<font size="5"></font>
		<br>
		<br>
 		<table cellpadding="5">
 		<tr>
		<c:forEach var="festival" items="${top }" varStatus="stat" step="1">
			<c:if test="${stat.count <4}">
    		 <td width="33.3%" align="center"><a href="read_form?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&no=${festival.no}">
    		 <img src="${festival.img}" style="height:150px; width:250px; padding-bottom: 10px"><br>
    			${festival.name }<br>${festival.addr }<br></a></td>
    		</c:if>
		</c:forEach>
 	 	</tr>
		</table>
		<!-- <a href="#"><img src="../festivalimage/곰취.JPG" style="width:20%"></a>&nbsp;
		<a href="#"><img src="../festivalimage/걷기.JPG" style="width:20%"></a>&nbsp;
		<a href="#"><img src="../festivalimage/컬러.JPG" style="width:20%"></a> -->
		</div>
</header>
<div class="contents">

	

	<center>
	
	<!-- ------------------------------------검색창----------------------------------------- -->
		<br>
			<div>
					<input type="hidden" id="searchType" name="searchType" value="t">
					<input type="hidden" id="id" name="searchType" value="${id }">
					<i class="fa fa-search"></i>
					<input type="text" id="keyword" class="w3-text-theme w3-theme-border w3-border w3-round-large" style="width:300px; height: 35px" placeholder="검색">
  			
						<button id='searchBtn' class="w3-btn w3-white w3-border w3-border-pink
		 				w3-round-large w3-hover-pink">Search</button>
		 				
		 			<c:if test="${id != null}"> 			
		 			<button id="insert" class="w3-btn w3-white w3-border w3-border-pink
					w3-round-large w3-hover-pink">글쓰기</button>
					</c:if>

				</div>
		
		<!-- ----------------------------------------------------------------------------- -->
		<hr width="100%">
		<br>
		<button id="all" class="w3-slim w3-btn w3-white w3-border w3-theme-border w3-hover-theme w3-round-large">전체</button> &nbsp;
		<button id="jan"  class="w3-slim w3-btn w3-white w3-border w3-theme-border w3-hover-theme w3-round-large">01월</button> &nbsp;
		<button id="feb"  class="w3-slim w3-btn w3-white w3-border w3-theme-border w3-hover-theme w3-round-large">02월</button> &nbsp;
		<button id="mar"  class="w3-slim w3-btn w3-white w3-border w3-theme-border w3-hover-theme w3-round-large">03월</button> &nbsp;
		<button id="apr"  class="w3-slim w3-btn w3-white w3-border w3-theme-border w3-hover-theme w3-round-large">04월</button> &nbsp;
		<button id="may"  class="w3-slim w3-btn w3-white w3-border w3-theme-border w3-hover-theme w3-round-large">05월</button> &nbsp;
		<button id="jun"  class="w3-slim w3-btn w3-white w3-border w3-theme-border w3-hover-theme w3-round-large">06월</button> <br>
		<button id="all" class="w3-slim w3-btn w3-white w3-border w3-theme-border w3-hover-theme w3-round-large">전체</button> &nbsp;
		<button id="jul"  class="w3-slim w3-btn w3-white w3-border w3-theme-border w3-hover-theme w3-round-large">07월</button> &nbsp;
		<button id="aug"  class="w3-slim w3-btn w3-white w3-border w3-theme-border w3-hover-theme w3-round-large">08월</button> &nbsp;
		<button id="sep"  class="w3-slim w3-btn w3-white w3-border w3-theme-border w3-hover-theme w3-round-large">09월</button> &nbsp;
		<button id="oct"  class="w3-slim w3-btn w3-white w3-border w3-theme-border w3-hover-theme w3-round-large">10월</button> &nbsp;
		<button id="nov"  class="w3-slim w3-btn w3-white w3-border w3-theme-border w3-hover-theme w3-round-large">11월</button> &nbsp;
		<button id="dec" class="w3-slim w3-btn w3-white w3-border w3-theme-border w3-hover-theme w3-round-large">12월</button> 
		<br><br>
		
		<div id="festival_pages">
		
		<table class="w3-table w3-border" width="65%" cellpadding="10">
			<tr class="w3-theme" style="font-weight:900;" >
				<th width="20%">행사</th>
				<th width="55%">contents</th>
				<th class=" w3-center" width="10%">조회</th>
				<th class=" w3-center" width="15%">작성날짜</th>
			</tr>
			
			<c:forEach var="festival" items="${festival }" varStatus="stat">
					<tr class="w3-hover-pale-red">
						<td><img src="${festival.img}" style="height:100px; width:200px">
						</td>
						<td><a href='/festival/read_form?page=${cri.page}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&no=${festival.no}'>
						${festival.name}&nbsp;[ ${festival.replycnt } ]<br>${festival.addr}</a></td>
						<%-- ${pageMaker.makeQuery(pageMaker.cri.page) }& --%>
						<td class="w3-center">${festival.viewcnt}</td>
						<td class="w3-center"><fmt:formatDate pattern="yy-MM-dd HH:mm" value="${festival.regdate }"/></td>
						
					</tr>
				</c:forEach>
			
		</table>
			
		</div>
		<div class="w3-text-pink">
		
			 <ul class="w3-pagination">

				<c:if test="${pageMaker.prev}">
					<li><a
						href="list${pageMaker.makeMonthSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a href="list${pageMaker.makeMonthSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="list${pageMaker.makeMonthSearch(pageMaker.endPage +1) }">&raquo;</a></li>
				</c:if>

			</ul>
		</div>
		
		
		
		<br>
	</center>
</div>
</div>


<!-- --------------------------슬라이드 이미지 구성 끝------------------------------ -->
<br>
<br>
</body>
</html>