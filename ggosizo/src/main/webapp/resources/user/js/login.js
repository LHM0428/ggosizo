$(document).ready(function() {
	
	
	$('.ok_btn').click(function(){
		$('#login_form').submit();
	});
	
	$('#login_form').submit(function(){
		alert('로그인중입니다.');
//		self.location.reload(true);
	});
});