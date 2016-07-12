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
<script type="text/javascript">
	$(document).ready(function() {
		$('#write').on("click", function() {
			self.location = "/notice/input_form";
		});
		
		$('#searchBtn').on("click",function(event) {
			self.location = "noticePage"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword=" + $('#keywordInput').val();
		});
		
		 
		 $("#keywordInput").keydown(function(e){
	            if(e.keyCode==13){
	            	self.location = "noticePage"
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
<br>
	<center>
			
			<div class='box-body'>

					<select name="searchType" class="w3-white w3-border w3-border-pink w3-hover-pink">
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
					<input type="text" name='keyword' id="keywordInput" class="w3-white w3-border w3-border-pink w3-hover-pink"
						value='${cri.keyword }'>
					<button id='searchBtn' class="w3-btn w3-white w3-border w3-border-pink w3-hover-pink w3-round-large">Search</button>
					
					<c:if test="${m_check != null}"> 	
					<button class="w3-btn w3-white w3-border w3-border-pink w3-hover-pink w3-round-large"
						id='write'>글쓰기</button>
					</c:if>
				</div>

		
		<!-- ----------------------------------------------------------------------------- -->
		<br>
		<div class="w3-container"
			style="padding-left: 10%; padding-right: 10%">
			<table class="w3-table w3-bordered w3-card-4">
				<tr class="w3-pink">
					<th width="7%">번호</th>
					<th width="15%">작성자</th>
					<th width="45%">제목</th>
					<th width="25%">작성일</th>
					<th width="8%">조회수</th>
				</tr>
				<c:forEach var="notice" items="${list }" varStatus="stat">
					<tr bgcolor="#fff6f6" class="w3-text-pink">
						<td>${notice.notice_no}</td>
						<td>${notice.notice_writer}</td>
						<td class="w3-hover-pink"><a
							href="/notice/read_form${pageMaker.makeQuery(pageMaker.cri.page) }&no=${notice.notice_no}">
								${notice.notice_title}</a> [${notice.notice_replycnt }] </td>
						<td>${notice.notice_regdate}</td>
						<td>${notice.notice_viewcnt}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br>
		<br>
		<div class="w3-text-pink">
		
			 <ul class="w3-pagination">

				<c:if test="${pageMaker.prev}">
					<li><a
						href="noticePage${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage }"
					end="${pageMaker.endPage }" var="idx">
					<li
						<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
						<a href="noticePage${pageMaker.makeSearch(idx)}">${idx}</a>
					</li>
				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="noticePage${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
				</c:if>

			</ul>
		</div>
		
	</center>

	<script>
		var result = '${msg}';

		if (result == 'SUCCESS') {
			alert("처리가 완료되었습니다.");
		}
	</script>
</body>
</html>