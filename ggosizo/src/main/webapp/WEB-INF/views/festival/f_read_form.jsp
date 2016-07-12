<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
		
<link href="/resources/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
		
		<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
		<link rel="stylesheet" href="http://www.w3schools.com/lib/w3-theme-pink.css">
		<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="/resources/plugin/handlebars/handlebars-v4.0.5.js"></script>
<script src="/resources/festival/festival.js"></script>	
	<script type="text/javascript">
	var no = '${param.no}';
	var loginId = '${id}';
		$(document).ready(function(){
			if(loginId==null)loginId='${m_check}';
			inIt(no,loginId);
			getPage('/festivalReplies/'+no+'/1');
			checkLike();
			var formObj = $("form[role='form']");
			
			$("#addReply").click(function(){
				addReply("festival",no);
				alert('댓글이 등록되었습니다.')
				getPage('/festivalReplies/'+no+'/1');
			})
			
			  $(".w3-pagination").on("click", "li a", function(event){
					
					event.preventDefault();
					
					replyPage = $(this).attr("href");
					
					getPage("/festivalReplies/"+no+"/"+replyPage);
					
				}); 
			
			$('#update').on("click", function(){
				alert("수정폼왔어요");
				formObj.attr("method", "get");	
				formObj.submit();
			});
			
			$('#delete').on("click",function(){
				alert("삭제폼왔어요")
				formObj.attr("action", "/festival/removePage");
				formObj.attr("method", "post");	
				formObj.submit();
			});

			$('#list').on("click",function(){
				self.location ="/festival/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
						+"&searchType=${cri.searchType}&keyword=${cri.keyword}&month=";
			});
			
		});	
	</script>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- --------------------------슬라이드 이미지 구성------------------------------ -->
<br>
<div id="section">
	<div class="contents">
	<center>
	<form role="form" action="/festival/updateForm"  method="get">
		<table cellpadding="10" border="1" width="60%" >
			<tr class="w3-round-large w3-theme w3-padding w3-margin-bottom">
				<th>이미지</th>
				<th>category</th>
				<th>contents</th>
			</tr>
			<tr>
				<td rowspan="11"><img alt="../festivalview.이미지준비중.JPG" src="${festival.img }" style="height:250px; width:330px">
				</td>
				<font size="4" face="굴림">
				<tr>
					<td >축제명</td> 
					<td>${festival.name}</td>
				</tr>
				<tr>
					<td>축제일시</td> 
					<td>${festival.startdate} ~ ${festival.enddate}</td>
				</tr>
				<tr>
					<td>축제시간</td> 
					<td>${festival.openhour}</td>
				</tr>
				<tr>
					<td>주소</td> 
					<td>${festival.addr}</td>
				</tr>
				<tr>
					<td>사이트</td> 
					<td><a href=${festival.url}>${festival.url}</a></td>
				</tr>
				<tr>
					<td>전화</td> 
					<td>${festival.tel}</td>
				</tr>
				<tr>
					<td>지역</td> 
					<td>${festival.si} ${festival.gugun} ${festival.dong}</td>
				</tr>
				<tr>
					<td>이용요금</td> 
					<td>${festival.price}</td>
				</tr>
				<tr>
					<td>내용</td> 
					<td>${festival.content}</td>
				</tr>
				<tr>
					<td>작성자</td> 
					<td>${festival.writer}</td>
				</tr>
				<input type="hidden" name="no" value="${festival.no}">
				</font>
				</td>
			</tr>
		</table>
		</form>
		<br>
		<hr width="70%">
		<br>
		 
		 <c:if test="${id == null}"> 
		<button class="w3-btn w3-theme w3-round-large"  disabled="disabled" onclick="openInputReply()">
		 <i class="fa fa-comment"></i>&nbsp;댓글</button>
		 </c:if>
		 <c:if test="${not empty id}"> 
		<button class="w3-btn w3-theme w3-round-large" onclick="openInputReply()">
		 <i class="fa fa-comment"></i>&nbsp;댓글</button>
		 </c:if>
		 <c:if test="${id == null}"> 
		 <button id="likeBtn"  class="w3-btn w3-dark-grey w3-round-large" onclick="likeUpdate()" disabled="disabled">
          <i class="fa fa-heart"></i>&nbsp;좋아요<small class="unlike" name='likecntSmall'>[ ${festival.likecnt} ]</small></button>
		 </c:if>
		 <c:if test="${not empty id}">
		 <button id="likeBtn"  class="w3-btn w3-dark-grey w3-round-large" onclick="likeUpdate()">
          <i class="fa fa-heart"></i>&nbsp;좋아요<small class="unlike" name='likecntSmall'>[ ${festival.likecnt} ]</small></button>
		 </c:if> 
		 
		 <c:if test="${id == festival.writer || not empty m_check}"> 
		 <button id="update"  class="w3-btn w3-white w3-border w3-border-pink
		 w3-round-xlarge w3-hover-pink">수정</button> &nbsp;
		  <button id="delete"  class="w3-btn w3-white w3-border w3-border-pink
		 w3-round-xlarge w3-hover-pink">삭제</button>
		 </c:if>
		 
		 <button id="list"  class="w3-btn w3-white w3-border w3-border-pink
		 w3-round-xlarge w3-hover-pink">목록</button>
	</center>
	
	<!-- 댓글 -->
	 <div class="w3-text-theme w3-container w3-padding w3-round-large" style="width:25%">
	 <i class="fa fa-comments-o"></i>&nbsp;댓글 리스트 <small name='replycntSmall'>[ ${festival.replycnt} ]</small>
	 </div>

	 <div class="w3-row-padding" id="inputReply" style="display: none;">
	       	<input type="hidden" value='${id }' name='newReplyWriter' id='newReplyWriter'>
		        <div class="w3-col m12">
		          <div class="w3-card-2 w3-round w3-theme-l4">
		            <div class="w3-container w3-padding">
		              <h6 class="w3-opacity">작성자 : ${id }</h6>
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
<button class="w3-right w3-btn w3-small w3-slim w3-white w3-border w3-hover-theme w3-theme-border w3-round"
onclick="openModifyWindow('{{reply_no}}','{{reply_writer}}')">댓글 수정</button>
</span>
</div>
</li>
	<div class="w3-container" id="modifyWindow{{reply_no}}" style="display : none;">
	<input type='hidden' value="{{reply_no}}" id="reply_no">
	<div class="modDiv w3-card-2 w3-round w3-theme-l4">
		<h6 class='w3-padding modal-title w3-opacity' id="modal-title{{reply_no}}"></h6>
		<div>
			&nbsp;<textarea id='modReplytext{{reply_no}}' cols="70%" rows="2"></textarea>
		</div>
		<div class='w3-padding'>
			<button class="w3-round-large w3-btn w3-theme" onclick="replyModify('{{reply_no}}', 'festival');getPage()">
				<i class="fa fa-pencil-square-o"></i>&nbsp;수정</button>
			<button class="w3-round-large w3-btn w3-theme" onclick="replyDelete('{{reply_no}}', 'festival');getPage()">
				<i class="fa fa-eraser"></i>&nbsp;삭제</button>
			<button class="w3-round-large w3-btn w3-theme" onclick="replyClose('{{reply_no}}')">
				<i class="fa fa-times"></i>&nbsp;취소</button>
		</div>
	</div>
	</div>
{{/each}}
</script>

<!-- --------------------------슬라이드 이미지 구성 끝------------------------------ -->
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div id="footer">
Copyright @ggosizo
</div>
</body>
</html>