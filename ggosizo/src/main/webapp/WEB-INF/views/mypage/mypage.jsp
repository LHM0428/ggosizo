<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="/resources/plugin/jquery/jquery.js"></script>
<script src="/resources/mypage/userinfoFunc.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
.w3-sidenav a,.w3-sidenav h4 {font-weight:bold}
a{text-decoration: none;}
#mypage-footer{
background-image: url('http://pds2.egloos.com/pds/1/200604/30/63/d0001563_17452323.jpg');
background-position : right;
background-size : cover;
}
#footer-content{
background-color: rgba(255,255,255,0.7)
}

</style>
<title>MY PAGE</title>
<script type="text/javascript">
	var gender = '${user.u_gender}';
	var selectSido = '${user.u_addr1}';
	var selectGugun = '${user.u_addr2}';
	var u_id='${user.u_id}';
	var infoModify = '${param.infoModify}'
	$(document).ready(function(){
	 	if(gender=='남'){
			$('#man').attr("checked", true);
		}else{
			$('#woman').attr("checked");
		}
	 	myLike(u_id,1);
	 	myCourse(u_id,1);
	 	myQnA(u_id,1);
	 	
		$.ajax({
	    	  url:'/mypage/selecSido',
	       	  method:'POST',
	       	  data:{
	       		  selectSido : selectSido
	       	  },
	       	  success:function(result){
	       		  $('#sp1').html(result);
	     		      var sido = $('select[name=u_addr1]').val();
		    	 $.ajax({
		    		  url:'/mypage/selecGugun',
		    		  method: "POST",
		        	  data:{
		        		    sido:sido,
		        		    selectGugun : selectGugun
		        	  },
		        	  success:function(result){
		        		  $('#sp2').html(result);
		        	  }
		    	  });
	       	  }
	      });
	      
	      $('#sp1').change(function(){
		      var sido = $('select[name=u_addr1]').val();
		      $.ajax({
		    	  url:'/mypage/selecGugun',
		    	  method: "POST",
		       	  data:{
		       		    sido:sido
		       	  },
		       	  success:function(result){
		       		  $('#sp2').html(result);
		       	  } 
		      });
	      });//sido change
	      if(infoModify.length>0){
	    	  $('#likeDiv').hide();
	    	  $('#dateCourseDiv').hide();
	    	  $('#qnaDiv').hide();
	    	  $('#userinfoDiv').show('slow');
	      }
	      $('#myInfo').click(function(){
	    	  $('#likeDiv').hide();
	    	  $('#dateCourseDiv').hide();
	    	  $('#qnaDiv').hide();
	    	  $('#userinfoDiv').show('slow');
	      })
	      
	      $('#myLike').click(function(){
	    	  $('#dateCourseDiv').hide();
	    	  $('#qnaDiv').hide();
	    	  $('#userinfoDiv').hide();
	    	  $('#likeDiv').show('slow');
	      })
	      
	      $('#myDateCourse').click(function(){
	    	  $('#dateCourseDiv').show('slow');
	    	  $('#qnaDiv').hide();
	    	  $('#userinfoDiv').hide();
	    	  $('#likeDiv').hide();
	      })
	      
	      $('#myQnA').click(function(){
	    	  $('#dateCourseDiv').hide();
	    	  $('#qnaDiv').show('slow');
	    	  $('#userinfoDiv').hide();
	    	  $('#likeDiv').hide();
	      })
	      $('#leave').click(function(){
	    	  location.href='/user/delete';
	      });
	})
</script>  
</head>

<body>
<div class="w3-content">

  <!-- Header -->
  <header class="w3-container">
    <a href="#"><img src="img_avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <h1><b>My Page</b></h1>
    <div class="w3-section w3-bottombar w3-padding-16" id="buttons">
      <span class="w3-margin-right">조회 : </span>
      <button class="w3-btn w3-white w3-hover-black w3-round-large" id="myInfo">
      <i class="fa fa-user">&nbsp;내 정보</i></button>
      <button class="w3-btn w3-white w3-hover-black w3-round-large" id="myLike">
      <i class="fa fa-heart-o w3-margin-right w3-round-large">&nbsp;좋아요</i></button>
      <button class="w3-btn w3-white w3-hover-black w3-hide-small w3-round-large" id="myDateCourse">
      <i class="fa fa-paper-plane-o w3-margin-right">&nbsp;나의 데이트 코스</i></button>
      <button class="w3-btn w3-white w3-hover-black w3-hide-small w3-round-large" id="myQnA">
      <i class="fa fa-question-circle-o w3-margin-right">&nbsp;나의 Q&A</i></button>
      <button class="w3-align-right w3-btn w3-black w3-hover-black w3-hide-small w3-round-large" id="leave">
      <i class="fa fa-sign-out">&nbsp;탈퇴</i></button>
    </div>
  </header>

  <!-- 회원 정보 수정-->
  <div id="userinfoDiv" style="display: none;">
    <h1>회원정보 수정</h1> 
  <div align="center">
    <form id="edit_form" method="post" >
      <table >
        <tr>
          <td width="30%" height="30px" bgcolor="#ececec" align="center">아이디</td>
          <td><input type="text" name="u_id"  maxlength="12" value="${user.u_id }" readonly="readonly">
        </tr>
        <tr>
          <td height="30px" bgcolor="#ececec" align="center" >비밀번호</td>
          <td><input type="password" name="u_pass1" placeholder="비밀번호" maxlength="12" autofocus ></td>
        </tr>
        <tr>
          <td height="30px" bgcolor="#ececec" align="center">비밀번호확인</td>
          <td><input type="password" name="u_pass2" placeholder="비밀번호" maxlength="12"></td>
                    <td>
                    </td>
        </tr>
        <tr>
          <td height="30px" bgcolor="#ececec" align="center">이름</td>
          <td><input type="text" name="u_name" maxlength="5" value="${user.u_name }" readonly="readonly"></td>
        </tr>
        <tr>
          <td height="30px" bgcolor="#ececec" align="center">성별</td>
          <td><input type="text" name="u_gender" value="${user.u_gender }" readonly="readonly">
        </tr>
        <tr>
        <td height="30px" bgcolor="#ececec" align="center" >생년월일</td>
          <td><input type="text" name="u_year" size="5" maxlength="4" value="${user.u_year }">년 <input
            type="text" name="u_month" size="5" maxlength="2" value="${user.u_month }">월 <input type="text"
            name="u_day" size="5" maxlength="2" value="${user.u_day }">일</td>
        </tr>
        
        
        <tr>
          <td height="50px" size="10" bgcolor="#ececec" align="center">메일주소</td>
          <td><input type="text" name="u_email1" maxlength="15" value="${user.u_email1 }">@ <select
            name="u_email2"  >
              <option value="naver.com">naver.com</option>
              <option value="nate.com">nate.com</option>
              <option value="daum.net">daum.net</option>
              <option value="gmail.com">gmail.com</option>
              <option value="intizen.com">intizen.com</option>
          </select>
        </tr>
        <tr>
          <td height="30px" bgcolor="#ececec" align="center">휴대폰번호</td>
          <td><input type="text" name="u_tel1" value="010" size="5" readonly="readonly">-<input
            type="text" name="u_tel2" size="5" maxlength="4" value="${user.u_tel2 }">-<input type="text"
            name="u_tel3" size="5" maxlength="4" value="${user.u_tel3 }"></td>
        </tr>
        <tr>
         <td height="30px" bgcolor="#ececec" align="center">거주지역</td>
          <td>
          <span id="sp1"></span>
          <span id="sp2"></span>
          
          </td>
        </tr>
      </table>
      <Br> <input type="button" value="수정하기" align="center" id="formEditCheck" onclick="myInfoUpdate()"> 
      <input type="reset" value="취소하기" align="center" name="cancel">
    </form>
  
    </div>
</div>
<!-- 좋아요 -->
<div id="likeDiv" style="display: none;">
	<table id="likeTable" class="w3-table  w3-centered">
	</table>
	
	<center>
	<ul id="likePage" class='w3-pagination'>
	</ul>	
	</center>
</div>
<!-- 나의 데이트 코스 -->
<div id="dateCourseDiv" style="display:none;">
	<table id="myCourseTable" class="w3-table  w3-centered">
		
	</table>
	
	<center>
	<ul id="dcPage" class='w3-pagination'>
	</ul>	
	</center>
</div>

<!-- 나의 Q&A -->
<div id="qnaDiv" style="display:none;">
	<table id="myQnATable" class="w3-table  w3-centered">
	</table>
	
	<center>
	<ul id="QnAPage" class='w3-pagination'>
	</ul>	
	</center>

</div>
 


  <footer class="w3-container w3-padding-32 w3-white" id='mypage-footer'>
  <div class="w3-row-padding" id="footer-content">
    <div class="w3-third">
      <h3>꽃 - 김춘수</h3>
      <p>내가 그의 이름을 불러 주기 전에는
		그는 다만
		하나의 몸짓에 지나지 않았다.
		
		내가 그의 이름을 불러 주었을 때
		그는 나에게로 와서
		꽃이 되었다.</p>
    </div>
  
    <div class="w3-third">
    	<h3>&nbsp;</h3>
      <p>내가 그의 이름을 불러 준 것처럼
		나의 이 빛깔과 향기(香氣)에 알맞는
		누가 나의 이름을 불러다오.
		그에게로 가서 나도
		그의 꽃이 되고 싶다.</p>
    </div>

    <div class="w3-third">
    	<h3>&nbsp;</h3>
      <p>
		 우리들은 모두
		무엇이 되고 싶다.
		너는 나에게 나는 너에게
		잊혀지지 않는 하나의 의미가 되고 싶다.
      </p>
    </div>

  </div>
  </footer>

</div>
</body>
</html>