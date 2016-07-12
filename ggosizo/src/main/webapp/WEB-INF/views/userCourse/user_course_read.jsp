<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<title>유저가 추천하는 코스</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<script src="/resources/plugin/handlebars/handlebars-v4.0.5.js"></script>
<script src="/resources/usercourse/usercourse.js"></script>
<script src="/resources/usercourse/user_course_read.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8d76f7a19e09506d7ea7b9e7338ebd2a&libraries=services"></script>
<script type="text/javascript" src="/resources/courseTour/js/marker.js"></script>
<script type="text/javascript" src="/resources/courseTour/js/map_search.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/courseTour/css/_map_road.css">
<link rel="stylesheet" type="text/css" href="/resources/courseTour/css/_map_search.css">
<style> 
html,body {font-family: "Open Sans", "Helvetica Neue", Helvetica, sans-serif;}
h2,h2,h3,h4,h5{font-family: "Montserrat", sans-serif;}
* {
   margin: 0px;
   padding: 0px;
}
.tab {display:none;}
</style>
<link rel="stylesheet" type="text/css" href="/resources/courseTour/css/_naver_search.css"> 
<script type="text/javascript">
var order=['${course1.name}','${course2.name}','${course3.name}'];
var dong=['${course1.dong}','${course2.dong}','${course3.dong}',];
var loginId = '${login}';
$(document).ready(function(){
	 if(loginId==null)loginId='${m_chekc}';
       inIt('${no}', 'userCourse', loginId);
       getPage("/userCourseReplies/${no}/1");
       checkLike();
       var category = '${course1.category}';
       var category2 = '${course2.category}';
       var category3 = '${course3.category}';
       
       $('input[name="category"][value="'+category+'"]').attr("checked","checked");
       $('input[name="category2"][value="'+category2+'"]').attr("checked","checked");
       $('input[name="category3"][value="'+category3+'"]').attr("checked","checked");
      
       $('#delete').click(function(){
           if(!confirm("삭제하겠습니까?")){
              //
             }else{
                $('form').attr({"action":"/userCourse/delete?no=${no}","method":"POST"});
                 $('form').submit();
             }
       });
       var second = 300;
       
		  initIndex();
		  removeMarker(); 
	      setTimeout(function(){searchPlaces(order[0]+" "+dong[0].substring(0,dong[0].length-1));
	      						getSearch(order[0]+" "+dong[0],1)} ,second);
	      setTimeout(function(){searchPlaces(order[1]+" "+dong[1].substring(0,dong[1].length-1))
	    	  					getSearch(order[1]+" "+dong[1],1)} ,second*1.5);
	      setTimeout(function(){searchPlaces(order[2]+" "+dong[2].substring(0,dong[2].length-1));
	      						getSearch(order[2]+" "+dong[2],1)} ,second*2);
		  
		  $(".w3-pagination").on("click", "li a", function(event){
				event.preventDefault();
				replyPage = $(this).attr("href");
				
				getPage("/userCourseReplies/${no}/"+replyPage);
			}); 
       
   });//ready
   
    function getSearch(askQuery, page){
		query = askQuery;
		$.ajax({
			url : '/userCourse/naverApi?query='+query+"&page="+page,
	        type:'GET',
	        success:function(result, status, xhr){
	        	var resultArr = result.split("|");
	        	var li = document.createElement('li');
	        	for(var i=0; i<resultArr.length; i++){
	        		if(resultArr[i]=='navbar'){
	        			$('#section').append(resultArr[i+1]); 
	        		}else if(resultArr[i]=='searchResult'){
	        			$("#result").append(resultArr[i+1]);
	        		}
	        	}
	        },
	        error:function(xhr){
	        	alert('error ['+xhr.status+' : '+xhr.statusText+'] - '+xhr.responseText);
		}
	});
   }
		function openCity(evt, tabName) {
		  var i, x, tablinks;
		  x = document.getElementsByClassName("tab");
		  for (i = 0; i < x.length; i++) {
		      x[i].style.display = "none";
		  }
		  tablinks = document.getElementsByClassName("tablink");
		  for (i = 0; i < x.length; i++) {
		      tablinks[i].className = tablinks[i].className.replace(" w3-white", " ");
		  }
		  document.getElementById(tabName).style.display = "block";
		  evt.currentTarget.className += " w3-white";
		}
</script>
<body>
<div  class="w3-content" style="max-width:100%">
<!-- Third Grid: Swing By & Contact -->
<form action="/userCourse/update" method="GET">
<input name="no" type="hidden" value="${course1.no}">
<input name="no2" type="hidden" value="${course2.no}">
<input name="no3" type="hidden" value="${course3.no}">
<input name="keyword" type="hidden" value="${param.keyword}">
<input name="dateCourseNo" type="hidden" value="${no}">


<input name="si" type="hidden" value="${course1.si}">
<input name="gugun" type="hidden" value="${course1.gugun}">
<input name="dong" type="hidden" value="${course1.dong}">

<input name="si2" type="hidden" value="${course2.si}">
<input name="gugun2" type="hidden" value="${course2.gugun}">
<input name="dong2" type="hidden" value="${course2.dong}">

<input name="si3" type="hidden" value="${course3.si}">
<input name="gugun3" type="hidden" value="${course3.gugun}">
<input name="dong3" type="hidden" value="${course3.dong}">



<div class="w3-sand">
<div class="w3-row">
	<div class="w3-third">&nbsp;</div>
	<div class="w3-third w3-center">
	<h3>${title}</h3>
	   </div>
    <div class="w3-third w3-padding w3-center">
    <c:if test="${login==course.course_writer }">
     <button type="submit" class=" w3-hover w3-btn w3-round-large w3-border w3-small w3-slim">
     	<i class="fa fa-pencil-square-o"></i>&nbsp;수정</button>&nbsp;&nbsp;&nbsp;
      <button id="delete" type="submit" class=" w3-btn w3-border w3-round-large w3-small w3-slim w3-hover-red">
     	<i class="fa fa-trash"></i>&nbsp;삭제</button>
	</div>
	</c:if>       
</div>
</div>

<div class="w3-row" id="contact">
  
  <div class="w3-third w3-pale-red w3-container" style="height:1500px">
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
          value='${course1.name}' readonly="readonly">
        </span>
        <span class="w3-group">
          <label>장소</label><br>
          <select name="si" disabled="disabled">
             <option class="w3-select ">${course1.si }</option>
          </select>
          <select name="gugun" disabled="disabled">
             <option class="w3-select">${course1.gugun }</option>
          </select>
          <select name="dong" disabled="disabled">
             <option class="w3-select">${course1.dong }</option>
          </select>
        </span><br>
        <span class="w3-group">
          <label>장소 부가설명</label><c:if test="${empty course1.coming}"><i id="iComing" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <textarea id="coming" name="coming" class="w3-input w3-border" 
          style="width:100%; height:100px; resize: none; <c:if test="${empty course1.coming}">display:none;</c:if>" readonly="readonly">${course1.coming}</textarea>
        </span><br>
        <span class="w3-group">
          <label>전화</label><c:if test="${empty course1.tel}"><i id="iTel" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="tel" name="tel" class="w3-input" style="width:100%;<c:if test="${empty course1.tel}">display:none;</c:if>" type="text"
          value='${course1.tel}' readonly="readonly">
        </span><br>
        <span class="w3-group">
          <label>url</label><c:if test="${empty course1.url}"><i id="iUrl" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="url" name="url" class="w3-input" style="width:100%;<c:if test="${empty course1.url}">display:none;</c:if>" type="text"
          value='${course1.url}' readonly="readonly">
        </span><br>
        <span class="w3-group">
          <label>운영시간</label><c:if test="${empty course1.openhour}"><i id="iOpenhour" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="openhour" name="openhour" class="w3-input" style="width:100%;<c:if test="${empty course1.openhour}">display:none;</c:if>" type="text"
          value='${course1.openhour}' readonly="readonly">
        </span><br>
        <span class="w3-group">
          <label>휴관일</label><c:if test="${empty course1.closeday}"><i id="iCloseday" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="closeday" name="closeday" class="w3-input" style="width:100%;<c:if test="${empty course1.closeday}">display:none;</c:if>" type="text"
          value='${course1.closeday}' readonly="readonly">
        </span><br>
         <span class="w3-group">
          <label>시작일</label><c:if test="${empty course1.startdate}"><i id="iStartdate" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="startdate" name="startdate" class="w3-input" style="width:100%;<c:if test="${empty course1.startdate}">display:none;</c:if>" type="text"
          value='${course1.startdate}' readonly="readonly">
        </span><br>
         <span class="w3-group">
          <label>종료일</label><c:if test="${empty course1.enddate}"><i id="iEnddate" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="enddate" name="enddate" class="w3-input" style="width:100%;<c:if test="${empty course1.enddate}">display:none;</c:if>" type="text"
          value='${course1.enddate}' readonly="readonly">
        </span><br>
         <span class="w3-group">
          <label>금액</label><c:if test="${empty course1.price}"><i id="iPrice" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="price" name="price" class="w3-input" style="width:100%;<c:if test="${empty course1.price}">display:none;</c:if>" type="text"
          value='${course1.price}' readonly="readonly">
        </span><br>
        <span class="w3-group">
          <label>내용</label>
          <textarea name="content" class="w3-input w3-border" 
          style="height:300px; resize: none;" required readonly="readonly">${course1.content}</textarea>
        </span>
      </div>
    </div>
  </div>
  
  <div class="w3-third w3-pale-blue w3-container" style="height:1500px">
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
          value='${course2.name}' readonly="readonly">
        </span>
        <span class="w3-group">
          <label>장소</label><br>
          <select name="si2" disabled="disabled">
             <option class="w3-select ">${course2.si }</option>
          </select>
          <select name="gugun2" disabled="disabled">
             <option class="w3-select">${course2.gugun }</option>
          </select>
          <select name="dong2" disabled="disabled">
             <option class="w3-select">${course2.dong }</option>
          </select>
        </span><br>
        <span class="w3-group">
          <label>장소 부가설명</label><c:if test="${empty course2.coming}"><i id="iComing2" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <textarea id="coming2" name="coming2" class="w3-input w3-border" 
          style="width:100%; height:100px; resize: none;<c:if test="${empty course2.coming}">display:none;</c:if>" readonly="readonly">${course2.coming}</textarea>
        </span><br>
        <span class="w3-group">
          <label>전화</label><c:if test="${empty course2.tel}"><i id="iTel2" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="tel2" name="tel2" class="w3-input" style="width:100%;<c:if test="${empty course2.tel}">display:none;</c:if>" type="text"
          value='${course2.tel}' readonly="readonly">
        </span><br>
        <span class="w3-group">
          <label>url</label><c:if test="${empty course2.url}"><i id="iUrl2" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="url2" name="url2" class="w3-input" style="width:100%;<c:if test="${empty course2.url}">display:none;</c:if>" type="text"
          value='${course2.url}' readonly="readonly">
        </span><br>
        <span class="w3-group">
          <label>운영시간</label><c:if test="${empty course2.openhour}"><i id="iOpenhour2" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="openhour2" name="openhour2" class="w3-input" style="width:100%;<c:if test="${empty course2.openhour}">display:none;</c:if>" type="text"
          value='${course2.openhour}' readonly="readonly">
        </span><br>
        <span class="w3-group">
          <label>휴관일</label><c:if test="${empty course2.closeday}"><i id="iCloseday2" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="closeday2" name="closeday2" class="w3-input" style="width:100%;<c:if test="${empty course2.closeday}">display:none;</c:if>" type="text"
          value='${course2.closeday}' readonly="readonly">
        </span><br>
         <span class="w3-group">
          <label>시작일</label><c:if test="${empty course2.startdate}"><i id="iStartdate2" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="startdate2" name="startdate2" class="w3-input" style="width:100%;<c:if test="${empty course2.startdate}">display:none;</c:if>" type="text"
          value='${course2.startdate}' readonly="readonly">
        </span><br>
         <span class="w3-group">
          <label>종료일</label><c:if test="${empty course2.enddate}"><i id="iEnddate2" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="enddate2" name="enddate2" class="w3-input" style="width:100%;<c:if test="${empty course2.enddate}">display:none;</c:if>" type="text"
          value='${course2.enddate}' readonly="readonly">
        </span><br>
         <span class="w3-group">
          <label>금액</label><c:if test="${empty course2.price}"><i id="iPrice2" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="price2" name="price2" class="w3-input" style="width:100%;<c:if test="${empty course2.price}">display:none;</c:if>" type="text"
          value='${course2.price}' readonly="readonly">
        </span><br>
        <span class="w3-group">
          <label>내용</label>
          <textarea name="content2" class="w3-input w3-border" 
          style="height:300px; resize: none;" required readonly="readonly">${course2.content}</textarea>
        </span>
      </div>
    </div>
  </div>
  
  <div class="w3-third w3-light-grey w3-container" style="height:1500px">
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
          value='${course3.name}' readonly="readonly">
        </span>
        <span class="w3-group">
          <label>장소</label><br>
          <select name="si3" disabled="disabled">
             <option class="w3-select">${course3.si }</option>
          </select>
          <select name="gugun3" disabled="disabled">
             <option class="w3-select">${course3.gugun }</option>
          </select>
          <select name="dong3" disabled="disabled">
             <option class="w3-select">${course3.dong }</option>
          </select>
        </span><br>
        <span class="w3-group">
          <label>장소 부가설명</label><c:if test="${empty course3.coming}"><i id="iComing3" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <textarea id="coming3" name="coming3" class="w3-input w3-border" 
          style="width:100%; height:100px; resize: none;<c:if test="${empty course3.coming}">display:none;</c:if>" readonly="readonly">${course3.coming}</textarea>
        </span><br>
        <span class="w3-group">
          <label>전화</label><c:if test="${empty course3.tel}"><i id="iTel3" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="tel3" name="tel3" class="w3-input" style="width:100%;<c:if test="${empty course3.tel}">display:none;</c:if>" type="text"
          value='${course3.tel}' readonly="readonly">
        </span><br>
        <span class="w3-group">
          <label>url</label><c:if test="${empty course3.url}"><i id="iUrl3" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="url3" name="url3" class="w3-input" style="width:100%;<c:if test="${empty course3.url}">display:none;</c:if>" type="text"
          value='${course3.url}' readonly="readonly">
        </span><br>
        <span class="w3-group">
          <label>운영시간</label><c:if test="${empty course3.openhour}"><i id="iOpenhour3" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="openhour3" name="openhour3" class="w3-input" style="width:100%;<c:if test="${empty course3.openhour}">display:none;</c:if>" type="text"
          value='${course3.openhour}' readonly="readonly">
        </span><br>
        <span class="w3-group">
          <label>휴관일</label><c:if test="${empty course3.closeday}"><i id="iCloseday3" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="closeday3" name="closeday3" class="w3-input" style="width:100%;<c:if test="${empty course3.closeday}">display:none;</c:if>" type="text"
          value='${course3.closeday}' readonly="readonly">
        </span><br>
         <span class="w3-group">
          <label>시작일</label><c:if test="${empty course3.startdate}"><i id="iStartdate3" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="startdate3" name="startdate3" class="w3-input" style="width:100%;<c:if test="${empty course3.startdate}">display:none;</c:if>" type="text"
          value='${course3.startdate}' readonly="readonly">
        </span><br>
         <span class="w3-group">
          <label>종료일</label><c:if test="${empty course3.enddate}"><i id="iEnddate3" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="enddate3" name="enddate3" class="w3-input" style="width:100%;<c:if test="${empty course3.enddate}">display:none;</c:if>" type="text"
          value='${course3.enddate}' readonly="readonly">
        </span><br>
         <span class="w3-group">
          <label>금액</label><c:if test="${empty course3.price}"><i id="iPrice3" class="fa fa-plus" style="cursor: pointer;"></i></c:if>
          <input id="price3" name="price3" class="w3-input" style="width:100%;<c:if test="${empty course3.price}">display:none;</c:if>" type="text"
          value='${course3.price}' readonly="readonly">
        </span><br>
        <span class="w3-group">
          <label>내용</label>
          <textarea name="content3" class="w3-input w3-border" 
          style="height:300px; resize: none;" required readonly="readonly">${course3.content}</textarea>
        </span>
      </div>
    </div>
  </div>

</div>
</form>
<br>
<center>
  <button type="button" id="place0" class="w3-btn w3-khaki">${course1.name}</button>
  <button type="button" id="place1" class="w3-btn w3-khaki">${course2.name}</button>
  <button type="button" id="place2" class="w3-btn w3-khaki">${course3.name}</button>
  <br><br>
  <div class="row" id="row_map"  style="height:350px;">
	<div id="map" style="width:80%;height:350px;"></div>
		<!-- 
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9c361a09e2cbcabd3b5e9fb4edf727a5&libraries=services"></script>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=c9b4a2ba77057d19cb3f527ec751813f&libraries=services"></script>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8845514d60dca2d42b97cf5d02dbec37&libraries=services"></script>
	<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a007d672fb0fc0c05158dec945eb5d8e&libraries=services"></script>
		 -->

	<script type="text/javascript" src="/resources/courseTour/js/map_constructor.js"></script>
  </div><br>
</center>
<ul class="w3-navbar w3-blue" id="section">
     <li><a class='tablink' onclick="openCity(event,'블로그정보')">블로그 정보</a></li>
</ul>

<div class="row container-fluid col-sm-11" id="result"></div>
		
    <div class="w3-text-theme w3-container w3-padding w3-round-large" style="width:20%">
    <i class="fa fa-comments-o"></i>&nbsp;댓글 리스트 <small name='replycntSmall'>[ ${course.course_replycnt} ]</small>
    </div>
    <div class="w3-container">
     <c:if test="${not empty login }">
         <span class="w3-left">
            <button type="button" id="likeBtn" class="w3-btn w3-theme-l3 w3-round-large" onclick="likeUpdate()">
            <i class="fa fa-heart"></i>&nbsp;좋아요<small class="unlike" name='likecntSmall'>[ ${course.course_like} ]</small></button>
            <button type="button" class="w3-btn w3-theme-d1 w3-round-large" onclick="openInputReply()">
            <i class="fa fa-comment"></i>&nbsp;댓글</button>&nbsp;&nbsp;
         </span>
     </c:if>
     <c:if test="${empty login }">
         <span class="w3-left">
            <button disabled id="likeBtn" class="w3-btn w3-dark-grey w3-round-large" onclick="likeUpdate()">
            <i class="fa fa-heart"></i>&nbsp;좋아요<small class="unlike" name='likecntSmall'>[ ${course.course_like} ]</small></button>
            <button disabled class="w3-btn w3-theme-d1 w3-round-large" onclick="openInputReply()">
            <i class="fa fa-comment"></i>&nbsp;댓글</button>&nbsp;&nbsp;
         </span>
    </c:if>
      <a href="/userCourse/listAll?keyword=${param.keyword }" class="w3-white w3-hover w3-btn w3-round-large w3-border">
      <i class="fa fa-list"></i>&nbsp;목록</a>
	</div>
    <div class="w3-row-padding" id="inputReply" style="display: none;">
             <input type="hidden" value='${login }' name='newReplyWriter' id='newReplyWriter'>
              <div class="w3-col m12">
                <div class="w3-card-2 w3-round w3-theme-l4">
                  <div class="w3-container w3-padding">
                    <h6 class="w3-opacity">작성자 : ${login }</h6>
                    <p><input type="text" class="w3-border w3-padding" style="width:50%"
                       name='replytext' id='newReplyText' placeholder='댓글 입력'></p>
                       <br>
                   <button type="button" id="addReply" onclick='addReply()' class="w3-round-large w3-btn w3-theme">
                   <i class="fa fa-pencil"></i>&nbsp;등록</button>
                  <button type="button" onclick='closeInputReply()' class='w3-round-large w3-btn w3-theme'>
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
onclick="openModifyWindow('{{reply_no}}', '{{reply_writer}}')">댓글 수정</button>
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
         <button class="w3-round-large w3-btn w3-theme" onclick="replyModify('{{reply_no}}')">
            <i class="fa fa-pencil-square-o"></i>&nbsp;수정</button>
         <button class="w3-round-large w3-btn w3-theme" onclick="replyDelete('{{reply_no}}')">
            <i class="fa fa-eraser"></i>&nbsp;삭제</button>
         <button class="w3-round-large w3-btn w3-theme" onclick="replyClose('{{reply_no}}')">
            <i class="fa fa-times"></i>&nbsp;취소</button>
      </div>
   </div>
   </div>
{{/each}}
</script>
</body>
</html>