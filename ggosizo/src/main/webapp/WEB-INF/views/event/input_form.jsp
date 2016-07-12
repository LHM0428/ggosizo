<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3-theme-blue.css">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function(){
			
			var formObj = $("form[role='form']");
						
			$('#insert').on("click",function(){	
				var event_title = $('#event_title').val();
				var event_content = $('#event_content').val();
			
				if(event_title==""){
					alert('제목은 필수입력사항입니다.');
				}else if(event_content==""){
					alert('내용을 입력해주세요.');
				}else{
					formObj.attr("action", "/event/input_form");
					formObj.attr("method", "post");
					formObj.submit();					
				}
			});
			
			$('#list').on("click",function(){
				self.location ="/event/event?page=${cri.page}&perPageNum=${cri.perPageNum}"
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

</head>
<body>
	<center>  		
  		 <form role="form" action="/event/input_form" method="post" enctype="multipart/form-data">
        	 <input type="hidden" name="event_no" id="event_no" value="0">
        	 <input type='hidden' name='page' value ="${cri.page}">
   			 <input type='hidden' name='perPageNum' value ="${cri.perPageNum}">
   			 <input type='hidden' name='searchType' value="${cri.searchType}">
			 <input type='hidden' name='keyword' value="${cri.keyword}">
    	 <table cellpadding="1" border="1" width="60%" >
			<tr class="w3-round-large w3-theme w3-padding w3-margin-bottom">
				<th>이미지</th>
				<th>category</th>
				<th>contents</th>
			</tr>
			<tr>
				<td rowspan="5">
				
				<div class="col-lg-12" id="photo_div" style="display: none;">
                     <img alt="첨부 이미지가 없습니다." src="" id="photo" width="250px" height="200px" >
                 </div>
				</td>
				<font size="4" face="굴림">
				
				<tr>
					<td style="color: skyblue">작성자</td> 
					<td><input type="text" readonly="readonly" style="width: 555px; border-color: skyblue" name="event_writer"" value="ggosizouser1"></td>
				</tr>
				<tr>
					<td style="color: skyblue">제목</td> 
					<td><input type="text" style="width: 555px; border-color: skyblue" id="event_title" name="event_title"></td>
				</tr>
				<tr>
					<td style="color: skyblue">내용</td> 
					<td><textarea rows="10" cols="70" style="border-color: skyblue" id="event_content" name="event_content"></textarea></td>
				</tr>
				</font>
				</td>
			</tr>
		</table>	
  		
	     <br>
	     <div class="form-group">
		     <table width="60%">
		 	 <tr>
	        	 <td bgcolor="skyblue" width="10%">파일</td>
	        	  <td colspan="3" width="70%"> <input type="file" id="file" class="multi" name="file" maxlength="5"/>	        	         	
	      	  </tr>
	      	  <tr>
	      	  <td></td>
	      	  </tr>
	      	</table> 
      	</div>
	
	  </form> 
	  <br>
	     	   <button type="button" id="insert">등록</button>
	     	   <button type="button" id="list">목록</button> 
	</center>
</body>
</html>