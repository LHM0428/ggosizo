var course
var login
// DateCourse에서 코스 열람, 수정, 삭제, 댓글 등록, 수정, 삭제
// 댓글 수정창 열기, 닫기
// 페이징처리 함수
// Tabs
var agent = '';
function inIt(course1,loginId){
	course=course1;
	login = loginId;
	agent = navigator.userAgent.toLowerCase();
}
function getPage(pageInfo,no){
	$.ajax({
		url:pageInfo,
		method:"GET",
		success:function(data){
			printData(data.list, $("#repliesDiv"+no), $('#template'),no);
			printPaging(data.pageMaker, $("#replyPagination"+no), no);
		}
	})
	/*$.getJSON(pageInfo, function(data){
		printData(data.list, $("#repliesDiv"+no), $('#template'),no);
		printPaging(data.pageMaker, $("#replyPagination"+no), no);
	});*/
}

var printPaging = function(pageMaker, target,no){
	var str="";
	if(pageMaker.prev){
		str += "<li><a class='w3-hover-theme' href='"+(pageMaker.startPage-1)+"'> << </a></li>";
	}
	for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len; i++){
		str+= "<li><a class='w3-hover-theme' href='"+i+"' name='"+no+"'>"+i+"</a></li>";
	}
	if(pageMaker.next){
		str += "<li><a class='w3-hover-theme' href='"+(pageMaker.endPage+1)+"'> >> </a></li>";
	}
	target.html(str);
}

Handlebars.registerHelper("prettifyDate", function(timeValue){
	var dateObj = new Date(timeValue);
	var year = dateObj.getFullYear();
	var month = dateObj.getMonth()+1;
	var date = dateObj.getDate();
	var hour = dateObj.getHours();
	var min = dateObj.getMinutes();
	return year+"/"+month+"/"+date+" - "+hour+":"+min;
});

var printData = function (replyArr, target, templateObject,no){
	var template = Handlebars.compile(templateObject.html());
	var html = template(replyArr);
	$("#replyLi"+no).remove();
	target.html(html);
};
function inIt(inItCourse,loginId){
	course = inItCourse;
	login=loginId;
}

	function searchKeyword(keyword){
		location.href= "/"+course+"/searchList?keyword="+keyword;
	}
	
		function openCity(evt, cityName) {
		  var i;
		  var x = document.getElementsByClassName("city");
		  for (i = 0; i < x.length; i++) {
		     x[i].style.display = "none";
		  }
		  var activebtn = document.getElementsByClassName("testbtn");
		  for (i = 0; i < x.length; i++) {
		      activebtn[i].className = activebtn[i].className.replace(" w3-dark-grey", "");
		  }
		  document.getElementById(cityName).style.display = "block";
		  evt.currentTarget.className += " w3-dark-grey";
		}
		
		//modify
		function modifyCourse(no){
			var formObj = $("#form"+no);
				formObj.attr("action", "modify");
				formObj.attr("method", "get");		
				formObj.submit();
		}
		
		//delete
		function deleteCourse(id){
			self.location="delete?no="+id
		}
		
		var no = 0;
		// Accordions
		function myAccFunc(id, course, u_id) {
			no = id;
		    var x = document.getElementById(id);
		    if (x.className.indexOf("w3-show") == -1) {
		        x.className += " w3-show";
		        x.previousElementSibling.className += " w3-dark-grey";
		        getPage('/'+course+'Replies/'+no+'/1',no);
			    $.ajax({
			    	method:"get",
			    	url:"/"+course+"/"+no,
			    	success:function(result){
			    		$("small[name=viewcntSmall"+no+"]").text(result);
			    	}
			    })
		    } else { 
		        x.className = x.className.replace(" w3-show", "");
		        x.previousElementSibling.className = 
		        x.previousElementSibling.className.replace(" w3-dark-grey", "");
		    }
		    checkLike(no, course, u_id);
		}
		
		var replyPage = 1;
		

		
		function addReply(no, course){
			var replytextObj = $("#newReplyText"+no);
			var reply_writer = $("#newReplyWriter"+no).val();
			var reply_content = replytextObj.val();
			
			$.ajax({
				method:"post",
				url:'/'+course+'Replies/',
				headers :{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Overrid" : "POST"
				},
				dataType: "text",
				data : JSON.stringify({no:no, reply_writer:reply_writer,
						reply_content:reply_content}),
				success:function(result){
					if(result!=null){
						alert('등록 되었습니다');
						$("small[name=replycntSmall"+no+"]").text(result);
						getPage('/'+course+'Replies/'+no+'/1',no);
						replyPage = 1;
						replytextObj.val("");
					}
				}
			})
		}
		
		function openModifyWindow(reply_no, id){
			var replytext = $("#reply_content"+reply_no).text();
			$("#modal-title"+reply_no).html(reply_no+". "+id);
			$("#modReplytext"+reply_no).val(replytext);
			if(id==login || id=='ggosizouser1'){
				$("#modifyWindow"+reply_no).show("slow");
			}
		}//수정창 오픈
		
		function openInputReply(no){
			$("#inputReply"+no).show("slow");
		}//댓글 입력창 열기
		
		function closeInputReply(no){
			$("#inputReply"+no).hide("slow");
		}//댓글 입력창 닫기
		
		function replyModify(reply_no, course){
			var reply_content = $("#modReplytext"+reply_no).val();
			var no = $("#cno"+reply_no).val()
			$.ajax({
				method: 'put',
				url:'/'+course+'Replies/'+reply_no,
				headers :{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Overrid" : "PUT"
				},
				dataType : "text",
				data: JSON.stringify({reply_content:reply_content}),
				success : function(result){
						alert("수정 되었습니다.");
						$("#modifyWindow"+reply_no).hide("slow");
						getPage('/'+course+'Replies/'+no+'/1',no);
				}
			})
		}//replyModBtn
		
		function replyClose(reply_no){
			$("#modifyWindow"+reply_no).hide("slow");
		}//closeBtn

		function replyDelete(reply_no, course){
			var no = $("#cno"+reply_no).val()
			$.ajax({
				method: 'delete',
				url:'/'+course+'Replies/'+reply_no,
				headers :{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Overrid" : "DELETE"
				},
				dataType : "text",
				success : function(result){
						alert("삭제 되었습니다.");
						$("#modifyWindow"+reply_no).hide();
						getPage('/'+course+'Replies/'+no+'/1',no);
						$("small[name=replycntSmall"+no+"]").text(result);
				}
				
			})
		};//replyDelBtn
		
function checkLike(no, course, u_id){
	$.ajax({
		method:"post",
		url:'/like/checkLike',
		headers :{
			"Content-Type" : "application/json",
			"X-HTTP-Method-Overrid" : "POST"
		},
		dataType: "text",
		data : JSON.stringify({no:no, u_id:u_id, course:course}),
		success:function(result){
			if(result=='true'){
				$("#likeBtn"+no).attr("class","w3-btn w3-theme-d1 w3-round-large")
				$("small[name=likecntSmall"+no+"]").attr("class","like");
				return result;
			}else{
				$("#likeBtn"+no).attr("class","w3-btn w3-theme-l2 w3-round-large");
				$("small[name=likecntSmall"+no+"]").attr("class","unlike");
				return result;
			}
		}
	})
}
		
function likeUpdate(no, course, u_id){
	var check = $("small[name=likecntSmall"+no+"]").attr("class");
	 if(check=='unlike'){
		$.ajax({
				method:"post",
				url:'/like/addLike',
				headers :{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Overrid" : "POST"
				},
				dataType: "text",
				data : JSON.stringify({no:no, u_id:u_id, course:course}),
				success:function(result){
					if(result!=null){
						$("small[name=likecntSmall"+no+"]").text(result);
						checkLike(no, course, u_id);
						}
					}
				})
	 }else{
		 $.ajax({
				method:"post",
				url:'/like/deleteLike',
				headers :{
				"Content-Type" : "application/json",
				"X-HTTP-Method-Overrid" : "POST"
				},
				dataType: "text",
				data : JSON.stringify({no:no, u_id:u_id, course:course}),
				success:function(result){
					if(result!=null){
						$("small[name=likecntSmall"+no+"]").text(result);
						checkLike(no, course, u_id);
						}
					}
				})
	 }
		
}		
		
		
		
		
		
		
		
		
		
		