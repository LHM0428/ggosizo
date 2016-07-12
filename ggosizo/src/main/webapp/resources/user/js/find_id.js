$(document).ready(function(){
	$("#cancel").on("click",function(){
		 $("#name").val('');
		 $("#email").val('');
	});
	  $('#check').click(function(){
		  var u_name = $("#name").val();
		  
		  if (u_name == '' || u_name == null || u_name.length < 2) {
				alert('이름을 입력하세요');
				focus.u_name;
				return false;
			}
			var regexp = /[가-힣]/; // 한글만
			// var regexp = /[0-9]/; // 숫자만
			// var regexp = /[a-zA-Z]/; // 영문만
			for (var i = 0; i < u_name.length; i++) {
				if (u_name.charAt(i) != " " && regexp.test(u_name.charAt(i)) == false) {
					alert("이름은 영어나 특수문자는 입력불가능 합니다.");
					return false;
				}
			}
			
		  var u_email = $("#email").val();
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
		$.ajax({
	    	  url:'/user/findid',
	    	  data:{
	    		  u_name : u_name,
	    		  u_email : u_email,
	    		  },
	    	  type:'POST',
	    	  success:function(result){
	    		  /* location.href="userJoinForm.do"; */
	    		  $('#input').html(result);
	    		  
	    	  },
	    	  error: function(xhr,status,error){
//	    		  alert(xhr.status);
//	    		  alert(error);
	    		  alert("관리자에게 문의 바랍니다.");
	    	  }
	      });//ajax	
	});  
}); 
