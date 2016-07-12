/*function insert_data(){
	var form_data = $("form[name=insert_form]").serialize();
	
	$.ajax({
		url:'userJoinForm.do',
		data:{
			action : "userJoin",
			user_data : decodeURIComponent(form_data),
		},
		type:'post',
		success:function(resultData,status,xhr){
			alert("success");
			alert(resultData);
		},
		error:function(xhr,status,error){
			alert("error");
			alert(error);
		}
	});
	
}*/
$(document).ready(function() {
	var id_vail_check = 0;
	
	$.ajax({
	  	  url:'/mypage/selecSido',
	     	  method:'POST',
	     	  success:function(result){
	     		  $('#sp1').html(result);
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

	$('#idCheck').click(function() {
		var u_id = $('input[name=u_id]').val();
		var regexp = /[a-zA-Z0-9]/; // 숫자,영문,특수문자
		var regexpNum = /[0-9+]/;
		var regexpEn = /^[a-zA-Z+]/; // 영문만

		if (u_id == '' || u_id == null) {
			alert('ID를 입력하세요');
			focus.u_id;
			return false;
		}
		if (u_id.length < 6 || u_id.length > 12) {
			alert('ID를 길이를 확인하세요');
			focus.u_id;
			return false;
		}

		for (var i = 0; i < u_id.length; i++) {

			if (u_id.charAt(i) != " " && regexp.test(u_id.charAt(i)) == false) {
				alert("한글이나 특수문자는 입력불가능 합니다.");
				return false;
			}

		}
		if (!regexpEn.test(u_id)) {
			alert("첫글자에는 영문을 포함해야합니다.");
			return false;
		}
		if (!regexpNum.test(u_id)) {
			alert("숫자를 포함해야합니다.");
			return false;
		}

		$.ajax({
			url : "/user/user_id_check",
			type : "post",
			data : {
				u_id : u_id
			},
			cache : false,
			async : false,
			dataType : "text",
			success : function(response) {
				if (eval(response) == true) {
					id_vail_check = 1;
					var c = confirm("아이디가 중복이 되지 않습니다. 사용하시겠습니까?");
					if (c == true) {
						$('input[name=u_id]').attr("readonly", true);
						alert("아이디 재설정은 중복확인을 다시 눌러주세요.");
					} else {
						$('input[name=u_id]').attr("readonly", false);
						$('input[name=u_id]').val('');
						focus.u_id;
					}

				} else {
					$('input[name=u_id]').val('');
					alert("아이디가 중복이 됩니다. 다시 입력 해주세요");
					focus.u_id;
					return false;
				}
			},
			error : function(request, status, error) {
				if (request.status != '0') {
					// alert("code : " + request.status + "\r\nmessage : "
					// + request.reponseText + "\r\nerror : " + error);
					alert("관리자에게 문의하시기바랍니다.")
				}
			}
		});
	});

	$('#formCheck').click(function() {
		var u_id = $('input[name=u_id]').val();
		var u_pass1 = $('input[name=u_pass1]').val();
		var u_pass2 = $('input[name=u_pass2]').val();
		var u_name = $('input[name=u_name]').val();
		var u_gender = $('input[name=u_gender]:checked').val();
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
		/* 핸드폰 번호 길이 체크 */

		if (u_id == '' || u_id == null) {
			alert('ID를 입력하세요');
			focus.u_id;
			return false;
		} else if (u_id.length < 6 || u_id.length > 12) {
			alert('ID를 길이를 확인하세요');
			focus.u_id;
			return false;
		}

		else if (u_pass1 == '' || u_pass1 == null) {
			alert('비밀번호를 입력하세요');
			focus.u_pass1;
			return false;
		} else if (u_pass1.length < 6 || u_pass1.length > 12) {
			alert('비밀번호 길이를 확인하세요');
			focus.u_pass1;
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

		// 이름 체크
		else if (u_name == '' || u_name == null || u_name.length < 2) {
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
		var dt = new Date();

		if (isNaN(u_year) || isNaN(u_month) || isNaN(u_day)) {
			alert("생년월일에는 숫자만 들어갈 수 있습니다.");
			return false;
		} else if (u_year == '' || u_year == null || u_year >= dt.getFullYear() ||u_year.length != 4) {
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

		/*
		 * if (u_like_gu_location == '' || u_like_gu_location == null) {
		 * alert("선호지역을 확인해주세요"); focus.u_like_gu_location; return false; } if
		 * (u_like_price == '' || u_like_price == null) { alert("선호가격을 확인해주세요");
		 * focus.u_like_price; return false; } if (u_like_food == '' ||
		 * u_like_food == null) { alert("선호음식을 확인해주세요"); focus.u_like_food;
		 * return false; } if (u_like_active == '' || u_like_active == null) {
		 * alert("활동성을 확인해주세요"); focus.u_like_active; return false; }
		 */
		else if (id_vail_check == 0) {
			alert("중복확인을 눌러주세요");
			return false;
		}

		else {
			$.ajax({
				url : "/user/insert",
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
					alert("가입되었습니다.");
				},
				error : function(request, status, error) {
					if (request.status != '0') {
//						 alert("code : " + request.status + "\r\nmessage : "
//						 + request.reponseText + "\r\nerror : " + error);
						alert("관리자에게 문의하시기바랍니다.")
						window.location.replace('/user/insert');
					}
				}
			});
		}
	});
	
});