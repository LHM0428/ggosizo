<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">


 <script type="text/javascript" src="/resources/user/js/user_update.js"></script>
 <link rel="stylesheet" href="/resources/user/css/user_update.css">
 
 <script type="text/javascript">
 window.onload = function(){
 	var email = "${userinfoDTO.u_email2}";
 	var selectSido = '${userinfoDTO.u_addr1}';
	var selectGugun = '${userinfoDTO.u_addr2}';
	selectAddr(selectSido, selectGugun);
 }
 </script>
<title>회원정보 수정</title>
</head>
<body>
<center>
<div id="main_header" ></div>
</center>
<div id="main_nav"></div>


  <h1>회원정보 수정</h1> 
  <div align="center">
    <form id="edit_form" method="post" >
      <table >
        <tr>
          <td width="30%" height="30px" bgcolor="#ececec" align="center">아이디</td>
          <td><input type="text" name="u_id"  maxlength="12" value="${userinfoDTO.u_id }" readonly="readonly">
        </tr>
        <tr>
          <td height="30px" bgcolor="#ececec" align="center" >비밀번호</td>
          <td><input type="password" name="u_pass1" placeholder="비밀번호" maxlength="12" autofocus ></td>
        </tr>
        <tr>
          <td height="30px" bgcolor="#ececec" align="center">비밀번호확인</td>
          <td><input type="password" name="u_pass2" placeholder="비밀번호" maxlength="12"></td>
                    <td>
                    (6-12,영문,숫자)
                    </td>
        </tr>
        <tr>
          <td height="30px" bgcolor="#ececec" align="center">이름</td>
          <td><input type="text" name="u_name" maxlength="5" value="${userinfoDTO.u_name }" readonly="readonly"></td>
        </tr>
        <tr>
          <td height="30px" bgcolor="#ececec" align="center">성별</td>
          <td><input type="text" name="u_gender" value="${userinfoDTO.u_gender }" readonly="readonly">
        </tr>
        <tr>
        <td height="30px" bgcolor="#ececec" align="center" >생년월일</td>
          <td><input type="text" name="u_year" size="5" maxlength="4" value="${userinfoDTO.u_year }">년 <input
            type="text" name="u_month" size="5" maxlength="2" value="${userinfoDTO.u_month }">월 <input type="text"
            name="u_day" size="5" maxlength="2" value="${userinfoDTO.u_day }">일</td>
        </tr>
        
        
        <tr>
          <td height="50px" size="10" bgcolor="#ececec" align="center">메일주소</td>
          <td><input type="text" name="u_email1" maxlength="15" value="${userinfoDTO.u_email1 }">@ <select
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
            type="text" name="u_tel2" size="5" maxlength="4" value="${userinfoDTO.u_tel2 }">-<input type="text"
            name="u_tel3" size="5" maxlength="4" value="${userinfoDTO.u_tel3 }"></td>
        </tr>
        <tr>
         <td height="30px" bgcolor="#ececec" align="center">거주지역</td>
          <td>
          <span id="sp1"></span>
          <span id="sp2"></span>
          
          </td>
        </tr>
      </table>
      <Br> <input type="button" value="수정하기" align="center" id="formEditCheck" > <input
        type="reset" value="취소하기" align="center" name="cancel">
    </form>
  
  
  <!-- --------------------------슬라이드 이미지 구성 끝------------------------------ -->
<br>
<br>

</div>
</body>





</html>