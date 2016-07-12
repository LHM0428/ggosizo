<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
		$(document).ready(function(){
			
			var formObj = $("form[role='form']");
			/* var fileFormObj = $("form[role='fileForm']"); */
			
			$('#insert').on("click",function(){
				var qna_title = $('#qna_title').val();
				var qna_content = $('#qna_content').val();
			
				if(qna_title==""){
					alert('제목은 필수입력사항입니다.');
				}else if(qna_content==''){
					alert('내용을 입력해주세요.');
				}else{
					formObj.attr("action", "/qna/input_form");
					formObj.attr("method", "post");		
					formObj.submit();					
				}
			});
			$('#list').on("click",function(){
				self.location ="/qna/qnaPage?page=${cri.page}&perPageNum=${cri.perPageNum}"
						+"&searchType=${cri.searchType}&keyword=${cri.keyword}";
			});
			
			
		});
	</script>
</head>
<body>
		<div class="w3-container"
			style="padding-left: 10%; padding-right: 10%">
		<form   role="form" action="/qna/input_form" method="post"
			enctype="multipart/form-data">
			<input type='hidden' name='page' value="${cri.page}"> <input
				type='hidden' name='perPageNum' value="${cri.perPageNum}"> <input
				type='hidden' name='searchType' value="${cri.searchType}"> <input
				type='hidden' name='keyword' value="${cri.keyword}">

			<table style="width: 100%; height: auto;" class="w3-table w3-bordered w3-card-4">
				<tr >
					<td bgcolor="orange" width="80px">작성자</td>
					<td width="800px" colspan="2"><input type="text"
						name="qna_writer" readonly="readonly" value="${u_id }"></td>
				</tr>
				<tr>
					<td bgcolor="orange" width="80px">제목</td>
					<td width="800px" colspan="2"><input type="text"
						name="qna_title" id="qna_title"></td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="15" cols="84"
							name="qna_content" id="qna_content"></textarea></td>
				</tr>
			</table>
			<br> <br>
		</form>
		<button type="submit" id="insert"
			class="w3-btn w3-white w3-border w3-border-orange
			 w3-round-xlarge w3-hover-orange">등록</button>
		<button type="button" id="list"
			class="w3-btn w3-white w3-border w3-border-orange
			 w3-round-xlarge w3-hover-orange">목록</button>
</body>
</html>