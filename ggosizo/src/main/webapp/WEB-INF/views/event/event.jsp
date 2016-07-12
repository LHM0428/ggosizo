<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	
  
   <script type="text/javascript">
   		function a(){
   			alert("ss");
   		}
   
      $(document).ready(function(){
    	  $('#d1').click(function(){
    		  $('#d2').toggle('1000');
    	  });
    	  
    	  
    	  $('#write').on("click",function(){
				self.location ="/event/input_form";
		  });
    	  
    	  $('#searchBtn').on("click",function(event) {
  			self.location = "event"
  					+ '${pageMaker.makeQuery(1)}'
  					+ "&searchType="
  					+ $("select option:selected").val()
  					+ "&keyword=" + $('#keywordInput').val();
  		  });
    	  $("#keywordInput").keydown(function(e){
	            if(e.keyCode==13){
	        		self.location = "event"
	  					+ '${pageMaker.makeQuery(1)}'
	  					+ "&searchType="
	  					+ $("select option:selected").val()
	  					+ "&keyword=" + $('#keywordInput').val();
	            }
	         })//엔터 검색       
      });   
   </script>

<head>

	<style type="text/css">
	a {
		text-decoration: none
	}
	</style>

<title>Event</title>
</head>
<body>

 

<!-- --------------------------메뉴아이콘 구성 끝------------------------------ -->

<!-- --------------------------슬라이드 이미지 구성------------------------------ -->
<br>
 <center>

<!-- ------------------------------------검색창----------------------------------------- -->
		
			<div class='box-body'>

					<select name="searchType" class="w3-white w3-border w3-border-blue w3-hover-blue">
						<option value="n"
							<c:out value="${cri.searchType == null?'selected':''}"/>>
							---</option>
						<option value="t"
							<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
							Title</option>
						<option value="c"
							<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
							Content</option>
						<option value="w"
							<c:out value="${cri.searchType eq 'w'?'selected':''}"/>>
							Writer</option>
						<option value="tc"
							<c:out value="${cri.searchType eq 'tc'?'selected':''}"/>>
							Title OR Content</option>
						<option value="cw"
							<c:out value="${cri.searchType eq 'cw'?'selected':''}"/>>
							Content OR Writer</option>
						<option value="tcw"
							<c:out value="${cri.searchType eq 'tcw'?'selected':''}"/>>
							Title OR Content OR Writer</option>
					</select> 
					<input type="text" name='keyword' id="keywordInput" class="w3-white w3-border w3-border-blue w3-hover-blue"
						value='${cri.keyword }'>
					<button id='searchBtn' class="w3-btn w3-white w3-border w3-border-blue w3-hover-blue w3-round-large">Search</button>
					
					<c:if test="${m_check != null}"> 	
					<button class="w3-btn w3-white w3-border w3-border-blue w3-hover-blue w3-round-large"
						id='write'>글쓰기</button>
					</c:if>
				</div>


<br>
		<div class="w3-container"
			style="padding-left: 10%; padding-right: 10%">
			<table class="w3-table w3-striped w3-bordered w3-card-4">
				<tr class="w3-blue">
					<th width="7%">번호</th>
					<th width="15%">작성자</th>
					<th width="50%">제목</th>
					<th width="20%">작성일</th>
					<th width="8%">조회수</th>
				</tr>
				<c:forEach var="event" items="${list }" varStatus="stat">
					<tr bgcolor="white" class="w3-text-blue">
						<td>${event.event_no}</td>
						<td>${event.event_writer}</td>
						<td class="w3-hover-lightblue"><a href="/event/read_form${pageMaker.makeQuery(pageMaker.cri.page) }&no=${event.event_no}">
							${event.event_title}</a>[ ${event.event_replycnt } ] </td>
						<td>${event.event_regdate}</td>
						<td>${event.event_viewcnt}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br>
		<br>
		<div class="w3-text-blue">
		
			 <ul class="w3-pagination">

				<c:if test="${pageMaker.prev}">
					<li><a
						href="event${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a href="event${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="event${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
				</c:if>

			</ul>
		</div>
	</center>

<!-- --------------------------슬라이드 이미지 구성 끝------------------------------ -->
<br>
<br>

<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		}
</script>

</body>
</html>
