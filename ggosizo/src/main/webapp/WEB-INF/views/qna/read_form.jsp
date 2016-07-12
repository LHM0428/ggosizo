<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="http://www.w3schools.com/lib/w3-theme-orange.css">


<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="/resources/notice/notice.js"></script>

<script type="text/javascript">
		$(document).ready(function() {
			var formObj = $("form[role='form']");
			 var qna_no = ${qna.qna_no }; 
			 var no = ${qna.qna_no }; 
			 var replyPage = 1;
			
			console.log(formObj);

			$('#edit').on("click", function(){
				formObj.attr("method", "get");		
				formObj.submit();
			});
			$("#delete").on("click",function() {
				formObj.attr("action", "/qna/delete");
				formObj.submit();				
			});

			$('#list').on("click",function(){
				self.location ="/qna/qnaPage?page=${cri.page}&perPageNum=${cri.perPageNum}"
						+"&searchType=${cri.searchType}&keyword=${cri.keyword}";
			});
			
			$("#myBtn").click(function(){				
			    alert('myBtn');
		        //$("#modifyModal").modal();
		    });

			//댓글처리
			inItNo(no)
			getPage("/qnaReplies/"+no+"/1");
			
			$("#addReply").click(function(){
				addReply("qna",no)
				alert('댓글이입력되었습니다.');
				getPage("/qnaReplies/"+no+"/1");
			})
			
			  $(".w3-pagination").on("click", "li a", function(event){
					
					event.preventDefault();
					
					replyPage = $(this).attr("href");
					
					getPage("/qnaReplies/"+no+"/"+replyPage);
					
				}); 
			
			
			 
			
			
		});
		</script>

</head>
<body>
	<div class="w3-container"
			style="padding-left: 10%; padding-right: 10%">
	<form role="form" action="/qna/update_form" method="post">
			<input type="hidden" name='page' value="${cri.page}"> <input
				type='hidden' name='perPageNum' value="${cri.perPageNum}"> <input
				type='hidden' name='searchType' value="${cri.searchType}"> <input
				type='hidden' name='keyword' value="${cri.keyword}">


			<table style="width: 100%; height: auto;" class="w3-table w3-bordered w3-card-4">
				<tr class="w3-round-large w3-theme">
					<th>category</th>
					<th>contents</th>
				</tr>
				<tr>
					<td>글번호</td>
					<td><input type="text" style="border: none;"
							readonly="readonly" name="qna_no" value="${qna.qna_no }"></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><input type="text" style="border: none;"
								readonly="readonly" name="qna_writer" value="${qna.qna_writer }"></td>
						</tr>
						<tr>
							<td>제목</td>
							<td><input type="text" style="border: none;"
								readonly="readonly" name="qna_title" value="${qna.qna_title }"></td>
						</tr>
						<tr>
							<td>내용</td>
							<td><textarea rows="8" readonly="readonly" cols="40"
									name="qna_content">${qna.qna_content }</textarea></td>
						</tr>
					
			</table>
			<br>
			<!-- <input type="submit" value="수정">
	           <input type="reset" value="취소"> -->

		</form>
		<button class="w3-btn w3-theme-d1 w3-round-large"
			onclick="openInputReply()">
			<i class="fa fa-comment"></i>&nbsp;댓글
		</button>
		<c:if test="${u_id eq qna.qna_writer }">
			<button id="edit"
				class="w3-btn w3-white w3-border w3-border-orange
			 w3-round-xlarge w3-hover-orange">수정</button> &nbsp; 
			<button id="delete"
				class="w3-btn w3-white w3-border w3-border-orange
			 w3-round-xlarge w3-hover-orange">삭제</button>
		</c:if>
		<button id="list"
			class="w3-btn w3-white w3-border w3-border-orange
			 w3-round-xlarge w3-hover-orange">목록</button>

		<!-- <button type="summit" id="edit">수정</button>
	     	   <button type="button" id="delete">삭제</button>
	     	   <button type="button" id="list">목록</button> -->
	

  <!-- 댓글 -->     
	     <div class="w3-text-theme w3-container w3-padding  w3-round-large" style="width:23%">
	 <i class="fa fa-comments-o"></i>&nbsp;댓글 리스트 <small name='replycntSmall'>[ ${qna.qna_replycnt} ]</small>
	 </div>

	 <div class="w3-row-padding" id="inputReply" style="display: none;">
	       	<input type="hidden" value='${u_id }' name='newReplyWriter' id='newReplyWriter'>
		        <div class="w3-col m12">
		          <div class="w3-card-2 w3-round w3-theme-l4">
		            <div class="w3-container w3-padding">
		              <h6 class="w3-opacity">작성자 : ${u_id}</h6>
		              <p><input type="text" class="w3-border w3-padding" style="width:50%"
			              name='replytext' id='newReplyText' placeholder='댓글 입력'></p>
			          <button id="addReply" class="w3-round-large w3-btn w3-theme">
			       	<i class="fa fa-pencil"></i>&nbsp;등록</button>
				      <button onclick='closeInputReply()' class='w3-round-large w3-btn w3-theme'>
				   	<i class="fa fa-times"></i>&nbsp;취소</button>
				    </div>
				   </div>
				 </div>
				</div>
	<ul id="repliesDiv" class="w3-ul"></ul>
	
	<div class="text-center">
	<ul class='w3-pagination w3-small pagi' id="replyPagination"></ul>
	</div> 
	
</div>
</div>

<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li id="replyLi" data-no={{reply_no}}>
<div class="w3-container w3-theme-border w3-leftbar" >
<span class="w3-header w3-large">{{reply_no}}.{{reply_writer}}</span>
<span class="w3-padding w3-medium w3-right">
<i class="fa fa-clock-o">&nbsp;{{prettifyDate reply_regdate}}</i></span>
<div class="w3-body" id="reply_content{{reply_no}}" style="width:600px;">{{reply_content}}</div>
<span calss="w3-footer w3-padding-right">
<c:if test="${id eq reply_writer }">
<button class="w3-right w3-btn w3-small w3-slim w3-white w3-border w3-hover-theme w3-theme-border w3-round"
onclick="openModifyWindow('{{reply_no}}', '${u_id}')">댓글 수정</button>
</c:if>
</span>
</div>
</li>
	<div class="w3-container" id="modifyWindow{{reply_no}}" style="display : none;">
	<div class="modDiv w3-card-2 w3-round w3-theme-l4">
		<h6 class='w3-padding modal-title w3-opacity' id="modal-title{{reply_no}}"></h6>
		<div>
			&nbsp;<textarea id='modReplytext{{reply_no}}' cols="70%" rows="2"></textarea>
		</div>
		<div class='w3-padding'>
			<button class="w3-round-large w3-btn w3-theme" onclick="replyModify('{{reply_no}}', 'qna')">
				<i class="fa fa-pencil-square-o"></i>&nbsp;수정</button>
			<button class="w3-round-large w3-btn w3-theme" onclick="replyDelete('{{reply_no}}', 'qna')">
				<i class="fa fa-eraser"></i>&nbsp;삭제</button>
			<button class="w3-round-large w3-btn w3-theme" onclick="replyClose('{{reply_no}}')">
				<i class="fa fa-times"></i>&nbsp;취소</button>
		</div>
	</div>
	</div>
{{/each}}

	     
</script>




	<!-- 댓글 끝 -->
</body>
</html>