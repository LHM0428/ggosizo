$(document).ready(function(){
	$("#ok").on("click",function(){
		var u_id = $("#u_id").val();
		var u_pass = $("#u_pass").val();
		alert("성공")
		$.ajax({
			url : "/user/delete",
			type : "post",
			data : {
				u_id : u_id,
				u_pass : u_pass
			},
			success : function(response) {
				logoutcall();
				alert('삭제되었습니다. 감사합니다.')
//				window.location.replace('/main');
			},
			error : function(request, status, error) {
				alert('관리자에게 문의바랍니다.')
				window.location.replace('/user/delete');
			}
		});
	});
	
	
	
	$("#cancel").on("click",function(){
		$("#u_id").val('');
		$("#u_pass").val('');
	});
	
});