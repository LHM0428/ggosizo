$(document).ready(
		function() {
			$('input#user_insert').click(function() {
				window.open("/user/insert", '추가하기', 'width=800, height=600');
			});
			$('input#user_update').click(
					function() {
						var u_id = $('input#u_id').val();
						if (u_id == null || u_id == '') {
							alert('유저아이디 입력하세요')
							return false;
						}
						var child_window = window.open("/user/update?u_id=" + u_id, '수정하기',
								'width=800, height=600');
					});
			$('input#user_delete').click(function() {
				var u_id = $('input#u_id').val();
				if (u_id == null || u_id == '') {
					alert('유저아이디 입력하세요')
					return false;
				}
				if (confirm($('input#u_id').val() + " 님을 삭제하시겠습니까?")) {
					$.ajax({
						url : '/manage/user_delete',
						data : {
							u_id : u_id
						},
						type : 'post',
						success : function(resultData, status, xhr) {
							alert(u_id + '님이 삭제되었습니다.');
						}
					});
				} else {
					alert("취소되었습니다.")
				}
			});

			$('input#user_list').click(function() {
				$.ajax({
					url : '/manage/user_list',
					type : 'get',
					success : function(resultData, status, xhr) {
						$('body').html(resultData);
					}
				});
			});


		});
