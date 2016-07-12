<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>축제 입력</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/w3/css/w3_bodacious.css" rel="stylesheet" type="text/css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			 var formObj = $("form[role='form']");
	    	 var selectSido = '${festival.si}';
	    	  $.ajax({
		    	  url:'/mypage/selecSido',
		    	  data:{selectSido:selectSido},
		       	  method:'POST',
		       	  success:function(result){
		       		  $('#sp1').html(result);
		       		  $('select[name=u_addr1]').attr("name","sido");
		       		 var sido = $('select[name=sido]').val();
		       		var selectGugun = '${festival.gugun}';
				      $.ajax({
				    	  url:'/mypage/selecGugun',
				    	  method: "POST",
				       	  data:{
				       		    sido:sido,
				       		 selectGugun:selectGugun
				       	  },
				       	  success:function(result){
				       		 $('#sp2').html(result);
				       		$('select[name=u_addr2]').attr("name","gugun");
				       		var gugun = $('select[name=gugun]').val();
				       		var selectDong = '${festival.dong}';
					      $.ajax({
					    	  url:'/cafe/selecGugun',
					    	  method: "POST",
					       	  data:{
					       		    gugun:gugun,
					       		    selectDong:selectDong
					       	  },
					       	  success:function(result){
					       		  $('#sp3').html(result);
					       	  } 
					      });
				       	  } 
				      });
		       	  }
		      });
		      
		      $('#sp1').change(function(){
			      var sido = $('select[name=sido]').val();
			      $.ajax({
			    	  url:'/mypage/selecGugun',
			    	  method: "POST",
			       	  data:{
			       		    sido:sido
			       	  },
			       	  success:function(result){
			       		  $('#sp2').html(result);
			       		$('select[name=u_addr2]').attr("name","gugun");
			       	  } 
			      });
		      });//sido change
		      $('#sp2').change(function(){
			      var gugun = $('select[name=gugun]').val();
			      $.ajax({
			    	  url:'/cafe/selecGugun',
			    	  method: "POST",
			       	  data:{
			       		    gugun:gugun
			       	  },
			       	  success:function(result){
			       		  $('#sp3').html(result);
			       	  } 
			      });
		      });//sido change
	      
	    //사진미리보기
			$('#files').change(function(){
				alert(this.value); //선택한 이미지 경로 표시
				if(this.value != ""){
					readURL(this);
					$('#photo_div').show();
			      } else {
			        $('#photo_div').hide();
			      }
			});
			
			function readURL(input) {
			   if (input.files && input.files[0]) {
			      var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
			      reader.onload = function(e) {
			        	 
			         //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
			            $('#photo_div').show()
			            $('#photo').attr('src', e.target.result);
			            
			         //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
			         //(아래 코드에서 읽어들인 dataURL형식)
			      }
			      reader.readAsDataURL(input.files[0]);
			      //File내용을 읽어 dataURL형식의 문자열로 저장
			   }
		    }//readURL()--
		    
			$("#modify").click(function(){
					alert("gugun : ");
					formObj.submit();	
			});
		    
			$("#delete").on("click",function(){
				self.location="/festival/removePage?no=${param.no}";
			});
			
			$("#list").on("click",function(){
				self.location ="/festival/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
						+"&searchType=${cri.searchType}&keyword=${cri.keyword}&month=${cri.month}";
			});
	      
		});
		</script>
</head>
<body>


<form role='form' action="/festival/updateForm" method="post" enctype="multipart/form-data">
	<input type="hidden" name="viewcnt" value="${festival.viewcnt}">
	<input type="hidden" name="replycnt" value="${festival.replycnt}">
	<input type="hidden" name="likecnt" value="${festival.likecnt}">
	<input type='hidden' name='no' value="${festival.no}">
	<c:if test="${not empty param.page }">
	<input type='hidden' name='page' value="${param.page}">
	<input type='hidden' name='perPageNum' value="${param.perPageNum}">
	</c:if>
	<c:if test="${empty param.page }">
	<input type='hidden' name='page' value="1">
	<input type='hidden' name='perPageNum' value="10">
	</c:if>
	<input type="hidden" name="addr" value="${festival.addr }">
	<input type="hidden" name="category" value="축제">
	
<div class="w3-container w3-row">
	<div class="w3-col m3">&nbsp;</div>
	<div class="w3-col m6">
		<div class="w3-card-8 w3-white">
			<div class="w3-container w3-center w3-theme w3-text-white w3-round">
				<h2>축제 수정</h2>
			</div>
		</div>
		<div class="w3-container w3-card-8 w3-white w3-round">
		<br>
			<label>작성자</label>
			<input type="text" class="w3-input" style="width:30%" id="writer" name="writer" value="${festival.writer}" readonly="readonly">
			<label>축제명</label>
			<input type="text" class="w3-input w3-animate-input" id="name" name="name" style="width:30%" value="${festival.name}" required="required">
			<label>주소선택</label><br>
			<span id="sp1"></span>
			<span id="sp2"><select class='w3-btn w3-theme w3-hover-white w3-round-large'><option>선택</option></select></span>
			<span id="sp3"><select class='w3-btn w3-theme w3-hover-white w3-round-large'><option>선택</option></select></span><br>
			<label>상세주소</label>
			<textarea id="coming" name="coming" class="w3-input w3-border"
			style="width:100%; height:80px; resize: none;">${festival.coming}</textarea>
			<label>가격</label>
			<input type="text" class="w3-input w3-animate-input" id="price" name="price" style="width:30%" value="${festival.price}">
			<label>축제설명</label>
			<textarea id="content" name="content" class="w3-input w3-border"
			style="width:100%; height:150px; resize: none;">${festival.content}</textarea>
			<label>축제일시</label><br>
			<select name="year1" id="year1">
					<%
						int year1 = (Integer)session.getAttribute("year1");
						
						for(int i=16; i<=50;i++){
							if(i==year1){
								out.write("<option  value='"+i+"' selected='selected'>"+i+"</option>");
							}else{
								out.write("<option  value='"+i+"'>"+i+"</option>");								
							}
						}
					%>
				</select>년
				<select name="month1" id="month1">
					<%
						int month1 = (Integer)session.getAttribute("month1");
					
						for(int i=1; i<=12;i++){
							if(i==month1){
								if(i<10){
									out.write("<option value='0"+i+"' selected='selected'>0"+i+"</option>");
								}else{
									out.write("<option value='"+i+"' selected='selected'>"+i+"</option>");								
								}
							}else{
								if(i<10){
									out.write("<option value='0"+i+"' >0"+i+"</option>");
								}else{
									out.write("<option value='"+i+"'>"+i+"</option>");								
								}
							}
							
						}
					%>
				</select>월
				<select name="day1" id="day1">
					<%
						int day1 = (Integer)session.getAttribute("day1");
						for(int i=1; i<=31;i++){
							if(i==day1){
								if(i<10){
									out.write("<option value='0"+i+"' selected='selected'>0"+i+"</option>");
								}else{
									out.write("<option value='"+i+"' selected='selected'>"+i+"</option>");								
								}
							}else{
								if(i<10){
									out.write("<option value='0"+i+"' >0"+i+"</option>");
								}else{
									out.write("<option value='"+i+"'>"+i+"</option>");								
								}
							}
						}
					%>
				</select>일 ~
				<select name="year2" id="year2">
					<%
					int year2 = (Integer)session.getAttribute("year2");
					
					for(int i=16; i<=50;i++){
							if(i==year2){
								out.write("<option value='"+i+"' selected='selected'>"+i+"</option>");
							}else{
								out.write("<option value='"+i+"'>"+i+"</option>");								
							}
						}
					%>
				</select>년
				<select name="month2" id="month2">
					<%
					int month2 = (Integer)session.getAttribute("month2");
					
					for(int i=1; i<=12;i++){
						if(i==month2){
							if(i<10){
								out.write("<option value='0"+i+"' selected='selected'>0"+i+"</option>");
							}else{
								out.write("<option value='"+i+"' selected='selected'>"+i+"</option>");								
							}
						}else{
							if(i<10){
								out.write("<option value='0"+i+"'>0"+i+"</option>");
							}else{
								out.write("<option value='"+i+"'>"+i+"</option>");								
							}
						}
					}
					%>
				</select>월
				<select name="day2" id="day2">
					<%
					int day2 = (Integer)session.getAttribute("day2");
					for(int i=1; i<=31;i++){
						if(i==day2){
							if(i<10){
								out.write("<option value='0"+i+"' selected='selected'>0"+i+"</option>");
							}else{
								out.write("<option value='"+i+"'  selected='selected'>"+i+"</option>");								
							}
						}else{
							if(i<10){
								out.write("<option value='0"+i+"'>0"+i+"</option>");
							}else{
								out.write("<option value='"+i+"'>"+i+"</option>");								
							}
						}
					}
					%>
				</select>일<br>
			
			<label>연락처</label>
			<input type="text" class="w3-input w3-animate-input" name="tel" id="tel" style="width:40%" value="${festival.tel}">
			<label>운영시간</label>
			<input type="text" class="w3-input w3-animate-input" name="openhour" id="openhour" style="width:40%" value="${festival.openhour}"> 
			<label>휴관일</label>
			<input type="text" class="w3-input w3-animate-input" name="closeday" id="closeday" style="width:40%" value="${festival.closeday}">
			<label>홈페이지</label>
			<input type="text" class="w3-input w3-animate-input" name="url" id="url" style="width:40%" value="${festival.url}">
			<label>사진</label>
			<div class="col-lg-12" id="photo_div">
            	<img alt="첨부 이미지가 없습니다." src="${festival.img }" id="photo" width="250px" height="200px" >
            </div>
			<input type="file" class="w3-input w3-animate-input" id="files" name="files">
			<br>
			<div align="center">
				<button type="button" id="modify" class="btn btn-primary">수정</button>
				<button id="list" class="btn btn-danger">목록</button>
			</div>
			<br>
		</div>
	</div>
</div>
</form>
</body>
</html>