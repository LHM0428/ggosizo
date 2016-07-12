<%@page import="com.ggosizo.domain.DateCourse"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=8d76f7a19e09506d7ea7b9e7338ebd2a&libraries=services"></script>
<script type="text/javascript" src="/resources/courseTour/js/marker.js"></script>
<script type="text/javascript" src="/resources/courseTour/js/map_search.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/courseTour/css/_map_road.css">
<link rel="stylesheet" type="text/css" href="/resources/courseTour/css/_map_search.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"> 
<style>
     #panel0 {
         padding: 10px;
         display: none;
     }
     #panel1 {
         padding: 10px;
         display: none;
     }
     #panel2 {
         padding: 10px;
         display: none;
     }
       .bg-1 { 
         background-color: lightblue; 
         color: #ffffff;
     }
     .bg-2 { 
         background-color: #E3AB54; 
         color: #55555;
     }
     .bg-3 { 
         background-color: #bb99ff; 
         color: #55555;
     }
     .bg-4 { 
         background-color: #f2f2f2; 
         color: #55555;
     }
</style>
   
<script>
  $(document).ready(function(){
     $("#flip0").hover(function(){
          $("#panel0").slideToggle("fast");
        });
        $("#flip1").hover(function(){
          $("#panel1").slideToggle("fast");
        });
        $("#flip2").hover(function(){
          $("#panel2").slideToggle("fast");
        });
        
         $("#button").click(function(){
           alert("버튼이 눌렸습니다."); 
         });
         
         //w3.css 설정
          for (var i = 0; i < 3; i++) {
          var color = ["w3-pale-red","w3-pale-blue","w3-light-grey"];
            $('#container'+i).attr("class","container-fluid "+color[i]+" text-center" );
        }
  });
   
     initIndex();
     removeMarker(); 
     //currMarker();
     
       var second = 300;
      
       <c:forEach begin="0" end="2" varStatus="stat">
       var i = '${places[stat.index]}';
      if(i=='도서관'){
         var order${stat.count} = '${course[stat.index].name}';
      }else if(i=='미술관'){
         var order${stat.count} = '${course[stat.index].name}';
      }else if(i=='박물관'){
         var order${stat.count} = '${course[stat.index].name}';
      }else if(i=='카페'){
         var order${stat.count} = '${course[stat.index].name.split(" ")[0]}'+' '+'${course[stat.index].dong.substring(0,course[stat.index].dong.length()-1)}';
      }else if(i=='콘서트'){
         var order${stat.count} = '${course[stat.index].addr}';
      }else if(i=='맛집'){
         var order${stat.count} = '${course[stat.index].dong}'+'-'+' ${course[stat.index].name}';
      }else if(i=='축제'){
         var order${stat.count} = '${course[stat.index].addr}';
      }else if(i=='공원'){
         var order${stat.count} = '${course[stat.index].name}';
      }else{
         var order${stat.count} = '${course[stat.index].dong}'+'-'+' ${course[stat.index].name}';
      }
      </c:forEach>
         
         
   
         setTimeout(function(){
         searchPlaces(order1);
         } ,second+100);
         setTimeout(function(){
             searchPlaces(order2);
             } ,second+400);
         
         setTimeout(function(){
             searchPlaces(order3);
             } ,second+700);
  
</script>
<title>Top 10</title>
</head>

<body>
<center>
<div id="main_header" ></div>
</center>
<br>
<div id="main_nav"></div>
<br>
<div class="w3-container">
<div class="w3-light-blue w3-text-white">
  <div class="w3-container text-center">
  <br>
    <h2>데이트 코스 Ranking. ${rank}</h2>
     <br>
    <br>
  </div>
</div>

<c:forEach begin="0" end="2" varStatus="stat">
   <div id="container${stat.index }">
        <div id="flip${stat.index }">
           <h3>
           ${places[stat.index]}
           : ${course[stat.index].name}</h3>
           <c:if test="${not empty course[stat.index].addr}">
            <p>${course[stat.index].addr}</p>
          </c:if>
          <c:if test="${not empty course[stat.index].si}">
            <p>${course[stat.index].si}
               ${course[stat.index].gugun}
               ${course[stat.index].dong}</p>
          </c:if>
        </div>
      <div id="panel${stat.index }">
           <table class="w3-table w3-bordered w3-border">
         <c:if test="${not empty course[stat.index].coming}">
         <tr><td class="w3-theme-l2" style="width: 10%; ">위치 설명</td>
            <td>${course[stat.index].coming}</td></tr></c:if>
         <c:if test="${not empty course[stat.index].tel}">
         <tr><td class="w3-theme-l2" style="width: 10%; ">전화</td>
            <td>${course[stat.index].tel}</td></tr></c:if>
         <c:if test="${not empty course[stat.index].url}">
         <tr><td class="w3-theme-l2" style="width: 10%; ">url</td>
            <td>${course[stat.index].url}</td></tr></c:if>
         <c:if test="${not empty course[stat.index].openhour}">
         <tr><td class="w3-theme-l2" style="width: 10%; ">운영시간</td>
            <td>${course[stat.index].openhour}</td></tr></c:if>
         <c:if test="${not empty course[stat.index].closeday}">
         <tr><td class="w3-theme-l2" style="width: 10%; ">휴관일</td>
            <td>${course[stat.index].closeday}</td></tr></c:if>
         <c:if test="${not empty course[stat.index].startdate}">
         <tr><td class="w3-theme-l2" style="width: 10%; ">시작일</td>
            <td>${course[stat.index].startdate}</td></tr></c:if>
         <c:if test="${not empty course[stat.index].enddate}">
         <tr><td class="w3-theme-l2" style="width: 10%; ">종료일</td>
            <td>${course[stat.index].enddate}</td></tr></c:if>
         <c:if test="${not empty course[stat.index].price}">
         <tr><td class="w3-theme-l2" style="width: 10%; ">금액</td>
            <td>${course[stat.index].price}</td></tr></c:if>
         <c:if test="${not empty course[stat.index].content}">
         <tr><td class="w3-theme-l2" style="width: 10%; ">내용</td>
            <td>${course[stat.index].content}</td></tr></c:if>
         <c:if test="${not empty course[stat.index].img}">
         <tr><td class="w3-theme-l2" style="width: 10%; ">사진</td>
            <td><img src='${course[stat.index].img}' alt="Bird" width="250" height="150"></td>
            </tr></c:if>
         </table>
      </div>
   </div>
</c:forEach>
<br>
</div>
<center>
  <button type="button" id="place0" class="w3-btn w3-khaki">${course[0].name}</button>
  <button type="button" id="place1" class="w3-btn w3-khaki">${course[1].name}</button>
  <button type="button" id="place2" class="w3-btn w3-khaki">${course[2].name}</button>
  <br>
  <br>
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

<br>
<br>

</body>
</html> 