<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>맛집을 찾아서</title>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3-theme-teal.css">
<link rel="stylesheet" type="text/css" href="/resources/courseTour/css/_course_tour.css">
<link rel="stylesheet" type="text/css" href="/resources/courseTour/css/_map_road.css">
<link rel="stylesheet" type="text/css" href="/resources/courseTour/css/_naver_search.css"> 
<link rel="stylesheet" type="text/css" href="/resources/courseTour/css/_like.css"> 
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<script src="/resources/plugin/jquery/jquery.js"></script>
<script type="text/javascript" src="/resources/courseTour/js/marker.js"></script>
<script type="text/javascript" src="/resources/courseTour/js/map_search.js"></script>
 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	 
	$('#button').click(function(){
		var search = $('#search').val();
		searchPlaces(search+' 맛집');
	})
	
	$("#search").keydown(function(e){
            if(e.keyCode==13){
        		var search = $('#search').val();
        		searchPlaces(search+' 맛집');
            }
         })//엔터 검색
 })

//Accordions
function myAccFunc(id) {
    var x = document.getElementById(id);
    if (x.className.indexOf("w3-show") == -1) {
        x.className += " w3-show";
        x.previousElementSibling.className += " w3-dark-grey";
        var index = id.split('Demo');
        var i = index[1]-1;
        var addr = $("span[name='addrJibun"+i+"']").text();
        searchImgMap(addr,i);
    } else { 
        x.className = x.className.replace(" w3-show", "");
        x.previousElementSibling.className = 
        x.previousElementSibling.className.replace(" w3-dark-grey", "");
    }
}
</script>

</head>
<body >
<div class="w3-container">
<div class=" w3-round-large w3-theme">
<header class="w3-padding" id="myHeader">
  <div class="w3-center">
  <h4>무엇을 먹을지 고민일 때 위치만 검색해주세요</h4>
  <h1 class="w3-xxxlarge w3-animate-bottom">맛집을 찾아드립니다</h1>
    <div class="w3-padding-32">
      <input type="text" class="w3-btn w3-xlarge w3-theme-dark w3-hover-white"
       style="font-weight:900;" placeholder="지역만 입력하세요." id="search">
      <input type="button" class="w3-btn w3-theme-dark w3-xlarge"
      value="검색" style="font-weight:900;" id="button" name="searchPlace">
    </div>
    </div>
</header>
<div class="w3-center  w3-xxlarge" style="font-weight:900;">맛집 LIST</div>	
</div>
</div>

<div class="w3-container">
<br>
<div class="w3-accordion" id="accordion">
</div>
</div>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=a007d672fb0fc0c05158dec945eb5d8e&libraries=services"></script>
<script type="text/javascript" src="/resources/courseTour/js/img_map.js"></script>
<script type="text/javascript" src="/resources/courseTour/js/map_search2.js"></script>

<br>
<br>
</body>
</html>