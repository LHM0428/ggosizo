<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<title>유저가 추천하는 코스_수정페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<style>
html,body {font-family: "Open Sans", "Helvetica Neue", Helvetica, sans-serif;}
h1,h2,h3,h4,h5{font-family: "Montserrat", sans-serif;}
* {
	margin: 0px;
	padding: 0px;
}
</style>
<script type="text/javascript">
	var category;
	var category2;
	var category3;
	 $(document).ready(function(){
    	  var sido = $('#sp1').val();
		    	  $.ajax({
		    		  url:'/userCourse/selecSido',
		        	  data:{
		        		    sido:sido,
		        		    selectGugun:'${course1.gugun}'
		        	  },
		        	  method:'POST',
		        	  success:function(result){
		        		  $('#sp2').html(result);
		        		  var gugun = $('[name=gugun]').val();
				    	  $.ajax({
				    		  url:'/userCourse/selecGugun',
				    		  method: "POST",
				        	  data:{
				        		    gugun:gugun,
				        		    selectDong:'${course1.dong}'
				        	  },
				        	  success:function(result){
				        		  $('#sp3').html(result);
				        	  } 
				    	  });
		        	  },
		        	  error:function(xhr){
		        		  alert(xhr.responseText);
		        	  }
		    	  });
		    	  
		    	  sido = $('#sp7').val();
		    	  $.ajax({
		    		  url:'/userCourse/selecSido',
		        	  data:{
		        		    sido:sido,
		        		    selectGugun:'${course3.gugun}'
		        	  },
		        	  method:'POST',
		        	  success:function(result){
		        		  $('#sp8').html(result);
		        		  var gugun = $('[name=gugun3]').val();
				    	  $.ajax({
				    		  url:'/userCourse/selecGugun',
				    		  method: "POST",
				        	  data:{
				        		    gugun:gugun,
				        		    selectDong:'${course3.dong}'
				        	  },
				        	  success:function(result){
				        		  $('#sp9').html(result);
				        	  } 
				    	  });
		        	  },
		        	  error:function(xhr){
		        		  alert(xhr.responseText);
		        	  }
		    	  });
		      
		      $('#sp2').change(function(){
		    	  //alert('구군변경!!');
		    	  var gugun = $('[name=gugun]').val();
		    	  $.ajax({
		    		  url:'/userCourse/selecGugun',
		    		  method: "POST",
		        	  data:{
		        		    gugun:gugun,
		        		    selectDong:'${course1.dong}'
		        	  },
		        	  success:function(result){
		        		  $('#sp3').html(result);
		        	  } 
		    	  });
		      });//sp2 change
		    	  var sido = $('#sp4').val();
		    	  $.ajax({
		    		  url:'/userCourse/selecSido',
		        	  data:{
		        		    sido:sido,
		        		    selectGugun:'${course2.gugun}'
		        	  },
		        	  method:'POST',
		        	  success:function(result){
		        		  $('#sp5').html(result);
		        		  var gugun = $('[name=gugun2]').val();
				    	  $.ajax({
				    		  url:'/userCourse/selecGugun',
				    		  method: "POST",
				        	  data:{
				        		    gugun:gugun,
				        		    selectDong:'${course2.dong}'
				        	  },
				        	  success:function(result){
				        		  $('#sp6').html(result);
				        	  } 
				    	  });
		        	  },
		        	  error:function(xhr){
		        		  alert(xhr.responseText);
		        	  }
		    	  });
		      
		      $('#sp5').change(function(){
		    	  //alert('구군변경!!');
		    	  var gugun = $('[name=gugun2]').val();
		    	  $.ajax({
		    		  url:'/userCourse/selecGugun',
		    		  method: "POST",
		        	  data:{
		        		    gugun:gugun,
		        		    selectDong:'${course2.dong}'
		        	  },
		        	  success:function(result){
		        		  $('#sp6').html(result);
		        	  } 
		    	  });
		      });//sp2 change
		    	  
		      $('#sp8').change(function(){
		    	  //alert('구군변경!!');
		    	  var gugun = $('[name=gugun3]').val();
		    	  $.ajax({
		    		  url:'/userCourse/selecGugun',
		    		  method: "POST",
		        	  data:{
		        		    gugun:gugun,
		        		    selectDong:'${course3.dong}'
		        	  },
		        	  success:function(result){
		        		  $('#sp9').html(result);
		        	  } 
		    	  });
		      });//sp2 change
		      
		$('input[name=category]').click(function(){
			$('input[value="'+category+'"]').removeAttr("disabled");
			$('#h1').removeAttr("value");
	 		category = $('input[name=category]:checked').val();
		 	if(category=='기타'){
		 		$('#etc1').attr("type","text");
		 	}else{
		 		$('#etc1').attr("type","hidden");
		 		$('input[value="'+category+'"]').attr("disabled","disabled");
		 		$('#h1').attr({"value":category,"name":"category"});
		 	}
		});
		$('input[name=category2]').click(function(){
			$('input[value="'+category2+'"]').removeAttr("disabled");
			$('#h2').removeAttr("value");
	 		category2 = $('input[name=category2]:checked').val();
		 	if(category2=='기타'){
		 		$('#etc2').attr("type","text");
		 	}else{
		 		$('#etc2').attr("type","hidden");
		 		$('input[value="'+category2+'"]').attr("disabled","disabled");
		 		$('#h2').attr({"value":category2,"name":"category2"});
		 	}
		});
		$('input[name=category3]').click(function(){
			$('input[value="'+category3+'"]').removeAttr("disabled");
			$('#h3').removeAttr("value");
	 		category3 = $('input[name=category3]:checked').val();
		 	if(category3=='기타'){
		 		$('#etc3').attr("type","text");
		 	}else{
		 		$('#etc3').attr("type","hidden");
		 		$('input[value="'+category3+'"]').attr("disabled","disabled");
		 		$('#h3').attr({"value":category3,"name":"category3"});
		 	}
		});
		
		
		 var category = '${course1.category}';
		 var category2 = '${course2.category}';
		 var category3 = '${course3.category}';
		 
 		$('input[name="category"][value="'+category+'"]').attr("checked","checked");
 		$('input[name="category2"][value="'+category2+'"]').attr("checked","checked");
 		$('input[name="category3"][value="'+category3+'"]').attr("checked","checked");
		
	});
	 
</script>
<body>
<div style="max-width:95%" class="w3-content">
<!-- Third Grid: Swing By & Contact -->
<form action="/userCourse/update" method="POST">
<input id="h1" type="hidden" value="">
<input id="h2" type="hidden" value="">
<input id="h3" type="hidden" value="">

<input name="no" type="hidden" value="${course1.no}">
<input name="no2" type="hidden" value="${course2.no}">
<input name="no3" type="hidden" value="${course3.no}">

<input name="category" type="hidden" value="${course1.category}">
<input name="category2" type="hidden" value="${course2.category}">
<input name="category3" type="hidden" value="${course3.category}">

<input name="si" type="hidden" value="${course1.si}">
<input name="gugun" type="hidden" value="${course1.gugun}">
<input name="dong" type="hidden" value="${course1.dong}">

<input name="si2" type="hidden" value="${course2.si}">
<input name="gugun2" type="hidden" value="${course2.gugun}">
<input name="dong2" type="hidden" value="${course2.dong}">

<input name="si3" type="hidden" value="${course3.si}">
<input name="gugun3" type="hidden" value="${course3.gugun}">
<input name="dong3" type="hidden" value="${course3.dong}">


<input name="dateCourseNo" type="hidden" value="${no}">
<center>
   	 <input name="title" class="w3-input w3-border w3-center" 
      type="text" style="width:40%;" placeholder="코스이름을 입력하세요" required value="${title}">
</center>
<div class="w3-row" id="contact">
  <div class="w3-third w3-pale-red w3-container" style="height:1400px">
    <div class="w3-padding-48 w3-padding-xlarge">
      <center><h2>${course1.name}</h2></center>
      <p class="w3-opacity"></p>
      <div class="w3-container w3-card-2 w3-padding-32 w3-white">
      
        <span class="w3-group">
        <label>카테고리</label><br>
			<input class="w3-radio" type="radio" name="category" value="도서관" disabled="disabled">
			<label class="w3-validate">도서관</label>
			<input class="w3-radio" type="radio" name="category" value="미술관" disabled="disabled">
			<label class="w3-validate">미술관</label>
			<input class="w3-radio" type="radio" name="category" value="박물관" disabled="disabled">
			<label class="w3-validate">박물관</label>
			<input class="w3-radio" type="radio" name="category" value="카페" disabled="disabled">
			<label class="w3-validate">카페</label>
			<input class="w3-radio" type="radio" name="category" value="맛집" disabled="disabled">
			<label class="w3-validate">맛집</label>
			<input class="w3-radio" type="radio" name="category" value="공원" disabled="disabled">
			<label class="w3-validate">공원</label>
			<input id="i1" class="w3-radio" type="radio" name="category" value="기타" disabled="disabled">
			<label class="w3-validate">기타</label>
        </span><br>
        <span class="w3-group">
          <input id="etc1" name="etc_title" placeholder="기타 장소를 입력하세요"
          class="w3-input" style="width:100%;" type="hidden" required>
        </span>
        <span class="w3-group">
          <label>이름</label>
          <input name="name" class="w3-input" style="width:100%;" type="text" required 
          value='${course1.name}'>
        </span>
        <span class="w3-group">
          <label>장소</label><br>
          <div class="w3-row">
			<div class="w3-third">
			          <select id="sp1" class="w3-select" name="si">
			           <option value='서울'>서울</option>
			          </select>
			</div>
			<div class="w3-third">
			          <select id="sp2" class="w3-select" name="gugun">
			          </select>
			</div>
			<div class="w3-third">
			          <select id="sp3" class="w3-select" name="dong">
			          </select>
			</div>
		   </div>
		  </span>
        <span class="w3-group">
          <label>장소 부가설명</label>
          <textarea name="coming" class="w3-input" 
          style="width:100%; height:150px; resize: none;">${course1.coming}</textarea>
        </span>
        <span class="w3-group">
          <label>전화</label><label id="t">+</label>
          <input name="tel" class="w3-input" style="width:100%;" type="text"
          value='${course1.tel}'>
        </span>
        <span class="w3-group">
          <label>url</label>
          <input name="url" class="w3-input" style="width:100%;" type="text"
          value='${course1.url}'>
        </span>
        <span class="w3-group">
          <label>운영시간</label>
          <input name="openhour" class="w3-input" style="width:100%;" type="text"
          value='${course1.openhour}'>
        </span>
        <span class="w3-group">
          <label>휴관일</label>
          <input name="closeday" class="w3-input" style="width:100%;" type="text"
          value='${course1.closeday}'>
        </span>
         <span class="w3-group">
          <label>시작일</label>
          <input name="startdate" class="w3-input" style="width:100%;" type="text"
          value='${course1.startdate}'>
        </span>
         <span class="w3-group">
          <label>종료일</label>
          <input name="enddate" class="w3-input" style="width:100%;" type="text"
          value='${course1.enddate}'>
        </span>
         <span class="w3-group">
          <label>금액</label>
          <input name="price" class="w3-input" style="width:100%;" type="text"
          value='${course1.price}'>
        </span>
        <span class="w3-group">
          <label>내용</label>
          <textarea name="content" class="w3-input" 
          style="height:300px; resize: none;" required>${course1.content}</textarea>
        </span>
      </div>
    </div>
  </div>
  
  <div class="w3-third w3-pale-blue w3-container" style="height:1400px">
    <div class="w3-padding-48 w3-padding-xlarge">
       <center><h2>${course2.name}</h2></center>
      <p class="w3-opacity"></p>
      <div class="w3-container w3-card-2 w3-padding-32 w3-white">
      
        <span class="w3-group">
        <label>카테고리</label><br>
			<input class="w3-radio" type="radio" name="category2" value="도서관" disabled="disabled">
			<label class="w3-validate">도서관</label>
			<input class="w3-radio" type="radio" name="category2" value="미술관" disabled="disabled">
			<label class="w3-validate">미술관</label>
			<input class="w3-radio" type="radio" name="category2" value="박물관" disabled="disabled">
			<label class="w3-validate">박물관</label>
			<input class="w3-radio" type="radio" name="category2" value="카페" disabled="disabled">
			<label class="w3-validate">카페</label>
			<input class="w3-radio" type="radio" name="category2" value="맛집" disabled="disabled">
			<label class="w3-validate">맛집</label>
			<input class="w3-radio" type="radio" name="category2" value="공원" disabled="disabled">
			<label class="w3-validate">공원</label>
			<input id="i1" class="w3-radio" type="radio" name="category2" value="기타" disabled="disabled">
			<label class="w3-validate">기타</label>
        </span><br>
        <span class="w3-group">
          <input id="etc1" name="etc_title" placeholder="기타 장소를 입력하세요"
          class="w3-input" style="width:100%;" type="hidden" required>
        </span>
        <span class="w3-group">
          <label>이름</label>
          <input name="name2" class="w3-input" style="width:100%;" type="text" required 
          value='${course2.name}'>
        </span>
       <span class="w3-group">
          <label>장소</label><br>
          <div class="w3-row">
			<div class="w3-third">
			          <select id="sp4" class="w3-select" name="si">
			           <option value='서울'>서울</option>
			          </select>
			</div>
			<div class="w3-third">
			          <select id="sp5" class="w3-select" name="gugun">
			          </select>
			</div>
			<div class="w3-third">
			          <select id="sp6" class="w3-select" name="dong">
			          </select>
			</div>
		   </div>
		  </span>
        <span class="w3-group">
          <label>장소 부가설명</label>
          <textarea name="coming2" class="w3-input" 
          style="width:100%; height:150px; resize: none;">${course2.coming}</textarea>
        </span>
        <span class="w3-group">
          <label>전화</label><label id="t">+</label>
          <input name="tel2" class="w3-input" style="width:100%;" type="text"
          value='${course2.tel}'>
        </span>
        <span class="w3-group">
          <label>url</label>
          <input name="url2" class="w3-input" style="width:100%;" type="text"
          value='${course2.url}'>
        </span>
        <span class="w3-group">
          <label>운영시간</label>
          <input name="openhour2" class="w3-input" style="width:100%;" type="text"
          value='${course2.openhour}'>
        </span>
        <span class="w3-group">
          <label>휴관일</label>
          <input name="closeday2" class="w3-input" style="width:100%;" type="text"
          value='${course2.closeday}'>
        </span>
         <span class="w3-group">
          <label>시작일</label>
          <input name="startdate2" class="w3-input" style="width:100%;" type="text"
          value='${course2.startdate}'>
        </span>
         <span class="w3-group">
          <label>종료일</label>
          <input name="enddate2" class="w3-input" style="width:100%;" type="text"
          value='${course2.enddate}'>
        </span>
         <span class="w3-group">
          <label>금액</label>
          <input name="price2" class="w3-input" style="width:100%;" type="text"
          value='${course2.price}'>
        </span>
        <span class="w3-group">
          <label>내용</label>
          <textarea name="content2" class="w3-input" 
          style="height:300px; resize: none;" required>${course2.content}</textarea>
        </span>
      </div>
    </div>
  </div>
  
  <div class="w3-third w3-light-grey w3-container" style="height:1400px">
    <div class="w3-padding-48 w3-padding-xlarge">
       <center><h2>${course3.name}</h2></center>
      <p class="w3-opacity"></p>
      <div class="w3-container w3-card-2 w3-padding-32 w3-white">
      
        <span class="w3-group">
        <label>카테고리</label><br>
			<input class="w3-radio" type="radio" name="category3" value="도서관" disabled="disabled">
			<label class="w3-validate">도서관</label>
			<input class="w3-radio" type="radio" name="category3" value="미술관" disabled="disabled">
			<label class="w3-validate">미술관</label>
			<input class="w3-radio" type="radio" name="category3" value="박물관" disabled="disabled">
			<label class="w3-validate">박물관</label>
			<input class="w3-radio" type="radio" name="category3" value="카페" disabled="disabled">
			<label class="w3-validate">카페</label>
			<input class="w3-radio" type="radio" name="category3" value="맛집" disabled="disabled">
			<label class="w3-validate">맛집</label>
			<input class="w3-radio" type="radio" name="category3" value="공원" disabled="disabled">
			<label class="w3-validate">공원</label>
			<input id="i1" class="w3-radio" type="radio" name="category3" value="기타" disabled="disabled">
			<label class="w3-validate">기타</label>
        </span><br>
        <span class="w3-group">
          <input id="etc1" name="etc_title3" placeholder="기타 장소를 입력하세요"
          class="w3-input" style="width:100%;" type="hidden" required>
        </span>
        <span class="w3-group">
          <label>이름</label>
          <input name="name3" class="w3-input" style="width:100%;" type="text" required 
          value='${course3.name}'>
        </span>
        <span class="w3-group">
          <label>장소</label><br>
          <div class="w3-row">
			<div class="w3-third">
			          <select id="sp7" class="w3-select" name="si">
			           <option value='서울'>서울</option>
			          </select>
			</div>
			<div class="w3-third">
			          <select id="sp8" class="w3-select" name="gugun">
			          </select>
			</div>
			<div class="w3-third">
			          <select id="sp9" class="w3-select" name="dong">
			          </select>
			</div>
		   </div>
		  </span>
        <span class="w3-group">
          <label>장소 부가설명</label>
          <textarea name="coming3" class="w3-input" 
          style="width:100%; height:150px; resize: none;">${course3.coming}</textarea>
        </span>
        <span class="w3-group">
          <label>전화</label><label id="t">+</label>
          <input name="tel3" class="w3-input" style="width:100%;" type="text"
          value='${course3.tel}'>
        </span>
        <span class="w3-group">
          <label>url</label>
          <input name="url3" class="w3-input" style="width:100%;" type="text"
          value='${course3.url}'>
        </span>
        <span class="w3-group">
          <label>운영시간</label>
          <input name="openhour3" class="w3-input" style="width:100%;" type="text"
          value='${course3.openhour}'>
        </span>
        <span class="w3-group">
          <label>휴관일</label>
          <input name="closeday3" class="w3-input" style="width:100%;" type="text"
          value='${course3.closeday}'>
        </span>
         <span class="w3-group">
          <label>시작일</label>
          <input name="startdate3" class="w3-input" style="width:100%;" type="text"
          value='${course3.startdate}'>
        </span>
         <span class="w3-group">
          <label>종료일</label>
          <input name="enddate3" class="w3-input" style="width:100%;" type="text"
          value='${course3.enddate}'>
        </span>
         <span class="w3-group">
          <label>금액</label>
          <input name="price3" class="w3-input" style="width:100%;" type="text"
          value='${course3.price}'>
        </span>
        <span class="w3-group">
          <label>내용</label>
          <textarea name="content3" class="w3-input" 
          style="height:300px; resize: none;" required>${course3.content}</textarea>
        </span>
      </div>
    </div>
  </div>
  <div align="center" class="w3-sand">
    <button type="submit" class="w3-btn w3-light-grey w3-large w3-border w3-border-blue w3-round">수정하기</button>
  </div>
</div>
</form>
</div>
</body>
</html>