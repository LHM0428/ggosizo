var no = 0 ;
var login= '';
var agent='';
var course='';
function inIt(festivalNo, loginId){
	no=festivalNo;
	login = loginId;
	agent = navigator.userAgent.toLowerCase();
}

	var getPage = function(pageInfo){
			$.getJSON(pageInfo, function(data){
				printData(data.list, $("#repliesDiv"), $('#template'));
				printPaging(data.pageMaker, $("#replyPagination"));
			});
		}
		
		var printPaging = function(pageMaker, target){
			var str="";
			if(pageMaker.prev){
				str += "<li><a class='w3-hover-theme' href='"+(pageMaker.startPage-1)+"'> << </a></li>";
			}
			for(var i=pageMaker.startPage, len=pageMaker.endPage; i<=len; i++){
				str+= "<li><a class='w3-hover-theme' href='"+i+"'>"+i+"</a></li>";
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
		
		var printData = function (replyArr, target, templateObject){
			var template = Handlebars.compile(templateObject.html());
			var html = template(replyArr);
			$("#replyLi").remove();
			target.html(html);
		};
		
		function addReply(course){
			var replytextObj = $("#newReplyText");
			var reply_writer = $("#newReplyWriter").val();
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
						$("small[name=replycntSmall]").text(result);
						replytextObj.val("");
					}
				}
			})
		}
		
		function openModifyWindow(reply_no, id){
			var replytext = $("#reply_content"+reply_no).text();
			$("#modal-title"+reply_no).html(reply_no+". "+id);
			$("#modReplytext"+reply_no).text(replytext);
			alert(login+id)
			if(id==login || id=='ggosizouser1')
				$("#modifyWindow"+reply_no).show("slow");
		}//수정창 오픈
		
		function openInputReply(){
			$("#inputReply").show("slow");
		}//댓글 입력창 열기
		
		function closeInputReply(){
			$("#inputReply").hide("slow");
		}//댓글 입력창 닫기
		
		function replyModify(reply_no, course){
			var reply_content = $("#modReplytext"+reply_no).val();
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
					if(result=='SUCCESS'){
						if (agent.indexOf("chrome") != -1) {
								alert('수정되었습니다. Chrome')
								$("#modifyWindow"+reply_no).hide("slow");
								getPage("/"+course+"Replies/"+no+"/1");
							}else{
								$("#modifyWindow"+reply_no).hide("slow");
								alert('수정되었습니다. IE');
								getPage("/"+course+"Replies/"+no+"/1");
							}
					}
				}
			})
		}//replyModBtn
		
		function replyClose(reply_no){
			$("#modifyWindow"+reply_no).hide("slow");
		}//closeBtn

		function replyDelete(reply_no, course){
			$.ajax({
				method: 'delete',
				url:'/'+course+'Replies/'+reply_no,
				headers :{
					"Content-Type" : "application/json",
					"X-HTTP-Method-Overrid" : "DELETE"
				},
				dataType : "text",
				success : function(result){
					if (agent.indexOf("msie") != -1) {
						$("#modifyWindow"+reply_no).hide("slow");
						$("small[name=replycntSmall]").text(result);
					}else{
						$("small[name=replycntSmall]").text(result);
						$("#modifyWindow"+reply_no).hide("slow");
						getPage("/"+course+"Replies/"+no+"/1");
					}
				}
				
			})
		};//replyDelBtn
		
	      function checkLike(){
	    		$.ajax({
	    			method:"post",
	    			url:'/like/checkLike',
	    			headers :{
	    				"Content-Type" : "application/json",
	    				"X-HTTP-Method-Overrid" : "POST"
	    			},
	    			dataType: "text",
	    			data : JSON.stringify({no:no, u_id:login, course:course}),
	    			success:function(result){
	    				if(result=='true'){
	    					$("#likeBtn").attr("class","w3-btn w3-theme  w3-round-large")
	    					$("small[name=likecntSmall]").attr("class","like");
	    					return result;
	    				}else{
	    					$("#likeBtn").attr("class","w3-btn w3-dark-grey w3-round-large");
	    					$("small[name=likecntSmall]").attr("class","unlike");
	    					return result;
	    				}
	    			}
	    		})
	    	}
	    			
	    	function likeUpdate(){
	    		var check = $("small[name=likecntSmall]").attr("class");
	    		 if(check=='unlike'){
	    			$.ajax({
	    					method:"post",
	    					url:'/like/addLike',
	    					headers :{
	    					"Content-Type" : "application/json",
	    					"X-HTTP-Method-Overrid" : "POST"
	    					},
	    					dataType: "text",
	    					data : JSON.stringify({no:no, u_id:login, course:course}),
	    					success:function(result){
	    						if(result!=null){
	    							$("small[name=likecntSmall]").text(result);
	    							checkLike(no, course, login);
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
	    					data : JSON.stringify({no:no, u_id:login, course:course}),
	    					success:function(result){
	    						if(result!=null){
	    							$("small[name=likecntSmall]").text(result);
	    							checkLike(no, course, login);
	    							}
	    						}
	    					})
	    		 }
	    	}