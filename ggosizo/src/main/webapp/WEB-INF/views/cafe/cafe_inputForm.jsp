<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카페 입력</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="/resources/plugin/jquery/jquery.js"></script>
<link href="/resources/w3/css/w3_bodacious.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript">
		$(document).ready(function(){
	    	  var sido = $('#sp1').text();
	    	  $.ajax({
	    		  url:'/cafe/selecSido',
	        	  data:{
	        		    sido:sido
	        	  },
	        	  method:'POST',
	        	  success:function(result){
	        		  $('#sp2').html(result);
	        	  },
	        	  error:function(xhr){
	        		  alert(xhr.responseText);
	        	  }
	    	  });
	      
	      $('#sp2').change(function(){
	    	  //alert('구군변경!!');
	    	  var gugun = $('[name=gugun]').val();
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
	      
		});
		</script>
</head>
<body>
<form role="form" method="post" enctype="multipart/form-data">
<input type="hidden" name="si" value="서울">
<input type="hidden" name="viewcnt" value="0">
<input type="hidden" name="replycnt" value="0">
<input type="hidden" name="writer" value="${login }">

<input type="hidden" name="category" value="카페">
<input type="hidden" name="addr" value="">



<div class="w3-container w3-row">
	<div class="w3-col m3">&nbsp;</div>
	<div class="w3-col m6">
		<div class="w3-card-8 w3-white">
			<div class="w3-container w3-center w3-text-white w3-round" style="background-color:#b76ba3">
				<h2>카페 등록</h2>
			</div>
		</div>
		<div class="w3-container w3-card-8 w3-white w3-round">
			<br> <label>음식점 명</label><br> 
			<input class="w3-input w3-animate-input" type="text" name="name"
				style="width: 40%" required> 
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
				style="width: 100%; height: 80px; resize: none;"></textarea>
			<label>가격</label><br> 
			<input class="w3-input w3-animate-input"
				type="text" name="price" style="width: 40%"> 
			<label>내용</label><br>
			<textarea id="content" name="content" class="w3-input w3-border"
				style="width: 100%; height: 150px; resize: none;" required></textarea>
			<label>전화</label><br> 
			<input class="w3-input w3-animate-input"
				type="text" name="tel" style="width: 40%"> 
			<label>운영시간</label><br>
			<input class="w3-input w3-animate-input" type="text"
				name="openhour" style="width: 40%"> 
			<label>휴관일</label><br>
			<input class="w3-input w3-animate-input" type="text"
				name="closeday" style="width: 40%"> 
			<label>사진</label><br>
				<div class="col-lg-12" id="photo_div" style="display: none;">
                  <img alt="첨부 이미지가 없습니다." src="" id="photo" width="250px" height="200px" >
                </div>
			<input class="w3-input" type="file" id="files" name="files" maxlength="5"> 
			<label>홈페이지</label><br>
			<input class="w3-input w3-animate-input" type="text" name="url"
				style="width: 40%">

			<div class="w3-section w3-center">
				<button type="submit" class="btn btn-primary">등록</button>
				<button onclick="javascript:history.back()" class="btn btn-danger">취소</button>
			</div>
		</div>
	</div>
</div>
</form>
</body>
</html>