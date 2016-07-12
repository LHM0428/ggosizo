$(document).ready(function(){
	$.ajax({
		url : "/manage/manage_adv",
		type : "get",
		success : function(response) {
			$('div#manage_adv').html(response);
		},
		error : function(request, status, error) {
			if (request.status != '0') {
//				 alert("code : " + request.status + "\r\nmessage : "
//				 + request.reponseText + "\r\nerror : " + error);
			}
		}
	});
});


function pageup(){
	document.body.scrollTop = 0;
}


var alert_top = 0;
var alert_margin_top = 0;

$(function() {
  alert_top = $("#move").offset().top;
  alert_margin_top = parseInt($("#move").css("margin-top"),"20px");

  $(window).scroll(function () {
    var scroll_top = $(window).scrollTop();
    if (scroll_top > alert_top) {
      $("#move").css("margin-top", ((scroll_top-alert_top)+(alert_margin_top*2)) + "px");
    } else {
      $("#move").css("margin-top", alert_margin_top+"px");
    };
  });
});