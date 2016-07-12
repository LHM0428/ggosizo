<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
	<script type="text/javascript">
		/* $(document).ready(function(){
			
			$('#update').click(function(){
				$.ajax({
			    	  url:'notice.do',
			    	  data:{
			    		  action:"update",
			    		  author:$('[name=author]').val(),
			    		  title:$('[name=title]').val(),
			    		  content:$('[name=content]').val(),
			    		  no:$('[name=no]').val(),
			    		  pass:$('[name=pass]').val()
			    		  },
			    	  type:'POST',
			    	  success:function(data){
			    		  alert(data)
			    		  if(data=='SUCCESS'){
			    			 location.href="notice.do";
			    		  }else{
			    			 alert('Error')
			    		  }
			    	  }
			      });//ajax	
			});
			
			$('#cancel').click(function(){
				$.ajax({
			    	  url:'notice.do',
			    	  data:{action:"form"},
			    	  type:'POST',
			    	  success:function(){
			    		  location.href="notice.do";
			    	  }
			      });//ajax	
			});
			
		}); */
		
		$(document).ready(function() {
			var formObj = $("form[role='form']");
			console.log(formObj);

			$('#edit').on("click", function(){
			self.location ="/qna/qnaPage?page=${cri.page}&perPageNum=${cri.perPageNum}"
				+"&searchType=${cri.searchType}&keyword=${cri.keyword}";
				
			});
			$("#cancel").on("click",function() {
				self.location ="/qna/qnaPage";

			});
		});
		
		
	</script>
</head>
<body>
	<div class="w3-container"
			style="padding-left: 10%; padding-right: 10%">	
	<form role="form" action="/qna/update_form" method="post">
        	 <input type="hidden" name="qna_no" value="${qna.qna_no }">
        	 <input type='hidden' name='page' value ="${cri.page}">
   			 <input type='hidden' name='perPageNum' value ="${cri.perPageNum}">
   			 <input type='hidden' name='searchType' value ="${cri.searchType}">
   			 <input type='hidden' name='keyword' value ="${cri.keyword}">
    	 <table style="width: 100%; height: auto;" class="w3-table w3-bordered w3-card-4">
     	  <tr>
        	 <td bgcolor="orange" width="80px">작성자</td>
        	 <td width="800px">
        	 <input type="text" name="qna_writer" readonly="readonly" value="${qna.qna_writer }" ></td>
      	  </tr>
      	  <tr>
        	 <td bgcolor="orange" width="80px">제목</td>
        	 <td width="800px"><input type="text"  name="qna_title" value="${qna.qna_title }"></td>
      	  </tr>
	       <tr>
	         <td colspan="2"><textarea rows="15"  cols="84" name="qna_content">${qna.qna_content }</textarea> </td>
	       </tr>
	     </table>
	   
	     <br>
	     
	     	   <button type="submit" id="edit">수정</button>
	     	   <button type="button" id="cancel">취소</button>
	           <!-- <input type="submit" value="수정">
	           <input type="reset" value="취소"> -->  </form> 
	          
	  
	</center>
</body>
</html>