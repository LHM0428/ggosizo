<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
 <script type="text/javascript" src="/resources/manage/js/manage.js"></script>
 
<c:if test="${m_check ==true}">
<h3>관리자 화면</h3>
<ul class="tab">
  <li><a href="#" class="tablinks" onclick="openCity(event, 'user_manage')">회원관리</a></li>
  <li><a href="#" class="tablinks" onclick="openCity(event, 'homepage_manage')">홈페이지 관리</a></li>
  <li><a href="#" class="tablinks" onclick="openCity(event, 'set_manage')">광고설정</a></li>
</ul>

<div id="user_manage" class="tabcontent">
  <h3>회원관리</h3>
  <p>이페이지는 회원 관리하는 곳</p>
  <div name="nav" align="center">
  아이디 :  <input type="text" id="u_id" ><br><br>
  <input type="button" id="user_insert" value="추가" >
  <input type="button" id="user_update" value="수정" >
  <input type="button" id="user_delete" value="삭제" >
  <input type="button" id="user_list" value="보기" >
  </div>
  <br>
  <br>
  <div id="user_Form">
 <table cellpadding="5" width="100%" style="margin-left:auto; margin-right:auto">
   <tr bgcolor="#91A8D0">
     <th width="10%"  >번호</th>
     <th width="30%" >아이디</th>
     <th width="30%" >이름</th>
     <th width="10%" >성별</th>
     <th width="50%" >전화번호</th>
     <th width="50%" >이메일</th>
   </tr>  
  <c:forEach var="userinfoVO" items="${list }" varStatus="stat">
    <tr>
       <td align="center">${stat.count}</td>
       <td align="center">${userinfoVO.u_id}</td>
       <td align="center">${userinfoVO.u_name}</td>
       <td align="center">${userinfoVO.u_gender}</td>
       <td align="center">${userinfoVO.u_tel}</td>
       <td align="center">${userinfoVO.u_email}</td>
    </tr>
  </c:forEach>  
    
   </table>  
    <br><br>
    <div name = "page" align="center">
  <c:forEach var="i" begin="1" end="${totalPage }" step="1">
  
    [ <a href=javascript:location.href='/manage/list?page=${ i}'>${ i}</a> ]
  </c:forEach>
  </div>
  </div>
  
</div>

<div id="homepage_manage" class="tabcontent">
  <h3>홈페이지 관리</h3>
  <p><a href="/main" target="iframe_a">메인화면 보기</a></p> 
  <input type="button" onclick="openmain()" value="새창으로 보기">
  <script type="text/javascript">
  		function openmain(){
  			window.open("/main", '관리자 화면', 'width=800, height=600');
  		}
  </script>
  <iframe width="100%" height="600px" src="/main" name="iframe_a"></iframe>

</div>

<div id="set_manage" class="tabcontent">
  <h3>광고 설정</h3>
  <p>광고 설정</p>
  <form action="/manage_adv_insert" method="post" enctype="multipart/form-data">
    <fieldset>
      <table>
        <tr>
          <th>광고이름</th>
          <td><input type="text" name="name" required="required" placeholder="이름"></td>
        </tr>
        <tr>
          <th>조회수</th>
          <td><input type="text" name="viewcnt" required="required" placeholder="조회수"></td>
        </tr>
        <tr>
          <th>가격</th>
          <td><input type="text" name="price" required="required" placeholder="가격"></td>
        </tr>
        <tr>
          <th>url주소</th>
          <td><input type="text" name="url_name" required="required" placeholder="url주소"></td>
        </tr>
        <tr>
          <th>최대조회수</th>
          <td><input type="text" name="max_viewcnt" required="required" placeholder="최대조회수"></td>
        </tr>
        <tr>
          <th>파일</th>
          <td><input type="file" name="uploadfile" required="required"></td>
        </tr>
        <tr>
          <td colspan="2">
            <input type="submit" value="작성">
            <input type="reset" value="취소">
          </td>
        </tr>
      </table>
    </fieldset>
  </form>
</div>
  </c:if>
  
  
  <c:if test="${m_check ==false}">
  <c:set var="m_check" value="false"></c:set>
    false
    <script type="text/javascript">
    	alert('아이디와 비밀번호가 틀렸습니다.');
    setTimeout(function(){
			location.href="/manage";
    },3000)
	</script>
  </c:if>