<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript" src="/resources/usercourse/user_course_insert.js"></script>
<style>
html,body {font-family: "Open Sans", "Helvetica Neue", Helvetica, sans-serif;}
h1,h2,h3,h4,h5{font-family: "Montserrat", sans-serif;}
* {
	margin: 0px;
	padding: 0px;
}
</style>
	<script type="text/javascript">
		$(document).ready(function(){
	    	  var sido = $('#sp1').val();
	    	  $.ajax({
	    		  url:'/userCourse/selecSido',
	        	  data:{
	        		    sido:sido
	        	  },
	        	  method:'POST',
	        	  success:function(result){
	        		  $('#sp2').html(result);
	        		  $('#sp5').html(result);
	        		  $('#sp8').html(result);
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
	        		    gugun:gugun
	        	  },
	        	  success:function(result){
	        		  $('#sp3').html(result);
	        	  } 
	    	  });
	      });//sp2 change
	      
	      $('#sp5').change(function(){
	    	  //alert('구군변경!!');
	    	  var gugun = $('[name=gugun2]').val();
	    	  $.ajax({
	    		  url:'/userCourse/selecGugun',
	    		  method: "POST",
	        	  data:{
	        		    gugun:gugun
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
	        		    gugun:gugun
	        	  },
	        	  success:function(result){
	        		  $('#sp9').html(result);
	        	  } 
	    	  });
	      });//sp2 change
		})
		</script>
<title>유저가 추천하는 코스</title>
</head>
<body class="w3-content" style="max-width:100%">
<!-- Third Grid: Swing By & Contact -->
<form action="/userCourse/insert" method="POST">
<input id="h1" type="hidden" value="">
<input id="h2" type="hidden" value="">
<input id="h3" type="hidden" value="">
<input id="writer" name="writer" type="hidden" value="${login}"> 
<input id="writer2" name="writer2" type="hidden" value="${login}"> 
<input id="writer3" name="writer3" type="hidden" value="${login}">

 
  <div align="center" class="w3-sand">
	 	 <input name="title" class="w3-input w3-border" 
      type="text" style="width:30%;" placeholder="코스이름을 입력하세요" required>
</div>
<div class="w3-row" id="contact">
  
  <div class="w3-third w3-pale-red w3-container" style="height:1500px">
    <div class="w3-padding-48 w3-padding-xlarge">
      <center><h1>데이트 코스 1</h1></center>
      <p class="w3-opacity"></p>
      <div class="w3-container w3-card-2 w3-padding-32 w3-white">
      
        <span class="w3-group">
        <label>카테고리</label><br>
			<input class="w3-radio" type="radio" name="category" value="도서관" checked>
			<label class="w3-validate">도서관</label>
			<input class="w3-radio" type="radio" name="category" value="미술관">
			<label class="w3-validate">미술관</label>
			<input class="w3-radio" type="radio" name="category" value="박물관">
			<label class="w3-validate">박물관</label>
			<input class="w3-radio" type="radio" name="category" value="카페">
			<label class="w3-validate">카페</label>
			<input class="w3-radio" type="radio" name="category" value="맛집">
			<label class="w3-validate">맛집</label>
			<input class="w3-radio" type="radio" name="category" value="공원">
			<label class="w3-validate">공원</label>
			<input id="i1" class="w3-radio" type="radio" name="category" value="기타">
			<label class="w3-validate">기타</label>
        </span><br>
        
        
        <span class="w3-group">
          <input id="etc1" name="etc_title" placeholder="기타 장소를 입력하세요"
          class="w3-input" style="width:100%;" type="hidden" required>
        </span>
        <span class="w3-group">
          <label>이름</label>
          <input name="name" class="w3-input" style="width:100%;" type="text" required>
        </span>
        <span class="w3-group">
          <label>장소</label><br>
          <div class="w3-row">
			<div class="w3-third">
			          <select id="sp1" class="w3-select" name="si" required>
			           <option value='서울'>서울</option>
			          </select>
			</div>
			<div class="w3-third">
			          <select id="sp2" class="w3-select" name="gugun" required>
			          </select>
			</div>
			<div class="w3-third">
			          <select id="sp3" class="w3-select" name="dong" required>
			          </select>
			</div>
		   </div>
		  </span>
        <span class="w3-group">
          <label>장소 부가설명</label>
          <i id="iComing" class="fa fa-plus" style="cursor: pointer;"></i>
          <textarea id="coming" name="coming" class="w3-input w3-border" 
          style="width:100%; height:150px; resize: none; display:none"></textarea>
        </span>
        <br>
        <span class="w3-group">
          <label>전화</label>&nbsp;
          <i id="iTel" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="tel" name="tel" class="w3-input" style="width:100%;display:none;" type="text">
        </span><br>
        <span class="w3-group">
          <label>url</label>
          <i id="iUrl" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="url" name="url" class="w3-input" style="width:100%;display:none;" type="text">
        </span><br>
        <span class="w3-group">
          <label>운영시간</label>
          <i id="iOpenhour" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="openhour" name="openhour" class="w3-input" style="width:100%;display:none;" type="text">
        </span><br>
        <span class="w3-group">
          <label>휴관일</label>
          <i id="iCloseday" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="closeday" name="closeday" class="w3-input" style="width:100%;display:none;" type="text">
        </span><br>
         <span class="w3-group">
          <label>시작일</label>
          <i id="iStartdate" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="startdate" name="startdate" class="w3-input" style="width:100%;display:none;" type="text">
        </span><br>
         <span class="w3-group">
          <label>종료일</label>
          <i id="iEnddate" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="enddate" name="enddate" class="w3-input" style="width:100%;display:none;" type="text" >
        </span><br>
         <span class="w3-group">
          <label>금액</label>
          <i id="iPrice" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="price" name="price" class="w3-input" style="width:100%;display:none;" type="text">
        </span><br>
        <span class="w3-group">
          <label>내용</label>
          <textarea name="content" class="w3-input w3-border" 
          style="height:300px; resize: none;" required ></textarea>
        </span>
      </div>
    </div>
  </div>
  
  <div class="w3-third w3-pale-blue w3-container" style="height:1500px">
    <div class="w3-padding-48 w3-padding-xlarge">
      <center><h1>데이트 코스 2</h1></center>
      <p class="w3-opacity"></p>
      <div class="w3-container w3-card-2 w3-padding-32 w3-white">
        <span class="w3-group">
        <label>카테고리</label><br>
			<input class="w3-radio" type="radio" name="category2" value="도서관" checked>
			<label class="w3-validate">도서관</label>
			<input class="w3-radio" type="radio" name="category2" value="미술관">
			<label class="w3-validate">미술관</label>
			<input class="w3-radio" type="radio" name="category2" value="박물관">
			<label class="w3-validate">박물관</label>
			<input class="w3-radio" type="radio" name="category2" value="카페">
			<label class="w3-validate">카페</label>
			<input class="w3-radio" type="radio" name="category2" value="맛집">
			<label class="w3-validate">맛집</label>
			<input class="w3-radio" type="radio" name="category2" value="공원">
			<label class="w3-validate">공원</label>
			<input id="i2" class="w3-radio" type="radio" name="category2" value="기타">
			<label class="w3-validate">기타</label>
        </span><br>
         <span class="w3-group">
          <input id="etc2" name="etc_title2" placeholder="기타 장소를 입력하세요"
          class="w3-input" style="width:100%;" type="hidden" required>
        </span>
        <span class="w3-group">
          <label>이름</label>
          <input name="name2" class="w3-input" style="width:100%;" type="text" required>
        </span>
        <span class="w3-group">
          <label>장소</label><br>
         <div class="w3-row">
			<div class="w3-third">
			          <select id="sp4" class="w3-select" name="si2" required>
			           <option value='서울'>서울</option>
			          </select>
			</div>
			<div class="w3-third">
			          <select id="sp5" class="w3-select" name="gugun2" required>
			          </select>
			</div>
			<div class="w3-third">
			          <select id="sp6" class="w3-select" name="dong2" required>
			          </select>
			</div>
		</div>
		</span>
        <span class="w3-group">
          <label>장소 부가설명</label>
          <i id="iComing2" class="fa fa-plus" style="cursor: pointer;"></i>
          <textarea id="coming2" name="coming2" class="w3-input w3-border" 
          style="width:100%; height:150px; resize:none; display:none;"></textarea>
        </span><br>
        <span class="w3-group">
          <label>전화</label>
          <i id="iTel2" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="tel2" name="tel2" class="w3-input" style="width:100%; display:none;" type="text">
        </span><br>
        <span class="w3-group">
          <label>url</label>
          <i id="iUrl2" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="url2" name="url2" class="w3-input" style="width:100%; display:none;" type="text">
        </span><br>
        <span class="w3-group">
          <label>운영시간</label>
          <i id="iOpenhour2" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="openhour2" name="openhour2" class="w3-input" style="width:100%; display:none;" type="text">
        </span><br>
        <span class="w3-group">
          <label>휴관일</label>
          <i id="iCloseday2" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="closeday2" name="closeday2" class="w3-input" style="width:100%; display:none;" type="text">
        </span><br>
         <span class="w3-group">
          <label>시작일</label>
          <i id="iStartdate2" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="startdate2" name="startdate2" class="w3-input" style="width:100%; display:none;" type="text">
        </span><br>
         <span class="w3-group">
          <label>종료일</label>
          <i id="iEnddate2" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="enddate2" name="enddate2" class="w3-input" style="width:100%; display:none;" type="text">
        </span><br>
         <span class="w3-group">
          <label>금액</label>
          <i id="iPrice2" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="price2" name="price2" class="w3-input" style="width:100%; display:none;" type="text">
        </span><br>
        <span class="w3-group">
          <label>내용</label>
          <textarea name="content2" class="w3-input w3-border" 
          style="height:300px; resize:none;" required></textarea>
        </span>
      </div>
    </div>
  </div>
  
  <div class="w3-third w3-light-grey w3-container" style="height:1500px">
    <div class="w3-padding-48 w3-padding-xlarge">
      <center><h1>데이트 코스 3</h1></center>
      <p class="w3-opacity"></p>
      <div class="w3-container w3-card-2 w3-padding-32 w3-white">
        <span class="w3-group">
        <label>카테고리</label><br>
			<input class="w3-radio" type="radio" name="category3" value="도서관" checked>
			<label class="w3-validate">도서관</label>
			<input class="w3-radio" type="radio" name="category3" value="미술관">
			<label class="w3-validate">미술관</label>
			<input class="w3-radio" type="radio" name="category3" value="박물관">
			<label class="w3-validate">박물관</label>
			<input class="w3-radio" type="radio" name="category3" value="카페">
			<label class="w3-validate">카페</label>
			<input class="w3-radio" type="radio" name="category3" value="맛집">
			<label class="w3-validate">맛집</label>
			<input class="w3-radio" type="radio" name="category3" value="공원">
			<label class="w3-validate">공원</label>
			<input id="i3" class="w3-radio" type="radio" name="category3" value="기타">
			<label class="w3-validate">기타</label>
        </span><br>
         <span class="w3-group">
          <input id="etc3" name="etc_title3" placeholder="기타 장소를 입력하세요"
          class="w3-input" style="width:100%;" type="hidden" required>
        </span>
        <span class="w3-group">
          <label>이름</label>
          <input name="name3" class="w3-input" style="width:100%;" type="text" required>
        </span>
        <span class="w3-group">
          <label>장소</label><br>
          <div class="w3-row">
			<div class="w3-third">
			          <select id="sp7" class="w3-select" name="si3" required>
			          	<option value="서울">서울</option>
			          </select>
			</div>
			<div class="w3-third">
			          <select id="sp8" class="w3-select" name="gugun3" required>
			          </select>
			</div>
			<div class="w3-third">
			          <select id="sp9" class="w3-select" name="dong3" required>
			          </select>
			</div>
		</div>
		</span>
        <span class="w3-group">
          <label>장소 부가설명</label>
          <i id="iComing3" class="fa fa-plus" style="cursor: pointer;"></i>
          <textarea id="coming3" name="coming3" class="w3-input w3-border" 
          style="width:100%; height:150px; resize:none; display:none;"></textarea>
        </span><br>
        <span class="w3-group">
          <label>전화</label>
          <i id="iTel3" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="tel3" name="tel3" class="w3-input" style="width:100%;display:none;" type="text">
        </span><br>
        <span class="w3-group">
          <label>url</label>
          <i id="iUrl3" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="url3" name="url3" class="w3-input" style="width:100%;display:none;" type="text">
        </span><br>
        <span class="w3-group">
          <label>운영시간</label>
          <i id="iOpenhour3" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="openhour3" name="openhour3" class="w3-input" style="width:100%;display:none;" type="text">
        </span><br>
        <span class="w3-group">
          <label>휴관일</label>
          <i id="iCloseday3" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="closeday3" name="closeday3" class="w3-input" style="width:100%;display:none;" type="text">
        </span><br>
         <span class="w3-group">
          <label>시작일</label>
          <i id="iStartdate3" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="startdate3" name="startdate3" class="w3-input" style="width:100%;display:none;" type="text">
        </span><br>
         <span class="w3-group">
          <label>종료일</label>
          <i id="iEnddate3" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="enddate3" name="enddate3" class="w3-input" style="width:100%;display:none;" type="text">
        </span><br>
         <span class="w3-group">
          <label>금액</label>
          <i id="iPrice3" class="fa fa-plus" style="cursor: pointer;"></i>
          <input id="price3" name="price3" class="w3-input" style="width:100%;display:none;" type="text">
        </span><br>
        <span class="w3-group">
          <label>내용</label>
          <textarea name="content3" class="w3-input w3-border" 
          style="height:300px; resize:none;" required></textarea>
        </span>
      </div>
    </div>
  </div>
 <div align="center" class="w3-sand">
    <button type="submit" class="w3-btn w3-white w3-hover-blue w3-large w3-border w3-border-blue w3-round">등록하기</button>
 </div>
</div>
</form>
</body>
</html>