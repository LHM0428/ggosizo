<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<!-- <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"> -->
  <!-- <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script> -->
 <!--  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css"> -->

<script type="text/javascript">
	/* $(document).ready(function(){
		
		$('#write').click(function(){
			$.ajax({
		    	  url:'notice.do',
		    	  data:{action:"form"},
		    	  type:'GET',
		    	  success:function(){
		    		  location.href="input_form.jsp";
		    	  }
		      });//ajax	
		});
	}); */

	$(document).ready(function() {
		$('#write').on("click", function() {
			self.location = "/qna/input_form";
		});
		
		$('#searchBtn').on("click",function(event) {
			self.location = "qnaPage"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword=" + $('#keywordInput').val();
				});
		
		 $("#keywordInput").keydown(function(e){
	            if(e.keyCode==13){
	            	self.location = "qnaPage"
						+ '${pageMaker.makeQuery(1)}'
						+ "&searchType="
						+ $("select option:selected").val()
						+ "&keyword=" + $('#keywordInput').val();
	            }
	         })//엔터 검색
	});
</script>
</head>
<style type="text/css">
a {
	text-decoration: none
}
</style>
<body>
	<center>
		<!-- <img src="../noticeimage/공지사항.JPG" style="width: 20%"> <br> -->
		<br>
		<br>
		<!-- ------------------------------------검색창----------------------------------------- -->
		
			<div class='box-body'>

					<select name="searchType" class="w3-white w3-border w3-border-orange w3-hover-orange">
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
					<input type="text" name='keyword' id="keywordInput" class="w3-white w3-border w3-border-orange w3-hover-orange"
						value='${cri.keyword }'>
					<button id='searchBtn' class="w3-btn w3-white w3-border w3-border-orange w3-hover-orange w3-round-large">검색</button>

					<c:if test="${id != null }">
					<button
					class="w3-btn w3-white w3-border w3-border-orange w3-hover-orange w3-round-xlarge"
					id='write'>글쓰기</button>
					</c:if>
				</div>
		
		<!-- ----------------------------------------------------------------------------- -->
		<br>
		<div class="w3-container"
			style="padding-left: 10%; padding-right: 10%">
			<table class="w3-table w3-bordered w3-card-4">
				<tr class="w3-orange">
					<th width="7%">번호</th>
					<th width="15%">작성자</th>
					<th width="45%">제목</th>
					<th width="25%">작성일</th>
					<th width="8%">조회수</th>
					
				</tr>
				<c:forEach var="qna" items="${list}" varStatus="stat">
					<tr class="w3-text-orange">
						<td>${qna.qna_no}</td>
						<td>${qna.qna_writer}</td>
						<td class="w3-hover-orange"><a
							href="/qna/read_form${pageMaker.makeQuery(pageMaker.cri.page) }&no=${qna.qna_no}">
								${qna.qna_title}</a> [${qna.qna_replycnt }] </td>
						<td>${qna.qna_regdate}</td>
						<td>${qna.qna_viewcnt}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br>
		<br>
		<div class="w3-text-orange">
		
			 <ul class="w3-pagination">

				<c:if test="${pageMaker.prev}">
					<li><a
						href="qnaPage${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a href="qnaPage${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="qnaPage${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
				</c:if>

			</ul>
		</div>
		<%-- <form id="jobForm">
  			<input type='hidden' name="page" value=${pageMaker.cri.page}>
  			<input type='hidden' name="perPageNum" value=${pageMaker.cri.perPageNum}>
  			<input type='hidden' name='searchType' value="${cri.searchType}">
			<input type='hidden' name='keyword' value="${cri.keyword}">
		</form> --%>
		
	</center>

	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		}
		
		/*  $(".w3-pagination li a").on("click", function(event){
			
			event.preventDefault(); 
			
			var targetPage = $(this).attr("href");
			
			var jobForm = $("#jobForm");
			jobForm.find("[name='page']").val(targetPage);
			jobForm.attr("action","/notice/noticePage").attr("method", "get");
			jobForm.submit();
		});  */
	</script>
</body>
</html>