	var category;
	var category2;
	var category3;
	 $(document).ready(function(){
		 
		$('input[name=category]').click(function(){
			$('input[value="'+category+'"]').removeAttr("disabled");
			$('#h1').removeAttr("value");
	 		category = $('input[name=category]:checked').val();
		 	if(category=='기타'){
		 		$('#etc1').attr("type","text");
		 	}else{
		 		$('#etc1').attr("type","hidden");
		 		$('input[value="'+category+'"]').attr("disabled","disabled");
		 		$('#h1').attr({"value":category,"name":"category"});
		 	}
		});
		$('input[name=category2]').click(function(){
			$('input[value="'+category2+'"]').removeAttr("disabled");
			$('#h2').removeAttr("value");
	 		category2 = $('input[name=category2]:checked').val();
		 	if(category2=='기타'){
		 		$('#etc2').attr("type","text");
		 	}else{
		 		$('#etc2').attr("type","hidden");
		 		$('input[value="'+category2+'"]').attr("disabled","disabled");
		 		$('#h2').attr({"value":category2,"name":"category2"});
		 	}
		});
		$('input[name=category3]').click(function(){
			$('input[value="'+category3+'"]').removeAttr("disabled");
			$('#h3').removeAttr("value");
	 		category3 = $('input[name=category3]:checked').val();
		 	if(category3=='기타'){
		 		$('#etc3').attr("type","text");
		 	}else{
		 		$('#etc3').attr("type","hidden");
		 		$('input[value="'+category3+'"]').attr("disabled","disabled");
		 		$('#h3').attr({"value":category3,"name":"category3"});
		 	}
		});
		
//		항목 보이기 숨기기(+,-)
		$("#iComing").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#coming").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#coming").hide();
			}
		})
		$("#iTel").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#tel").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#tel").hide();
			}
		})
		$("#iUrl").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#url").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#url").hide();
			}
		})
		$("#iOpenhour").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#openhour").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#openhour").hide();
			}
		})
		$("#iCloseday").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#closeday").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#closeday").hide();
			}
		})
		$("#iStartdate").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#startdate").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#startdate").hide();
			}
		})
		$("#iEnddate").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#enddate").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#enddate").hide();
			}
		})
		$("#iPrice").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#price").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#price").hide();
			}
		})
		$("#iComing2").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#coming2").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#coming2").hide();
			}
		})
		$("#iTel2").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#tel2").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#tel2").hide();
			}
		})
		$("#iUrl2").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#url2").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#url2").hide();
			}
		})
		$("#iOpenhour2").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#openhour2").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#openhour2").hide();
			}
		})
		$("#iCloseday2").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#closeday2").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#closeday2").hide();
			}
		})
		$("#iStartdate2").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#startdate2").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#startdate2").hide();
			}
		})
		$("#iEnddate2").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#enddate2").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#enddate2").hide();
			}
		})
		$("#iPrice2").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#price2").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#price2").hide();
			}
		})
		$("#iComing3").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#coming3").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#coming3").hide();
			}
		})
		$("#iTel3").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#tel3").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#tel3").hide();
			}
		})
		$("#iUrl3").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#url3").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#url3").hide();
			}
		})
		$("#iOpenhour3").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#openhour3").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#openhour3").hide();
			}
		})
		$("#iCloseday3").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#closeday3").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#closeday3").hide();
			}
		})
		$("#iStartdate3").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#startdate3").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#startdate3").hide();
			}
		})
		$("#iEnddate3").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#enddate3").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#enddate3").hide();
			}
		})
		$("#iPrice3").click(function(){
			var iClass = $(this).attr('class');
			if(iClass=='fa fa-plus' || iClass=='' ){
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-minus");
				$("#price3").show();
			}else{
				$(this).removeAttr("class");
				$(this).attr("class","fa fa-plus");
				$("#price3").hide();
			}
		})
		
		
	});
	 
	 