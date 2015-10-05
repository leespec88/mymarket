/* 마커 이미지 */
	var imageSrc = '/assets/images/map-marker.png', // 마커이미지의 주소입니다    
	imageSize = new daum.maps.Size(0, 0), // 마커이미지의 크기입니다
	imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	  
	//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
	/* 마커 이미지 close */

var keyword = null;
var curLat=null;
var curLon=null;
if(keyword == null){
 //HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
 
 // GeoLocation을 이용해서 접속 위치를 얻어옵니다
 navigator.geolocation.getCurrentPosition(function(position) {
     
     var lat = position.coords.latitude, // 위도
         lon = position.coords.longitude; // 경도
     curLat=lat;
     curLon=lon;
     var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
         message = '<div style="padding:5px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
     
     // 마커와 인포윈도우를 표시합니다
     displayMarker(locPosition, message);
         
   });
 
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
 
 var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
     message = 'geolocation을 사용할수 없어요..'
     
 displayMarker(locPosition, message);
}

//지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

 // 마커를 생성합니다
 var marker = new daum.maps.Marker({  
     map: map, 
     position: locPosition
 }); 
 
 var iwContent = message, // 인포윈도우에 표시할 내용
     iwRemoveable = true;

 // 인포윈도우를 생성합니다
 var infowindow = new daum.maps.InfoWindow({
     content : iwContent,
     removable : iwRemoveable
 });
 
 // 인포윈도우를 마커위에 표시합니다 
 infowindow.open(map, marker);
 
 getList(); // 마커 위치로 가기 대문에 지도 중심좌표를 접속위치로 변경을 나중에 해줘야함.
 
  // 지도 중심좌표를 접속위치로 변경합니다
 map.setCenter(locPosition);  
} 

}else{
	alert("null이 아니래!!!");
}
/* 현재 위치 표시 close */


var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(curLat, curLon), // 지도의 중심좌표
		        level: 7, // 지도의 확대 레벨
		        mapTypeId : daum.maps.MapTypeId.ROADMAP // 지도종류
		    }; 

		// 지도를 생성한다 
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		// 지도 타입 변경 컨트롤을 생성한다
		var mapTypeControl = new daum.maps.MapTypeControl();

		// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
		map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	

		// 지도에 확대 축소 컨트롤을 생성한다
		var zoomControl = new daum.maps.ZoomControl();

		// 지도의 우측에 확대 축소 컨트롤을 추가한다
		map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

		// 지도 중심 좌표 변화 이벤트를 등록한다
/*		daum.maps.event.addListener(map, 'center_changed', function () {
			//console.log('지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.');
		});*/

		// 지도 확대 레벨 변화 이벤트를 등록한다
		daum.maps.event.addListener(map, 'zoom_changed', function () {
			console.log('지도의 현재 확대레벨은 ' + map.getLevel() +'레벨 입니다.');
		});
		


/* 장소검색 */
//장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 키워드로 장소를 검색합니다
searchPlaces();


function searchPlaces() {

    keyword = document.getElementById('keyword').value;

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

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === daum.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    bounds = new daum.maps.LatLngBounds();
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다

    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new daum.maps.LatLng(places[i].latitude, places[i].longitude),
            itemEl = getListItem(0, places[0]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

    }

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = places.title;

    return el;
}

/* 장소검색 close*/
 
//list 뽑아주기
function getList(){
	
	//리스트 크기
	var vo = document.getElementById("vo").value;
 	for(i=1; i<=vo; i++){
		//alert("aa");
		var no = document.getElementById("no"+i).value;
		console.log(no);
		var location = document.getElementById("location"+i).value;
		var title = document.getElementById("title"+i).value;

		console.log(location);
		latlng = location.split(','); // 37.49228309542601, 127.02738748779916를 짤라줌 
		var lat = latlng[0];
		var lng = latlng[1];
		
		console.log("!!!"+lat+":"+lng);
		var position=new daum.maps.LatLng(lat, lng);
		var iwContent = '<div class="IWEvent" style="padding:5px; text-align:center; width:150px; background-color:#ff5a5f; color:#fff; font-size:14px; font-weight:bold;">'+title+'</div>';
		
		var marker = new daum.maps.Marker({
	    	position: position,
	    	image:markerImage
	    });

	    marker.setMap(map);
	    
		var infowindow = new daum.maps.InfoWindow({
		    map: map, // 인포윈도우가 표시될 지도
		    content : iwContent,
		});
		
		infowindow.open(map, marker);
		
	} 
		// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
 	

//addMarker(new daum.maps.LatLng(latlng)); 37.49228309542601, 127.02738748779916
}
		// 마커를 생성하고 지도위에 표시하는 함수입니다
//list 뽑아주기 close

function setPosition(location){
	
	var loc = location.split(",");
	var lat = loc[0];
	var lng = loc[1];
	map.setCenter(new daum.maps.LatLng(lat, lng));
	map.setLevel(3);
	
	
	
	daum.maps.event.addListener(marker, 'click', function() {
	    alert('marker click!');
	});
}

function goInfo(){
	location.href="/";
}

