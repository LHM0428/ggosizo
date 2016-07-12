<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
			var formObj = $("form[role='form']");
			
			$('#insert').on("click",function(){
				var notice_title = $('#notice_title').val();
				var notice_content = $('#notice_content').val();
			
				if(notice_title==""){
					alert('제목은 필수입력사항입니다.');
				}else if(notice_content==""){
					alert('내용을 입력해주세요.');
				}else{
					formObj.attr("action", "/notice/input_form");
					formObj.attr("method", "post");		
					formObj.submit();					
				}
				
			});
			
			$('#list').on("click",function(){
				self.location ="/notice/noticePage?page=${cri.page}&perPageNum=${cri.perPageNum}"
						+"&searchType=${cri.searchType}&keyword=${cri.keyword}";
			});
			
			//사진미리보기
			$('#file').change(function(){
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
	<script type="text/javascript">
		
	</script>

</head>
<body>
	<center>
		
		<!-- <form action="notice.do?action=insert" method="post"> -->
  		<!-- <input type="hidden" name="action" value="insert"> -->
  		<form role="form" action="/notice/input_form" method="post" enctype="multipart/form-data">
  			<input type='hidden' name='page' value ="${cri.page}">
   			<input type='hidden' name='perPageNum' value ="${cri.perPageNum}">
   			<input type='hidden' name='searchType' value="${cri.searchType}">
			<input type='hidden' name='keyword' value="${cri.keyword}">
  		
    	 <table border="1" cellpadding="5" width="55%">
     	  <tr>
        	 <td bgcolor="orange" width="70px">작성자</td>
        	 <td width="800px" colspan="2"><input type="text" readonly="readonly" name="notice_writer" value="${id }"></td>
      	  </tr>
      	  <tr>
        	 <td bgcolor="orange" width="70px">제목</td>
        	 <td width="800px" colspan="2"><input type="text" id="notice_title" name="notice_title"></td>
      	  </tr>
	       <tr>
	         <td colspan="2"><textarea rows="20" cols="70" id="notice_content" name="notice_content"></textarea> </td>
	         <td><div class="col-lg-12" id="photo_div" style="display: none;">
                     <img alt="첨부 이미지가 없습니다." src="" id="photo" width="250px" height="200px" >
                 </div>
           </tr>
	           
	     </table>
	     <br>
	     <div class="form-group">
		     <table width="60%">
		 	 <tr>
	        	 <td bgcolor="orange" width="10%">파일</td>
	        	 <td colspan="3" width="70%"> <input type="file" id="file" class="multi" name="file" maxlength="5"/>	        	 
	        	</tr>
	      	  <tr>
	      	  <td></td>
	      	  </tr>
	      	</table> 
      	</div>
	    
	    
	    
	<!-- 다중파일 전송 때 사용할 폼     
		<div class="form-group">
		     <table width="60%">
		 	 <tr>
	        	 <td bgcolor="orange" width="10%">파일</td>
	        	 <td colspan="3" width="30%"> <input type="file" id="file" class="multi" name="file" maxlength="5"/>	        	 
	        	 <input type="file" id="file" name="file" multiple="multiple"> --><!--  <input type="submit" value="등록"></td>
	        	 <td width="30%"><input type="file" id="file2" name="files2" multiple="multiple"></td>
	        	 <td width="30%"><input type="file" id="file3" name="files3" multiple="multiple"></td>
	      	  </tr>
	      	  <tr>
	      	  <td></td>
	      	  	<td width="28%">
	      	  		<div class="col-lg-12" id="photo_div1" style="display: none;">
	      	  		-----------------------------------------------<br>
                     <img src="" id="photo1" width="250px" height="200px"><br>
	      	  		-----------------------------------------------
                 	</div>
                </td>
                <td width="28%">
	      	  		<div class="col-lg-12" id="photo_div2" style="display: none;">
	      	  		-----------------------------------------------<br>
                     <img src="" id="photo2" width="250px" height="200px"><br>
	      	  		-----------------------------------------------
                 	</div>
                </td>
                <td width="28%">
	      	  		<div class="col-lg-12" id="photo_div3" style="display: none;">
	      	  		-----------------------------------------------<br>
                     <img src="" id="photo3" width="250px" height="200px"><br>
	      	  		-----------------------------------------------
                 	</div>
                </td>
	      	  </tr>
	      	</table> 
      	</div>
      	 -->
	  </form> 
	  
	  <!-- <form role="fileForm" action="notice/input_form" method="post" enctype="multipart/form-data">
	 	<table>
	 	 <tr>
        	 <td bgcolor="orange" width="70px">파일</td>
        	 <td width="800px"><input type="file" name="notice_file"> <input type="submit"></td>
      	  </tr>
      	</table> 
      </form> -->     
	  <br>
	     	   <button type="submit" id="insert">등록</button>
	     	   <button type="button" id="list">목록</button>
	           
	</center>
</body>
</html>