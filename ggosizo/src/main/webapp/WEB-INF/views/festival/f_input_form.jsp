<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>축제 입력</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<link href="/resources/w3/css/w3_bodacious.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3-theme-pink.css">
<script src="/resources/plugin/jquery/jquery.js"></script>
	
	<style>
		.fileDrop {
		  width: 95%;
		  height: 100px;
		  border: 1px dotted gray;
		  background-color: lightgray;
		  margin: auto;
		}
	</style>

	<script type="text/javascript">
		$(document).ready(function(){
	    	  var sido = $('#sp1').text();
	    	  var formObj = $("form[role='form']");
	    	  
	    	  $.ajax({
		    	  url:'/mypage/selecSido',
		       	  method:'POST',
		       	  success:function(result){
		       		  $('#sp1').html(result);
		       		  $('select[name=u_addr1]').attr("name","si");
		       	  }
		      });
		      
		      $('#sp1').change(function(){
			      var sido = $('select[name=si]').val();
			      $.ajax({
			    	  url:'/mypage/selecGugun',
			    	  method: "POST",
			       	  data:{
			       		    sido:sido
			       	  },
			       	  success:function(result){
			       		  $('#sp2').html(result);
			       		$('select[name=u_addr2]').attr("name","gugun");
			       	  } 
			      });
		      });//sido change
		      $('#sp2').change(function(){
			      var gugun = $('select[name=gugun]').val();
			      alert(gugun)
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
		      });//sido change
	      
	    //사진미리보기
			 $('#files').change(function(){
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
		    
			$('#list').on("click",function(){
				self.location ="/festival/list?page=${cri.page}&perPageNum=${cri.perPageNum}"
						+"&searchType=${cri.searchType}&keyword=${cri.keyword}&month=${cri.month}";
			});		
			
			var template = Handlebars.compile($("#template").html());

			$(".fileDrop").on("dragenter dragover", function(event){
				event.preventDefault();
			});


			$(".fileDrop").on("drop", function(event){
				event.preventDefault();
				var files = event.originalEvent.dataTransfer.files;
				var file = files[0];
				var formData = new FormData();
				formData.append("file", file);	
				
				$.ajax({
					  url: '/uploadAjax',
					  data: formData,
					  dataType:'text',
					  processData: false,
					  contentType: false,
					  type: 'POST',
					  success: function(data){
						 
						  var fileInfo = getFileInfo(data);
						  
						  var html = template(fileInfo);
						  $(".uploadedList").append(html);
					  },
					  error:function(a){
						  alert(a.responseText);
					  }
					});	
			});
	
			$('#insert').click(function(){
				formObj.submit();
			});
				      
		})
		</script>
</head>
<body>
<form role="form" method="post" action="/festival/inputForm" enctype="multipart/form-data">
<input type="hidden" name="viewcnt" value="0">
<input type="hidden" name="replycnt" value="0">
<input type="hidden" name="likecnt" value="0">

<input type="hidden" name="category" value="축제">
<input type="hidden" name="addr" value="이놈">
<input type="hidden" name="no" value="0">

<div class="w3-container w3-row">
	<div class="w3-col m3">&nbsp;</div>
	<div class="w3-col m6">
		<div class="w3-card-8 w3-white">
			<div class="w3-container w3-center w3-theme w3-text-white w3-round">
				<h2>축제 등록</h2>
			</div>
		</div>
		<div class="w3-container w3-card-8 w3-white w3-round">
		<br>
			<label>작성자</label>
			<input type="text" class="w3-input" style="width:30%" name="writer" value="${login }" readonly="readonly">
			<label>축제명</label>
			<input type="text" class="w3-input w3-animate-input" id="name" name="name" style="width:30%" required="required">
			<label>주소선택</label><br>
			<span id="sp1"></span>
			<span id="sp2"><select><option>선택</option></select></span>
			<span id="sp3"><select><option>선택</option></select></span><br>
			<label>상세주소</label>
			<textarea id="coming" name="coming" class="w3-input w3-border"
			style="width:100%; height:80px; resize: none;"></textarea>
			<label>가격</label>
			<input type="text" class="w3-input w3-animate-input" id="price" name="price" style="width:30%">
			<label>축제설명</label>
			<textarea id="content" name="content" class="w3-input w3-border"
			style="width:100%; height:150px; resize: none;"></textarea>
			<label>축제일시</label><br>
			<select name="year1" id="year1">
					<%
						for(int i=16; i<=50;i++){
							out.write("<option value='"+i+"'>"+i+"</option>");
						}
					%>
				</select>년
				<select name="month1" id="month1">
					<%
						for(int i=1; i<=12;i++){
							if(i<10){
								out.write("<option value='0"+i+"'>0"+i+"</option>");
							}else{
								out.write("<option value='"+i+"'>"+i+"</option>");								
							}
						}
					%>
				</select>월
				<select name="day1" id="day1">
					<%
						for(int i=1; i<=31;i++){
							if(i<10){
								out.write("<option value='0"+i+"'>0"+i+"</option>");
							}else{
								out.write("<option value='"+i+"'>"+i+"</option>");								
							}
						}
					%>
				</select>일 ~
				<select name="year2" id="year2">
					<%
						for(int i=16; i<=50;i++){
							out.write("<option value='"+i+"'>"+i+"</option>");
						}
					%>
				</select>년
				<select name="month2" id="month2">
					<%
						for(int i=1; i<=12;i++){
							if(i<10){
								out.write("<option value='0"+i+"'>0"+i+"</option>");
							}else{
								out.write("<option value='"+i+"'>"+i+"</option>");								
							}
						}
					%>
				</select>월
				<select name="day2" id="day2">
					<%
						for(int i=1; i<=31;i++){
							if(i<10){
								out.write("<option value='0"+i+"'>0"+i+"</option>");
							}else{
								out.write("<option value='"+i+"'>"+i+"</option>");								
							}
						}
					%>
				</select>일<br>
			<label>연락처</label>
			<input type="text" class="w3-input w3-animate-input" name="tel" id="tel" style="width:40%">
			<label>운영시간</label>
			<input type="text" class="w3-input w3-animate-input" name="openhour" id="openhour" style="width:40%"> 
			<label>휴관일</label>
			<input type="text" class="w3-input w3-animate-input" name="closeday" id="closeday" style="width:40%">
			<label>홈페이지</label>
			<input type="text" class="w3-input w3-animate-input" name="url" id="url" style="width:40%">
			<label>사진</label>
			<div class="col-lg-12" id="photo_div" style="display: none;">
                  <img alt="첨부 이미지가 없습니다." src="" id="photo" width="250px" height="200px" >
                </div>
			<input class="w3-input" type="file" id="files" name="files" maxlength="5"> 
		<!-- /.box-body 파일 미리 보여주기 영역-->
		<!-- 	<div class="box-footer">
				<div>
					<hr>
				</div>
				<ul class="mailbox-attachments clearfix uploadedList">
				</ul>
			</div>
			<div align="center">
			</div> -->
				<button type="submit" id="insert" class="btn btn-primary">등록</button>
				<button type="button" id="list" class="btn btn-danger">목록</button>
			<br>
		</div>
	</div>
</div>
</form>
</body>

<script type="text/javascript" src="/resources/upload/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
</script>    

<script>

/* var template = Handlebars.compile($("#template").html());

$(".fileDrop").on("dragenter dragover", function(event){
	event.preventDefault();
});


$(".fileDrop").on("drop", function(event){
	event.preventDefault();
	
	var files = event.originalEvent.dataTransfer.files;
	
	var file = files[0];

	var formData = new FormData();
	
	formData.append("file", file);	
	
	
	$.ajax({
		  url: '/uploadAjax',
		  data: formData,
		  dataType:'text',
		  processData: false,
		  contentType: false,
		  type: 'POST',
		  success: function(data){
			  
			  var fileInfo = getFileInfo(data);
			  
			  var html = template(fileInfo);
			  
			  $(".uploadedList").append(html);
		  }
		});	
});


 $("#registerForm").submit(function(event){
	event.preventDefault();
	
	var that = $(this);
	
	var str ="";
	$(".uploadedList .delbtn").each(function(index){
		 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
	});
	
	that.append(str);

	that.get(0).submit();
});  */


</script>
</html>