var marker;//마커 객체
var markers = [];
var markerLine; // 마커가 생성된 좌표로 그려질 선 객체입니다
var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
 
	function showMarker(lastPosition){
		map.panTo(lastPosition); 
	    map.setLevel(6);
	}
// 마커를 생성하고 지도위에 표시하는 함수입니다
	function addMarker(position, idx, title) {
		/*
		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new daum.maps.Size(24, 35); 
	    var imgOptions =  {
	            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        };
	    // 마커 이미지를 생성합니다   
	    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,imgOptions); 
	    */
	    if(idx==-1){
	    	marker = getStartMarker(position);
	    }else{
		    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new daum.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new daum.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new daum.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions);
		    // 마커를 생성합니다
		   		marker = new daum.maps.Marker({
		   		map:map, // 마커가 지도 위에 표시되도록 설정합니다
		        position: position,
		        image : markerImage //마커 이미지
		    });
	    }
	    //마커에 인포 윈도우를 추가합니다
	    setMarkerInfoWindow(marker, title);
	    // 생성된 마커를 배열에 추가합니다
	    markers.push(marker);
	    if(markers.length==3)distanceBetweenMarker(3);
	    return marker;
	}//addMarker
	
	   //===========마커간의 거리 계산=============================
    function distanceBetweenMarker(last){
	    if(last==markers.length){
	    	deleteMarkerLine();
	    	deleteDistance()
	    	var distance=0; //선의 거리 총합
			
		    for(var i=0; i<markers.length-1; i++){
			    // 마커의 위치입니다 
			    var markerPosition = markers[i].getPosition();
		    	
			    // 마커 위치를 기준으로 선을 생성하고 지도위에 표시합니다
			    markerLine = new daum.maps.Polyline({
			        map: map, // 선을 표시할 지도입니다 
			        path: [markerPosition], // 선을 구성하는 좌표 배열입니다 마커 위치를 넣어줍니다
			        strokeWeight: 0, // 선의 두께입니다 
			        strokeColor: '#75B8FA', // 선의 색깔입니다
			        strokeOpacity: 0, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
			        strokeStyle: 'solid' // 선의 스타일입니다
			    });
			    
			    // 그려지고 있는 선의 좌표 배열을 얻어옵니다
		        var path = markerLine.getPath();
		        // 좌표 배열에 클릭한 위치를 추가합니다
		        path.push(markers[i+1].getPosition());
		        // 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
		        markerLine.setPath(path);
		        distance += Math.round(markerLine.getLength());// 선의 총 거리를 계산합니다
		    }
	   	    // 마우스 커서의 현재 위치를 얻어옵니다 
	       var lastPosition = markers[markers.length-1].getPosition(); 
	       var content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
	    
		    // 거리정보를 지도에 표시합니다
		    showDistance(content, lastPosition);
		    showMarker(lastPosition);
	    }
	}
    //=================거리 및 시간 ===========================
    function getTimeHTML(distance) {

        // 도보의 시속은 평균 3km/h 이고 도보의 분속은 50m/min입니다
        var walkkTime = distance / 50 | 0;
        var walkHour = '', walkMin = '';

        // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
        if (walkkTime > 60) {
            walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
        }
        walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

        // 자동차의 평균 시속은 40km/h 이고 이것을 기준으로 자동차의 분속은 667m/min입니다
        var carTime = distance / 667 | 0;
        var carHour = '', carMin = '';

        // 계산한 자동차 시간이 60분 보다 크면 시간으로 표출합니다
        if (carTime > 60) {
            carHour = '<span class="number">' + Math.floor(carTime / 60) + '</span>시간 '
        }
        carMin = '<span class="number">' + carTime % 60 + '</span>분'

        // 거리와 도보 시간, 자동차 시간을 가지고 HTML Content를 만들어 리턴합니다
        var content = '<ul class="dotOverlay distanceInfo">';
        content += '   총 거리<span class="number">' + distance + '</span>m';
        /* 도보시간, 자동차시간은 나중에 넣을지 말지 결정
        content += '    <li>';
        content += '        <span class="label">도보</span>' + walkHour + walkMin;
        content += '    </li>';
        content += '    <li>';
        content += '        <span class="label">자동차</span>' + carHour + carMin;
        content += '    </li>';
        */
        content += '</ul>'

        return content;
    }
    //======================================================================
    	
    //=============거리 계산 함수==========================
	 // 마커로 이어진 선의 총거리 정보를 표시하거
	 // 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
	 function showDistance(content, position) {
	     if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면
	         
	         // 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
	         distanceOverlay.setPosition(position);
	         distanceOverlay.setContent(content);
	         
	     } else { // 커스텀 오버레이가 생성되지 않은 상태이면
	         
	         // 커스텀 오버레이를 생성하고 지도에 표시합니다
	         distanceOverlay = new daum.maps.CustomOverlay({
	             map: map, // 커스텀오버레이를 표시할 지도입니다
	             content: content,  // 커스텀오버레이에 표시할 내용입니다
	             position: position, // 커스텀오버레이를 표시할 위치입니다.
	             xAnchor: 0,
	             yAnchor: 0,
	             zIndex: 3  
	         });      
	     }
	     
	 }
    
    //============거리 삭제 함수===============
	 // 그려지고 있는 선의 총거리 정보와 
	 // 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
	 function deleteDistance () {
	     if (distanceOverlay) {
	         distanceOverlay.setMap(null);
	         distanceOverlay = null;
	     }
	 }
	 
	// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
	 function deleteMarkerLine() {
	     if (markerLine) {
	         markerLine.setMap(null);    
	         markerLine = null;        
	     }
	 }
	 //===================================================
		
	//===============마커 인포 윈도우====================
	function setMarkerInfoWindow(marker, title){
	 	// 마커에 커서가 오버됐을 때 마커 위에 표시할 인포윈도우를 생성합니다
	    var iwContent = '<div style="padding:5px;">'+title+'</div>'; // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	
	    // 인포윈도우를 생성합니다
	    var infowindow = new daum.maps.InfoWindow({
	        content : iwContent
	    });
	
	    // 마커에 마우스오버 이벤트를 등록합니다
	    daum.maps.event.addListener(marker, 'mouseover', function() {
	      // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
	        infowindow.open(map, marker);
	    });
	
	    // 마커에 마우스아웃 이벤트를 등록합니다
	    daum.maps.event.addListener(marker, 'mouseout', function() {
	        // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
	        infowindow.close();
	    });
	} 	
    	
	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMarkers(map) {
	    for (var i = 0; i < markers.length; i++) {
		// 지도 위의 마커를 제거하는 코드입니다
		// marker.setMap(null);    
	        markers[i].setMap(map);
	    }            
	}
	
	//=================좌표 얻어오기====================
	function getInfo() {
    // 지도의 현재 중심좌표를 얻어옵니다 
    var center = map.getCenter(); 
    
    var message = '지도 중심좌표는 위도 ' + center.getLat() + ', <br>';
    message += '경도 ' + center.getLng() + ' 이고 <br>';
    var infoDiv = document.getElementById('infoDiv');
    infoDiv.innerHTML = message;
    
    var title = 'Hello, Marker'
    addMarker(new daum.maps.LatLng(center.getLat(), center.getLng()), idx, title);
    idx += 1;
	}
	//============================================================

	//====================출발, 도착 마커============================
	function getStartMarker(position){
		var startSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/red_b.png', // 출발 마커이미지의 주소입니다    
	    startSize = new daum.maps.Size(50, 45), // 출발 마커이미지의 크기입니다 
	    startOption = { 
	        offset: new daum.maps.Point(15, 43) // 출발 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
	    };
		// 출발 마커 이미지를 생성합니다
		var startImage = new daum.maps.MarkerImage(startSrc, startSize, startOption);
	
		// 출발 마커를 생성합니다
		var startMarker = new daum.maps.Marker({
		    map: map, // 출발 마커가 지도 위에 표시되도록 설정합니다
		    position: position,	    // 출발 마커가 표시될 위치입니다
		    image: startImage // 출발 마커이미지를 설정합니다 네~~설정핫빈다
		});	
		return startMarker;
	}//getStartMarker
	
	function getArriveMarker(){
		var arriveSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/blue_b.png', // 도착 마커이미지 주소입니다    
		arriveSize = new daum.maps.Size(50, 45), // 도착 마커이미지의 크기입니다 
		arriveOption = { 
		    offset: new daum.maps.Point(15, 43) // 도착 마커이미지에서 마커의 좌표에 일치시킬 좌표를 설정합니다 (기본값은 이미지의 가운데 아래입니다)
		};
	
		// 도착 마커 이미지를 생성합니다
		var arriveImage = new daum.maps.MarkerImage(arriveSrc, arriveSize, arriveOption);
		
		// 도착 마커가 표시될 위치입니다 
		var arrivePosition = new daum.maps.LatLng(33.450701, 126.572667);    
		 
		// 도착 마커를 생성합니다 
		var arriveMarker = new daum.maps.Marker({  
		    map: map, // 도착 마커가 지도 위에 표시되도록 설정합니다
		    position: arrivePosition,
		    image: arriveImage // 도착 마커이미지를 설정합니다
		});
		return arriveMarker;
	}//getArriveMarker
	//==========================================================	
	
	
	
	
	
	
	
	
	
	
	
	
	