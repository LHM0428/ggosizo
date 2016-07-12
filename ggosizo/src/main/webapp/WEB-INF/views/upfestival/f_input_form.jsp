<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>축제 입력</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css">
<script src="/resources/plugin/jquery/jquery.js"></script>
<link href="/resources/w3/css/w3_bodacious.css" rel="stylesheet" type="text/css" />
	
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
		       		  $('select[name=u_addr1]').attr("name","sido");
		       	  }
		      });
		      
		      $('#sp1').change(function(){
			      var sido = $('select[name=sido]').val();
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
				formData.append("category", "festival");
				$.ajax({
					  url: '/upfestival/uploadAjax',
					  data: formData,
					  dataType:'text',
					  processData: false,
					  contentType: false,
					  type: 'POST',
					  success: function(data){
						  alert(data)
						  var fileInfo = getFileInfo(data);
						  fileInfo.imgsrc = '/upfestival'+fileInfo.imgsrc
						  var html = template(fileInfo);
						  
						  $(".uploadedList").append(html);
					  }
					});	
			});


			 $("#registerForm").submit(function(event){
				alert("버튼클릭");	
					
				//유효성검사
				var name = $('#name').val();
				var sp1 = $('#sp1').val();
				var addr = $('#addr').val();
				var year1 = $('#year1').val();
				var month1 = $('#month1').val();
				var day1 = $('#day1').val();
				var year2 = $('#year2').val();
				var month2 = $('#month2').val();
				var day2 = $('#day2').val();
				var tel = $('#tel').val();
				var openhour = $('#openhour').val();
				
				if(name==""){
					alert("축제명은 필수입력사항입니다.");
				}else if(sp1=="선택"){
					alert("주소선택은 필수입력사항입니다.");
				}else if(addr==""){
					alert("주소는 필수입력사항입니다.");
				}else if(tel==""){
					alert("연락처는 필수입력사항입니다.");
				}else if(openhour==""){
					alert("운영시간은 필수입력사항입니다.");
				}else{
					event.preventDefault();
					
					var that = $(this);
					
					var str ="";
					$(".uploadedList .delbtn").each(function(index){
						 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
					});
					
					that.append(str);

					that.get(0).submit();
				}   				
				
			}); 
			
			
			
			
	      
		})
		</script>
</head>
<body>
<input type="hidden" name="si" value="서울">
<input type="hidden" name="viewcnt" value="0">
<input type="hidden" name="replycnt" value="0">
	<center>
	<!--  -->
		<form role="form" id='registerForm' action="/upfestival/inputForm" method="post" enctype="multipart/form-data">
		<table class="w3-table w3-striped w3-bordered w3-border">
			<tr><td width=10%>작성자</td>	<td><input type="text" name="writer"></td></tr>
			<tr><td width=10%>축제 명</td>	<td><input type="text" name="name"></td></tr>
			<tr><td width=10%>주소 선택</td>
				<td><span id="sp1"></span>
					<span id="sp2"><select><option>선택</option></select></span>
					<span id="sp3"><select><option>선택</option></select></span>
				</td></tr>
			<tr><td width=10%>축제 컨셉</td>
				<td><input type="text" name="category"></td></tr>	
			<tr><td width=10%>가격</td>
				<td><textarea name="price" rows="3" cols="25"></textarea></td></tr>	
			<tr><td width=10%>축제 설명</td>
				<td><textarea name="content" rows="5" cols="50"></textarea></td></tr>
			<tr><td width=10%>상세주소</td>
				<td><input type="text" name="addr" size="48px"></td></tr>
			<tr><td width=10%>축제 일시</td>
				<td><select name="year1" id="year1">
					<%
						for(int i=16; i<=50;i++){
							out.write("<option>"+i+"</option>");
						}
					%>
				</select>년
				<select name="month1" id="month1">
					<%
						for(int i=1; i<=12;i++){
							if(i<10){
								out.write("<option>0"+i+"</option>");
							}else{
								out.write("<option>"+i+"</option>");								
							}
						}
					%>
				</select>월
				<select name="day1" id="day1">
					<%
						for(int i=1; i<=31;i++){
							if(i<10){
								out.write("<option>0"+i+"</option>");
							}else{
								out.write("<option>"+i+"</option>");								
							}
						}
					%>
				</select>일 ~
				<select name="year2" id="year2">
					<%
						for(int i=16; i<=50;i++){
							out.write("<option>"+i+"</option>");
						}
					%>
				</select>년
				<select name="month2" id="month2">
					<%
						for(int i=1; i<=12;i++){
							if(i<10){
								out.write("<option>0"+i+"</option>");
							}else{
								out.write("<option>"+i+"</option>");								
							}
						}
					%>
				</select>월
				<select name="day2" id="day2">
					<%
						for(int i=1; i<=31;i++){
							if(i<10){
								out.write("<option>0"+i+"</option>");
							}else{
								out.write("<option>"+i+"</option>");								
							}
						}
					%>
				</select>일</td></tr>
			<tr><td width=10%>오시는 길</td>
				<td><textarea name="coming" rows="2" cols="50"></textarea></td></tr>	
			<tr><td width=10%>연락처</td>
				<td><input type="text" name="tel" size="30px"></td></tr>	
			<tr><td width=10%>운영 시간</td>
				<td><input type="text" name="openhour" size="30px"></td></tr>	
			<tr><td width=10%>쉬는 날</td>
				<td><input type="text" name="closeday" size="30px"></td></tr>	
			<tr><td width=10%>사진</td>
				<!-- <td><input type="file" id="files" name="files"> -->
				
			<!-- 사진 미리보기 -->
				
			<td><div class="form-group">
				<label for="exampleInputEmail1">File DROP Here</label>
				<div class="fileDrop"></div>
			</div>
				
									
				<!-- <div class="col-lg-12" id="photo_div" style="display: none;">
                     <img alt="첨부 이미지가 없습니다." src="" id="photo" width="250px" height="200px" >
                </div>	 -->
				</td>	
			</tr>	
			<tr><td width=10%>홈페이지</td>
				<td><input type="text" name="url" size="30px"></td></tr>	
		</table>
		
		<!-- /.box-body 파일 미리 보여주기 영역-->

			<div class="box-footer">
				<div>
					<hr>
				</div>
		
				<ul class="mailbox-attachments clearfix uploadedList">
				</ul>
		
				<!-- <button type="submit" class="btn btn-primary">Submit</button> -->
		
			</div>
		
	</center>
	<!-- <input type="hidden" id="startdate" name="startdate" value="">
	<input type="hidden" id="enddate" name="enddate" value=""> -->
			<button type="submit" id="insert" class="btn btn-primary">등록</button>
			<button type="button" id="list" class="btn btn-danger">목록</button>
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