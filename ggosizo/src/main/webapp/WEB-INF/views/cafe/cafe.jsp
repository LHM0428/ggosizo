<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>카페</title>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link href="/resources/w3/css/w3_bodacious.css" rel="stylesheet" type="text/css" />
<script src="/resources/plugin/jquery/jquery.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

<script src="/resources/plugin/handlebars/handlebars-v4.0.5.js"></script>


<script src="/resources/plugin/course/courseFunc.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.0/css/font-awesome.min.css">
<style type="text/css">
   .modDiv{
      padding: 10px;
      z-index: 1000;
   }
header,html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif}
a{text-decoration: none;
color: black;}
</style>
   <script type="text/javascript">
   //replyModify, replyDelete,myAccFunc, addReply
   var course = 'cafe';
   var loginId = '${login}';
      $(document).ready(function(){
    	 if(loginId==null)loginId='${m_chekc}';
         inIt(course,loginId);//course, login 초기화;
         
               var sido = $('#sp1').text();
               $.ajax({
                  url:'/cafe/selecSido',
                   data:{
                        sido:sido,
                   },
                   method:'POST',
                   success:function(result){
                      $('#sp2').html(result);
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
            
         $('#bt_showAll').click(function(){
            self.location="list"+'${pageMaker.makeQuery(1)}'
         });//bt_showAll
         
         $('#bt_addSearch').click(function(){
              var sido = $('#sp1').text();
               var gugun = $('[name=gugun]').val();
               var dong = $('[name=dong]').val();
               
               self.location="list"+'${pageMaker.makeQuery(1)}'
               +"&criGugun="+gugun+"&criDong="+dong;
         });
         
         $('#bt_insert').click(function(){
            if(loginId==null){
               alert('로그인이 필요합니다.')
            }else{
               self.location="/cafe/inputForm";
            }
         })
         
         $("#keyword").keydown(function(e){
            if(e.keyCode==13){
               var keyword = $("#keyword").val();
               searchKeyword(keyword);
            }
         })//엔터 검색
         $("#searchKeyword").click(function(){
            var keyword = $("#keyword").val();
            searchKeyword(keyword);
         })//검색키 클릭시
      });//ready
   </script>
</head>
<%--cafe.jsp --%>
<body>
<div class="w3-container">
<div class="w3-theme-l2  w3-round-large">
<div class="w3-center w3-padding">
  <h4 style="">내가 원하는 카페</h4>
  <h1 class="w3-xxxlarge w3-animate-bottom" style="">카페를 찾아라</h1>
    <div class="w3-padding-32">
       <div class="w3-round-large w3-theme w3-padding w3-margin-bottom">
         주소 검색 : <span id="sp1">서울</span>
         <span id="sp2"><select class="w3-btn w3-theme w3-hover-white w3-round-large">
         <option>선택</option></select></span>
         <span id="sp3"><select  class="w3-btn w3-theme w3-hover-white w3-round-large">
         <option>선택</option></select></span>
         <button id="bt_addSearch" class="w3-btn w3-border-white w3-theme w3-hover-white w3-round-xlarge">
         검색</button>
         <button id="bt_showAll" class="w3-btn w3-border-white  w3-theme w3-hover-white w3-round-xlarge">
         전체 카페 정보 보기</button>
         <button id="bt_insert" class="w3-btn w3-border-white  w3-theme w3-hover-white w3-round-xlarge">카페 등록하기</button>
      </div>
    </div>
  </div>
<div class="row w3-container">
     <div class="col-xs-4"></div>
     <div class="col-xs-4 w3-centerd">
        <input id="keyword" class="w3-text-theme w3-input w3-theme-border w3-border w3-round-large" type="text" style="width:100%;" placeholder="검색">
     </div>
     <button id="searchKeyword" class="w3-theme-l2 w3-border w3-theme-border w3-hover-theme w3-round-xlarge w3-btn w3-large" style="height:39px">
     <i class="fa fa-search">&nbsp;검색</i></button>
  </div>
<div class="w3-row w3-large w3-theme-l2 w3-round-large w3-margin-top" style="height:40px">
       <div class="col-xs-8 w3-left-align w3-medium" >번호&nbsp;&nbsp;&nbsp;&nbsp;제목</div>
       <div class="col-xs-1 w3-align-right w3-medium" >작성자</div>
       <div class="col-xs-1 w3-center w3-medium" >조회수</div>
       <div class="col-xs-2 w3-center w3-medium">작성일</div>
</div> 
</div>
</div>
<div class="w3-container">
   <div class="w3-accordion" id="cafeList">
       <c:forEach items="${list }" var="cafe">
          <button onclick="myAccFunc('${cafe.no }', 'cafe', '${login }');" class="w3-padding-16 w3-hover-theme w3-btn-block w3-white w3-border">
          <div class="row"> 
             <div class="col-xs-8 w3-left-align" style="padding-left:20px "><small>${cafe.no }</small>
             &nbsp;&nbsp;&nbsp;&nbsp;${cafe.name }
             &nbsp;<small name='replycntSmall${cafe.no }'>[ ${cafe.replycnt} ]</small></div>
             <div class="col-xs-1 w3-center">
                ${cafe.writer }
             </div>
             <div class="col-xs-1 w3-center" >
                <small name='viewcntSmall${cafe.no }'>${cafe.viewcnt }</small>
             </div>
             <div class="col-xs-2 w3-center">
                <fmt:formatDate pattern="yy-MM-dd HH:mm" value="${cafe.regdate }"/>
             </div>
         </div>
         </button>
          
         <form id="form${cafe.no }" method="post">
            <input type='hidden' name='no' value="${cafe.no}">
            <input type='hidden' name='page' value="${param.page}">
            <input type='hidden' name='perPageNum' value="${param.perPageNum}">
            <input type='hidden' name='criGugun' value="${param.criGugun}">
            <input type='hidden' name='criDong' value="${param.criDong}">
            <input type='hidden' name='gugun' value="${cafe.gugun}">
            <input type='hidden' name='dong' value="${cafe.dong}">
         </form>
          
          <div id="${cafe.no }" class="w3-accordion-content w3-border w3-card-2">
              <table class="w3-table w3-striped w3-bordered w3-border">
                 <tr><td class="w3-theme-l2" style="width: 10%; ">카페 이름</td>
                    <td><b>${cafe.name }</b></td>
                    <c:if test="${cafe.img }">
                  <td colspan="20">${cafe.img }</td></c:if>
                    </tr>
                 <c:if test="${not empty cafe.category }">
                 <tr><td class="w3-theme-l2" style="width: 10%; ">카페 컨셉</td>
                 <td>${cafe.category }</td></tr></c:if>
                 <tr><td class="w3-theme-l2" style="width: 10%; ">주소</td>
                    <td>${cafe.si }&nbsp;${cafe.gugun }&nbsp;${cafe.dong }</td></tr>
                 <c:if test="${not empty cafe.price }">
                 <tr><td class="w3-theme-l2" style="width: 10%; ">메뉴 가격</td>
                 <td>${cafe.price }</td></tr></c:if>
                 <c:if test="${not empty cafe.content }">
                 <tr><td class="w3-theme-l2" style="width: 10%; ">카페 설명</td>
                 <td>${cafe.content }</td></tr></c:if>
                 <c:if test="${not empty cafe.addr }">
                 <tr><td class="w3-theme-l2" style="width: 10%; ">상세 주소</td>
                 <td>${cafe.addr }</td></tr></c:if>
                 <c:if test="${not empty cafe.coming }">
                 <tr><td class="w3-theme-l2" style="width: 10%; ">오시는 길</td>
                 <td>${cafe.coming }</td></tr></c:if>
                 <c:if test="${not empty cafe.tel }">
                 <tr><td class="w3-theme-l2" style="width: 10%; ">연락처</td>
                 <td>${cafe.tel }</td></tr></c:if>
                 <c:if test="${not empty cafe.openhour }">
                 <tr><td class="w3-theme-l2" style="width: 10%; ">운영 시간</td>
                 <td>${cafe.openhour }</td></tr></c:if>
                 <c:if test="${not empty cafe.closeday }">
                 <tr><td class="w3-theme-l2" style="width: 10%; ">쉬는 날</td>
                 <td>${cafe.closeday }</td></tr></c:if>
                 <c:if test="${not empty cafe.url }">
                 <tr><td class="w3-theme-l2" style="width: 10%; ">홈페이지</td>
                 <td>${cafe.url }</td></tr></c:if>
                 <c:if test="${not empty cafe.img }">
                 <tr><td class="w3-theme-l2" style="width: 10%; ">이미지</td>
                 <td><img alt="첨 부파일이 없습니다." src="/resources/uploadFiles/${cafe.img }" style="height:200px; width:300px"></td></tr></c:if>
               </table>
               <div class="w3-container w3-padding">
               <c:if test="${not empty login }">
                  <span class="w3-left">
                     <button id="likeBtn${cafe.no }" class="w3-btn w3-theme-l3 w3-round-large" onclick="likeUpdate('${cafe.no}', 'cafe', '${login}')">
                     <i class="fa fa-heart"></i>&nbsp;좋아요<small class="unlike" name='likecntSmall${cafe.no }'>[ ${cafe.likecnt} ]</small></button>
                     <button class="w3-btn w3-theme-d1 w3-round-large" onclick="openInputReply('${cafe.no}')">
                     <i class="fa fa-comment"></i>&nbsp;댓글</button>
                  </span>
             </c:if>
               <c:if test="${empty login }">
                  <span class="w3-left">
                     <button disabled id="likeBtn${cafe.no }" class="w3-btn w3-theme-l3 w3-round-large" onclick="likeUpdate('${cafe.no}', 'cafe', '${login }')">
                     <i class="fa fa-heart"></i>&nbsp;좋아요<small class="unlike" name='likecntSmall${cafe.no }'>[ ${cafe.likecnt} ]</small></button>
                     <button disabled class="w3-btn w3-theme-d1 w3-round-large" onclick="openInputReply('${cafe.no}')">
                     <i class="fa fa-comment"></i>&nbsp;댓글</button>
                  </span>
             </c:if>
             <c:if test="${login==cafe.writer ||not empty m_check}">
                  <span class="w3-right">
                     <button onclick="modifyCourse('${cafe.no}')"
                      id="modifyBtn" class="w3-hover-blue w3-btn w3-round-large w3-border w3-small w3-slim w3-white w3-border-blue">
                      <i class="fa fa-pencil-square-o"></i>&nbsp;수정</button>
                     <button onclick="deleteCourse('${cafe.no}')" id="deleteBtn"
                      class="w3-btn w3-white w3-border w3-border-red w3-round-large w3-small w3-slim w3-hover-red">
                      <i class="fa fa-trash"></i>&nbsp;삭제</button>
                  </span>
             </c:if>
               </div>
                     <div class="w3-row-padding" id="inputReply${cafe.no }" style="display: none;">
                        <input type="hidden" value='${login }' name='newReplyWriter' id='newReplyWriter${cafe.no }'>
                       <div class="w3-col m12">
                         <div class="w3-card-2 w3-round w3-theme-l4">
                           <div class="w3-container w3-padding">
                             <h6 class="w3-opacity">작성자 : ${login }</h6>
                             <p><input type="text" class="w3-border w3-padding" style="width:50%"
                             name='replytext' id='newReplyText${cafe.no }' placeholder='댓글 입력'></p>
                             <button onclick="addReply('${cafe.no}','cafe');" class="w3-round-large w3-btn w3-theme">
                                <i class="fa fa-pencil"></i>&nbsp;등록</button>
                             <button onclick='closeInputReply("${cafe.no}")' class='w3-round-large w3-btn w3-theme'>
                                <i class="fa fa-times"></i>&nbsp;취소</button>
                           </div>
                         </div>
                       </div>
                     </div>
                <div class="w3-text-theme w3-container w3-padding w3-center w3-round-large" style="width:16%">
                <i class="fa fa-comments-o"></i>&nbsp;댓글 리스트 <small name='replycntSmall${cafe.no }'>[ ${cafe.replycnt} ]</small>
                </div>
               <ul id="repliesDiv${cafe.no }" class="w3-ul"></ul>
               
               <div class="text-center">
               <ul class='w3-pagination w3-small pagi' id="replyPagination${cafe.no }"></ul>
               </div> 
         </div>
      </c:forEach>
<script>
  $(document).ready(function(){
     
   $(".pagi").on("click", "li a", function(event){
      event.preventDefault();
      replyPage = $(this).attr("href");
      no = $(this).attr("name");
      getPage("/cafeReplies/"+no+"/"+replyPage,no);
   });
   
  })
</script>

<script id="template" type="text/x-handlebars-template">
{{#each .}}
<li id="replyLi{{no}}" data-no={{reply_no}}>
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
         <button class="w3-round-large w3-btn w3-theme" onclick="replyModify('{{reply_no}}', 'cafe')">
            <i class="fa fa-pencil-square-o"></i>&nbsp;수정</button>
         <button class="w3-round-large w3-btn w3-theme" onclick="replyDelete('{{reply_no}}', 'cafe')">
            <i class="fa fa-eraser"></i>&nbsp;삭제</button>
         <button class="w3-round-large w3-btn w3-theme" onclick="replyClose('{{reply_no}}')">
            <i class="fa fa-times"></i>&nbsp;취소</button>
      </div>
   </div>
</div>
<!-- 글 번호 데이터 값 주기 위함 -->
<input type="hidden" value="{{no}}" id="cno{{reply_no}}">
{{/each}}
</script>

   <div class="text-center">
      <ul class="w3-pagination">
      <c:if test="${empty param.keyword }">
         <c:if test="${pageMaker.prev}">
            <li><a href="list${pageMaker.makeSidoSearch(pageMaker.startPage - 1) }"
            class="w3-hover-theme">&laquo;</a></li>
         </c:if>
         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
            <li
               <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
               <a href="list${pageMaker.makeSidoSearch(idx)}" class="w3-hover-theme">${idx}</a>
            </li>
         </c:forEach>
         <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <li><a href="list${pageMaker.makeSidoSearch(pageMaker.endPage +1) }"
            class="w3-hover-theme">&raquo;</a></li>
         </c:if>
      </c:if>
      <c:if test="${not empty param.keyword }">
         <c:if test="${pageMaker.prev}">
            <li><a href="searchList${pageMaker.makeSidoSearch(pageMaker.startPage - 1) }&keyword=${param.keyword}"
            class="w3-hover-theme">&laquo;</a></li>
         </c:if>
         <c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
            <li
               <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
               <a href="searchList${pageMaker.makeSidoSearch(idx)}&keyword=${param.keyword}" class="w3-hover-theme">${idx}</a>
            </li>
         </c:forEach>
         <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
            <li><a href="searchList${pageMaker.makeSidoSearch(pageMaker.endPage +1) }&keyword=${param.keyword}"
            class="w3-hover-theme">&raquo;</a></li>
         </c:if>
      </c:if>
      </ul>
   </div>
</div>
</div>   
</body>
</html>