$(document).ready(function(){
	$('#manage_adv').on("click",function(){
		$.ajax({
			url: '/manage/manage_adv',
			type: 'post',
		});
	});
});