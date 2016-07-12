var marker;//마커 객체
var ps = new daum.maps.services.Places(); 
 
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces(search) {
	
	    var keyword = search;
	
	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }
 
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}

	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(status, data, pagination) {
	    if (status === daum.maps.services.Status.OK) {

	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data.places);


	    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

	        return;

	    } else if (status === daum.maps.services.Status.ERROR) {

	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;

	    }
	}
	
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {
	    var listEl = document.getElementById('accordion'), 
//	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new daum.maps.LatLngBounds(), 
	    listStr = '';
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);

	    for ( var i=0; i<places.length; i++ ) {

	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
	        	title = places[i].title,
	            itemEl = getListItem(i, places[i], marker); // 검색 결과 항목 Element를 생성합니다
	        	//addImgMap(placePosition, i, title)
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
	        
	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        
	        fragment.appendChild(itemEl);
	    }

	    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
//	    menuEl.scrollTop = 0;

	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	}
	
	
	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
		  
	    var el = document.createElement('div');
	    itemStr =  '<button onclick="myAccFunc(\'Demo'+(index+1)+'\')" class="w3-theme w3-padding-16 w3-hover-dark-grey w3-btn-block w3-left-align">'
	    	+ places.title + '</button>'
	    	+'<div id="Demo'+(index+1)+'" class="w3-accordion-content w3-row w3-border">'
	    	+'<div class="w3-third" style="width:307px; height: 192px" id="staticMap'+(index)+'"></div>';

	    if (places.newAddress) {
	        itemStr += 	'<div class="w3-container" style="padding-left:10px"><br><br>'+
	        			'도로명 주소 : <span class="addrRoad">' + places.newAddress + '</span><br>' +
	                    '지번 주소 : <span name="addrJibun'+index+'">' +  places.address  + '</span><br>';
	    } else {
	        itemStr += '<div class="w3-container"><span class="addrJibun">지번 주소 : ' +  places.address  + '</span>'; 
	    }
	                 
	      itemStr += '전화번호 : <span class="phone">' + places.phone  +'</span></div></div>';           
	      
	    el.innerHTML = itemStr;
	    
	    return el;
	}
	
	
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}

