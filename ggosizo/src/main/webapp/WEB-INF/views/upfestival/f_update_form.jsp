<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>축제 입력</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/resources/w3/css/w3_bodacious.css" rel="stylesheet" type="text/css" />
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
	    	  var formObj = $("form[role='form']");
	    	 
	    	  $.ajax({
		    	  url:'/mypage/selecSido',
		       	  method:'POST',
		       	  success:function(result){
		       		  $('#sp1').html(result);
		       		  $('select[name=u_addr1]').attr("name","sido");
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
				formObj.submit();	
			});
		    
			$("#delete").on("click",function(){
				formObj.attr("action", "/festival/removePage");
				formObj.submit();
			});
			
			$("#list").on("click",function(){
				self.location ="/festival/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
						+"&searchType=${cri.searchType}&keyword=${cri.keyword}&month=${cri.month}";
			});
	      
		});
		</script>
</head>
<body>
<input type="hidden" name="viewcnt" value="0">
<input type="hidden" name="replycnt" value="0">
	<center>
	<!--  -->
		<form role="form" action="/festival/updateForm" method="post" enctype="multipart/form-data">
			<input type='hidden' name='no' value="${festival.no}">
			<input type='hidden' name='page' value="${param.page}">
			<input type='hidden' name='perPageNum' value="${param.perPageNum}">
	
		
		<table class="w3-table w3-striped w3-bordered w3-border">
			<tr><td width=10%>작성자</td>	<td><input type="text" name="writer" value="${festival.writer}"></td></tr>
			<tr><td width=10%>축제 명</td>	<td><input type="text" name="name" value="${festival.name}"></td></tr>
			<tr><td width=10%>주소 선택</td>
				<td><span id="sp1"></span>
					<span id="sp2"><select><option>선택</option></select></span>
					<span id="sp3"><select><option>선택</option></select></span>
				</td></tr>
			<tr><td width=10%>축제 컨셉</td>
				<td><input type="text" name="category" value="${festival.category}"></td></tr>	
			<tr><td width=10%>가격</td>
				<td><textarea name="price" rows="3" cols="25">${festival.price}</textarea></td></tr>	
			<tr><td width=10%>축제 설명</td>
				<td><textarea name="content" rows="5" cols="50">${festival.content}</textarea></td></tr>
			<tr><td width=10%>상세주소</td>
				<td><input type="text" name="addr" size="48px" value="${festival.addr}"></td></tr>
			<tr><td width=10%>축제 일시</td>
				<td><select name="year1" id="year1">
					<%
						int year1 = (Integer)session.getAttribute("year1");
						
						for(int i=16; i<=50;i++){
							if(i==year1){
								out.write("<option selected='selected'>"+i+"</option>");
							}else{
								out.write("<option>"+i+"</option>");								
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
									out.write("<option selected='selected'>0"+i+"</option>");
								}else{
									out.write("<option selected='selected'>"+i+"</option>");								
								}
							}else{
								if(i<10){
									out.write("<option>0"+i+"</option>");
								}else{
									out.write("<option>"+i+"</option>");								
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
									out.write("<option selected='selected'>0"+i+"</option>");
								}else{
									out.write("<option selected='selected'>"+i+"</option>");								
								}
							}else{
								if(i<10){
									out.write("<option>0"+i+"</option>");
								}else{
									out.write("<option>"+i+"</option>");								
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
								out.write("<option selected='selected'>"+i+"</option>");
							}else{
								out.write("<option>"+i+"</option>");								
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
								out.write("<option selected='selected'>0"+i+"</option>");
							}else{
								out.write("<option selected='selected'>"+i+"</option>");								
							}
						}else{
							if(i<10){
								out.write("<option>0"+i+"</option>");
							}else{
								out.write("<option>"+i+"</option>");								
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
								out.write("<option selected='selected'>0"+i+"</option>");
							}else{
								out.write("<option selected='selected'>"+i+"</option>");								
							}
						}else{
							if(i<10){
								out.write("<option>0"+i+"</option>");
							}else{
								out.write("<option>"+i+"</option>");								
							}
						}
					}
					%>
				</select>일</td></tr>
			<tr><td width=10%>오시는 길</td>
				<td><textarea name="coming" rows="2" cols="50">${festival.coming}</textarea></td></tr>	
			<tr><td width=10%>연락처</td>
				<td><input type="text" name="tel" size="30px" value="${festival.tel}"></td></tr>	
			<tr><td width=10%>운영 시간</td>
				<td><input type="text" name="openhour" size="30px" value="${festival.openhour}"></td></tr>	
			<tr><td width=10%>쉬는 날</td>
				<td><input type="text" name="closeday" size="30px" value="${festival.closeday}"></td></tr>	
			<tr><td width=10%>사진</td>
				<td><input type="file" id="files" name="files" value="${festival.img}">
				
				<!-- 사진 미리보기 -->					
				<div class="col-lg-12" id="photo_div">
                     <img alt="첨부 이미지가 없습니다." src="/resources/uploadFiles/${festival.img }" id="photo" width="250px" height="200px" >
                </div>	
				</td>	
			</tr>	
			<tr><td width=10%>홈페이지</td>
				<td><input type="text" name="url" size="30px" value="${festival.url}"></td></tr>	
		</table>
	</form>
	</center>
	<!-- <input type="hidden" id="startdate" name="startdate" value="">
	<input type="hidden" id="enddate" name="enddate" value=""> -->
			<button id="modify" class="btn btn-primary">수정</button>
			<button id="delete">삭제</button>
			<button id="list">목록</button>
</body>
</html>