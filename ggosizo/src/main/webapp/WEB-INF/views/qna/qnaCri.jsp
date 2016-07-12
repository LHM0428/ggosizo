<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="/ggosizo_project/js/jquery2.js"></script>
<link rel="stylesheet" type="text/css"
	href="/ggosizo_project/main/mainview/footer.css">
<link rel="stylesheet" type="text/css"
	href="/ggosizo_project/main/mainview/nav.css">
<link rel="stylesheet" type="text/css"
	href="/ggosizo_project/main/mainview/header.css">
<link rel="stylesheet" type="text/css"
	href="/ggosizo_project/main/mainview/sidebar.css">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">

<script type="text/javascript"
	src="/ggosizo_project/main/mainview/_main_view.js"></script>
<style type="text/css">
a {
	text-decoration: none
}
</style>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('#write').on("click", function() {
					self.location = "/qna/input_form";
				});

				$('#searchBtn').on(
						"click",
						function(event) {
							self.location = "noticePage"
									+ '${pageMaker.makeQuery(1)}'
									+ "&searchType="
									+ $("select option:selected").val()
									+ "&keyword=" + $('#keywordInput').val();
						});
			});
</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q&A</title>
</head>
<body>
	<center>
		<div id="main_header"></div>
	</center>
	<div id="main_nav"></div>
	<br>
	<img src="../QnAimage/qa상표.JPG" style="width: 10%; margin-left: 330px">
	<center>
		<button
			class="w3-btn w3-white w3-border w3-border-deep-orange w3-hover-deep-orange w3-round-xlarge"
			style="margin-left: 750px" id='write'>글쓰기</button>
		<br>
		<div class="w3-container">
			<table cellpadding="5" width="70%">
				<tr bgcolor="pink">
					<th width="7%">번호</th>
					<th width="15%">작성자</th>
					<th width="45%">제목</th>
					<th width="25%">작성일</th>
					<th width="8%">조회수</th>
					<th width="8%">리플수</th>
				</tr>
				<c:forEach var="qna" items="${list }" varStatus="stat">
					<tr bgcolor="#fff6f6" class="w3-text-pink">
						<td>${qna.qna_no}</td>
						<td>${qna.qna_writer}</td>
						<td class="w3-hover-pink"><a
							href="/qna/read_form${pageMaker.makeQuery(pageMaker.cri.page) }?no=${qna.qna_no}">
								${qna.qna_title}</a></td>
						<td>${qna.qna_regdate}</td>
						<td>${qna.qna_viewcnt}</td>
						<td>${qna.qna_replycnt}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<br> <br>
		<div class="w3-text-yellow">
			<c:forEach var="i" begin="1" end="${totalPage }" step="1">
		[<a href="javascript:location.href='QnA.do?page=${ i}'">${ i}</a>]
	</c:forEach>
		</div>
	</center>

	<!-- --------------------------슬라이드 이미지 구성 끝------------------------------ -->
	<br>
	<br>
	<div id="main_footer"></div>
	<script >
var result = '${msg}';

if(result == 'SUCCESS'){
	alert("처리가 완료되었습니다.");
}

</script>
</body>
</html>
