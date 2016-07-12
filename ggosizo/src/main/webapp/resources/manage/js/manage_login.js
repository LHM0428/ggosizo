function openCity(evt, tabName) {
	var i, tabcontent, tablinks;
	tabcontent = document.getElementsByClassName("tabcontent");
	for (i = 0; i < tabcontent.length; i++) {
		tabcontent[i].style.display = "none";
	}
	tablinks = document.getElementsByClassName("tablinks");
	for (i = 0; i < tabcontent.length; i++) {
		tablinks[i].className = tablinks[i].className.replace(" active", "");
	}
	document.getElementById(tabName).style.display = "block";
	evt.currentTarget.className += " active";
}

$(document).ready(function() {

	$("#ok_btn").on("click", function() {

		var m_id = $("#m_id").val();
		var m_pass = $("#m_pass").val();

		$.ajax({
			url : '/manage',
			type : 'post',
			data : {
				m_id : m_id,
				m_pass : m_pass
			},
			success : function(resultData, status, xhr) {
				$('body').html(resultData);
			},
			error : function(request, status, error) {
				// alert("code : " + request.status + "\r\nmessage : "
				// + request.reponseText + "\r\nerror : " + error);
				alert("개발자에게 문의 바랍니다.")
			}
		});
	});
});
