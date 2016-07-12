function selectAddr(selectSido, selectGugun){
	$.ajax({
  	  url:'/mypage/selecSido',
     	  method:'POST',
     	  data:{
     		  selectSido : selectSido
     	  },
     	  success:function(result){
     		  $('#sp1').html(result);
   		      var sido = $('select[name=u_addr1]').val();
	    	 $.ajax({
	    		  url:'/mypage/selecGugun',
	    		  method: "POST",
	        	  data:{
	        		    sido:sido,
	        		    selectGugun : selectGugun
	        	  },
	        	  success:function(result){
	        		  $('#sp2').html(result);
	        	  }
	    	  });
     	  }
    });
    
    $('#sp1').change(function(){
	      var sido = $('select[name=u_addr1]').val();
	      $.ajax({
	    	  url:'/mypage/selecGugun',
	    	  method: "POST",
	       	  data:{
	       		    sido:sido
	       	  },
	       	  success:function(result){
	       		  $('#sp2').html(result);
	       	  } 
	      });
    });//sido change
}

$(document).ready(function() {
	var dt = new Date();
      
	$('#formEditCheck').click(function() {
		var u_id = $('input[name=u_id]').val();
		var u_pass1 = $('input[name=u_pass1]').val();
		var u_pass2 = $('input[name=u_pass2]').val();
		var u_name = $('input[name=u_name]').val();
		var u_gender = $('input[name=u_gender]').val();
		var u_year = $('input[name=u_year]').val();
		var u_month = $('input[name=u_month]').val();
		var u_day = $('input[name=u_day]').val();
		var u_email1 = $('input[name=u_email1]').val();
		var u_email2 = $('select[name=u_email2]').val();
		var u_tel1 = $('input[name=u_tel1]').val();
		var u_tel2 = $('input[name=u_tel2]').val();
		var u_tel3 = $('input[name=u_tel3]').val();
		var u_addr1 = $('select[name=u_addr1]').val();
		var u_addr2 = $('select[name=u_addr2]').val();
		
		if (u_pass1 == '' || u_pass1 == null) {
			alert('비밀번호를 입력하세요');
			focus.u_pass1;
			return false;
		} else if (u_pass1.length < 6 || u_pass1.length > 12) {
			alert('비밀번호 길이를 확인하세요');
			focus.u_id;
			return false;
		}

		else if (u_pass2 == '' || u_pass2 == null) {
			alert('비밀번호확인란을 입력하세요');
			focus.u_pass2;
			return false;
		}

		/* 비밀번호와 비밀번호확인란 같은지 확인 */
		else if (u_pass1 != u_pass2) {
			alert("비밀번호와 비밀번호 확인란이 다릅니다.");
			focus.u_pass2;
			return false;
		} 
		else if (isNaN(u_year) || isNaN(u_month) || isNaN(u_day)) {
			alert("생년월일에는 숫자만 들어갈 수 있습니다.");
			return false;
		} else if (u_year == '' || u_year == null || u_year >= dt.getFullYear()) {
			alert('생년월일 년도를 확인해주세요.');
			focus.u_year;
			return false;
		} else if (u_month == '' || u_month == null || u_month > 12 || u_month < 1) {
			alert('생년월일 월을 확인해주세요.');
			focus.u_month;
			return false;
		} else if (u_day == '' || u_day == null || u_day < 1 || u_day > 31) {
			alert('생년월일 일을 확인해주세요.');
			focus.u_day;
			return false;
		} else if (u_email1 == '' || u_email1 == null) {
			alert('이메일을 확인해주세요.');
			focus.u_email1;
			return false;
		}

			// var regexp = /[가-힣]/; // 한글만
			// var regexp = /[0-9]/; // 숫자만
			// var regexp = /[a-zA-Z]/; // 영문만
			regexp = /[a-zA-Z0-9]/; // 숫자,영문,특수문자
			for (var i = 0; i < u_email1.length; i++) {
				if (u_email1.charAt(i) != " " && regexp.test(u_email1.charAt(i)) == false) {
					alert("이메일은 한글이 입력불가능 합니다.");
					return false;
				}
			}	
		
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
		else if (isNaN(u_tel1) ||isNaN(u_tel2) || isNaN(u_tel3)) {
			alert("휴대폰번호는 숫자만 들어갈 수 있습니다.");
			return false;
		}

		else {
			$.ajax({
				url : "/user/update",
				type : "post",
				data :JSON.stringify({ 
					 u_id : u_id, 
					 u_pass : u_pass1,
					 u_name : u_name,
					 u_gender : u_gender,
					 u_birth: u_year +'-'+ u_month +'-' +u_day,
					 u_email : u_email1 +'@'+ u_email2,
					 u_tel : u_tel1+'-'+u_tel2+'-'+u_tel3,
					 u_addr : u_addr1 +' '+ u_addr2
			}),
				dataType : "text",
				headers :{
		               "Content-Type" : "application/json",
		               "X-HTTP-Method-Overrid" : "post"
		            },
				success : function(response) {
					window.location.replace('/main');
					alert("수정되었습니다.");
				},
				error : function(request, status, error) {
					if (request.status != '0') {
//						 alert("code : " + request.status + "\r\nmessage : "
//						 + request.reponseText + "\r\nerror : " + error);
						alert("관리자에게 문의하시기바랍니다.")
//						window.location.replace('http://localhost:8282/user/update');
					}
				}
			});
		}
	});
});