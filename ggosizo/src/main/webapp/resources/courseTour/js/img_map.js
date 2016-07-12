var ps = new daum.maps.services.Places(); 
var i=0;
function searchImgMap(search,idx) {
	
    var keyword = search;
    i=idx;
    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch(keyword, imgMapSearchCB); 
}
 
function imgMapSearchCB(status, data, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
    	var places = data.places;

  	        // 마커를 생성하고 지도에 표시합니다
  	        var placePosition = new daum.maps.LatLng(places[0].latitude, places[0].longitude);
  	        	addImgMap(placePosition);


    } else if (status === daum.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}
// 마커를 생성하고 이미지 지도위에 표시하는 함수입니다
	function addImgMap(position) {
		
		    var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new daum.maps.Size(36, 37),  // 마커 이미지의 크기
	        
	        // 마커 이미지를 생성합니다   
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize);
		    
		    // 마커를 생성합니다
		   		marker = new daum.maps.Marker({
		        position: new daum.maps.LatLng(position.getLat(), position.getLng()),
		        image : markerImage //마커 이미지
		    });
	    
	    var staticMapContainer  = document.getElementById('staticMap'+i), // 이미지 지도를 표시할 div  
	    staticMapOption = { 
	        center: new daum.maps.LatLng(position.getLat(), position.getLng()), // 이미지 지도의 중심좌표
	        level: 6, // 이미지 지도의 확대 레벨
	        marker: marker // 이미지 지도에 표시할 마커 
	    };
		// 이미지 지도를 생성합니다
		var staticMap = new daum.maps.StaticMap(staticMapContainer, staticMapOption);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	