$(document).ready(function(){
	$("#cancel").on("click",function(){
		 $("#u_id").val('');
		 $("#email").val('');
		 $("#u_tel1").val('');
		 $("#u_tel2").val('');
		 $("#u_tel3").val('');
	});
	  $('#check').click(function(){
		  var u_id = $("#u_id").val();
		  
		  if (u_id == '' || u_id == null) {
				alert('ID를 입력하세요');
				focus.u_id;
				return false;
			}
			
		  var u_email = $("#u_email").val();
		  if (u_email == '' || u_email == null) {	
				alert('이메일을 확인해주세요.');
				focus.u_email;
				return false;
			}

				// var regexp = /[가-힣]/; // 한글만
				// var regexp = /[0-9]/; // 숫자만
				// var regexp = /[a-zA-Z]/; // 영문만
//				regexp = /[a-zA-Z0-9]/; // 숫자,영문,특수문자
				regexp =  /[a-z0-9]{2,}@[a-z0-9-]{2,}.[a-z0-9]{2,}/i;  // 이메일
				for (var i = 0; i < u_email.length; i++) {
					if (u_email.charAt(i) != " " && regexp.test(u_email) == false) {
						alert("메일 형식이 맞지 않습니다.");
						return false;
					}
				}
				
				var u_tel1 = $("#u_tel1").val();
				var u_tel2 = $("#u_tel2").val();
				var u_tel3 = $("#u_tel3").val();
				/* 핸드폰 번호 길이 체크 */
				if (u_tel2.length <= 2) {
					alert("휴대폰번호 가운데번호를 확인해주세요.");
					focus.u_tel2;
					return false;
				} else if (u_tel3.length <= 2 || u_tel3.length != 4) {
					alert("휴대폰번호 마지막번호를 확인해주세요.");
					focus.u_tel3;
					return false;
				}
				/* 핸드폰이 숫자만 들어가는지 체크 */
				else if (isNaN(u_tel2) || isNaN(u_tel3)) {
					alert("휴대폰번호는 숫자만 들어갈 수 있습니다.");
					return false;
				}
				else if (isNaN(u_tel1) ||isNaN(u_tel2) || isNaN(u_tel3)) {
					alert("휴대폰번호는 숫자만 들어갈 수 있습니다.");
					return false;
				}
				
		$.ajax({
	    	  url:'/user/findpass',
	    	  data:{
	    		  u_id : u_id,
	    		  u_email : u_email,
	    		  u_tel : u_tel1 +"-"+u_tel2+"-"+u_tel3
	    		  },
	    	  type:'POST',
	    	  success:function(result){
	    		  if(eval(result) == true){
	    		  alert("가입한 메일로 전송되었습니다.")
	    		  	window.location.href("/main"); 
	    		  }else{
	    			  alert("메일이 전송되지 않았습니다."+ '\r\n'+" 회원정보를 확인하시기 바랍니다..");
	    			  window.location.href("/user/findpass"); 
	    		  }
	    		  
	    	  },
	    	  error: function(xhr,status,error){
//	    		  alert(xhr.status);
//	    		  alert(error);
	    		  alert("관리자에게 문의 바랍니다.");
	    	  }
	      });//ajax	
		
		
	});  
}); 
