<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카페 정보 수정</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="/resources/plugin/jquery/jquery.js"></script>
<link href="/resources/w3/css/w3_bodacious.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
			var selectGugun = '${param.gugun}';
			var selectDong = '${param.dong}';
		$(document).ready(function(){
		    	  var sido = $('#sp1').text();
		    	  $.ajax({
		    		  url:'/cafe/selecSido',
		        	  data:{
		        		    sido:sido,
		        		    selectGugun:selectGugun
		        	  },
		        	  method:'POST',
		        	  success:function(result){
		        		  $('#sp2').html(result);
		      		      var gugun = $('select[name=gugun]').val();
				    	 $.ajax({
				    		  url:'/cafe/selecGugun',
				    		  method: "POST",
				        	  data:{
				        		    gugun:gugun,
				        		    selectDong : selectDong
				        	  },
				        	  success:function(result){
				        		  $('#sp3').html(result);
				        	  }
				    	  });
		        	  }
		    	  });
		    	  

		    	  
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
		      });//sp2 change
				
  				$(".btn-warning").on("click",function() {
		    		self.location = "/cafe/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
		    					+ "&gugun=${cri.criGugun}&dong=${cri.criDong}";
		    	});

		    	$(".btn-primary").on("click",function() {
		    		var formObj = $("#form");
		    		formObj.attr("action", "/cafe/modify");
		    		formObj.attr("method", "POST");
		    		console.log(formObj)
		    		formObj.submit();
				});
		    	
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
				              /*  $('#photo_div').show() */
				               $('#photo').attr('src', e.target.result);
				            
				            //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
				            //(아래 코드에서 읽어들인 dataURL형식)
				         }
				         reader.readAsDataURL(input.files[0]);
				         //File내용을 읽어 dataURL형식의 문자열로 저장
				      }
				}//readURL()--
		});
		</script>
</head>
<body>
<form id="form" action="/cafe/modify" method="post" enctype="multipart/form-data">
	<input type='hidden' name='no' value="${cafe.no}">
	<c:if test="${not empty param.page }">
		<input type='hidden' name='page' value="${param.page}">
	</c:if>
	<c:if test="${empty param.page }">
		<input type='hidden' name='page' value="1">
	</c:if>
	<c:if test="${not empty param.perPageNum }">
		<input type='hidden' name='perPageNum' value="${param.perPageNum}">
	</c:if>
	<c:if test="${empty param.perPageNum }">
		<input type='hidden' name='perPageNum' value="10">
	</c:if>
	<input type='hidden' name='criGugun' value="${param.criGugun}">
	<input type='hidden' name='criDong' value="${param.criDong}">
	<input type="hidden" name="writer" value="${login }">
	<input type="hidden" name="addr" value="주소">
	<input type="hidden" name="si" value="서울">
	<input type="hidden" name="category" value="카페">
	
	
	<div class="w3-container w3-row">
	<div class="w3-col m3">&nbsp;</div>
	<div class="w3-col m6">
		<div class="w3-card-8 w3-white">
			<div class="w3-container w3-center w3-text-white w3-round" style="background-color:#b76ba3">
				<h2>카페 수정</h2>
			</div>
		</div>
		<div class="w3-container w3-card-8 w3-white w3-round">
			<br> <label>음식점 명</label><br> 
			<input class="w3-input w3-animate-input" type="text" name="name"
				style="width: 40%" value="${cafe.name}" required> 
			<label>주소선택</label><br>
			<span id="sp1">서울</span> 
			<span id="sp2">
			<select class='w3-btn w3-theme w3-hover-white w3-round-large'>
			</select>
			</span> 
			<span id="sp3">
			<select class='w3-btn w3-theme w3-hover-white w3-round-large' required>
			</select>
			</span><br> 
			<label>상세주소</label><br>
			<textarea id="coming" name="coming" class="w3-input w3-border"
				style="width: 100%; height: 80px; resize: none;">${cafe.coming}</textarea>
			<label>가격</label><br> 
			<input class="w3-input w3-animate-input"
				type="text" name="price" style="width: 40%" value="${cafe.price}"> 
			<label>내용</label><br>
			<textarea id="coming" name="content" class="w3-input w3-border"
				style="width: 100%; height: 150px; resize: none;" required>${cafe.content}</textarea>
			<label>전화</label><br> 
			<input class="w3-input w3-animate-input"
				type="text" name="tel" style="width: 40%" value="${cafe.tel}"> 
			<label>운영시간</label><br>
			<input class="w3-input w3-animate-input" type="text"
				name="openhour" style="width: 40%" value="${cafe.openhour}"> 
			<label>휴관일</label><br>
			<input class="w3-input w3-animate-input" type="text"
				name="closeday" style="width: 40%" value="${cafe.closeday}"> 
			<label>사진</label><br>
				<div class="col-lg-12" id="photo_div">
                  <img alt="첨부 이미지가 없습니다." src="/resources/uploadFiles/${cafe.img }" id="photo" width="250px" height="200px" >
                </div>
			<input class="w3-input" type="file" id="files" name="files" maxlength="5"> 
			<label>홈페이지</label><br>
			<input class="w3-input w3-animate-input" type="text" name="url"
				style="width: 40%" value="${cafe.url}">

			<div class="w3-section w3-center">
				<button class="btn btn-primary">수정</button>
				<button class="btn btn-danger">취소</button>
			</div>
		</div>
	</div>
</div>
</form>
</body>
</html>