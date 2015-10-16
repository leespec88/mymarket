<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%>  

<!DOCTYPE html>

<html>
<style>
aside{
width:34%;
float:left;
margin: 0 auto;
text-align: center;
color: #A6A6A7;
height: 850px;

}
section {
margin-bottom:10px;
width:65%;
float:right;
}

.itemsNext{
 	display: none;
    background-color: #EB6868;
    color: white;
}
.itemsNext, .itemsNoNext, .toptitle, .itemsBack{
margin-top: 50px;
}

.itemsNext, .itemsBack, .itemsNoNext{
width: 49%;
height: 40px;
font-size: 16px;
}

.subtitle{
margin-top: 110px;
}

@media(max-width:800px){
 .toptitle{
 font-size: 30px;
 }
 .subtitle{
 font-size: 18px;
 }
}

.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:40px;}
#menu_wrap {position:absolute;top:5;left:5;bottom:0;width:250px;padding:5px;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
section {padding-top:52px}
aside   {padding-top:52px}
</style>
<head>
	<meta charset="utf-8">
	<!-- bootstrap -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<link href="/assets/css/font/font.css" rel="stylesheet" type="text/css"/>
	<title>MyMarket 지도</title>
</head>
<body>

<section>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	
<script type="text/javascript" src="/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9a98e6a57e71d0677b9b9649676f151b&libraries=services"></script>

<div class="map_wrap">
    <div id="map" style="width:100%;height:750px;position:relative;overflow:hidden;"></div>
<!-- <div id="map" style="height:750px;"></div> -->
    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <p>
                <form onsubmit="searchPlaces(); return false;">
                키워드 : <input type="text" id="keyword" size="15"> 
                <button type="submit">검색하기</button> 
                </form>
            </p>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
    
</div>


	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.56420, 126.98101), // 지도의 중심좌표
		        level: 4, // 지도의 확대 레벨
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
		daum.maps.event.addListener(map, 'center_changed', function () {
			console.log('지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.');
		});

		// 지도 확대 레벨 변화 이벤트를 등록한다
		daum.maps.event.addListener(map, 'zoom_changed', function () {
			console.log('지도의 현재 확대레벨은 ' + map.getLevel() +'레벨 입니다.');
		});

		// 지도 영역 변화 이벤트를 등록한다
		daum.maps.event.addListener(map, 'bounds_changed', function () {
			var mapBounds = map.getBounds(),
				message = '지도의 남서쪽, 북동쪽 영역좌표는 ' +
							mapBounds.toString() + '입니다.';
			console.log(message);	
		});

		// 지도 시점 변화 완료 이벤트를 등록한다
		daum.maps.event.addListener(map, 'idle', function () {
			var message = '지도의 중심좌표는 ' + map.getCenter().toString() + ' 이고,' + 
							'확대 레벨은 ' + map.getLevel() + ' 레벨 입니다.';
		});

/* 클릭한 곳에 마커 생성하기 */ 		
 		/* 마커 이미지 */
var imageSrc = 'http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
imageSize = new daum.maps.Size(64, 69), // 마커이미지의 크기입니다
imageOption = {offset: new daum.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
  
//마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imageOption);
/* 마커 이미지 close */

 		
		// 지도를 클릭한 위치에 표출할 마커입니다
		var marker = new daum.maps.Marker({ 
    	// 지도 중심좌표에 마커를 생성합니다 
	    position: map.getCenter(),
	    //draggable : true, // 마커를 드래그 가능하도록 설정한다
	    map: map, // 마커를 표시할 지도 객체
	    
	    image: markerImage // 마커이미지 설정 
    
		}); 
		// 지도에 마커를 표시합니다
		marker.setMap(map);

		// 지도 클릭 이벤트를 등록한다 (좌클릭 : click, 우클릭 : rightclick, 더블클릭 : dblclick)
		// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
		daum.maps.event.addListener(map, 'click', function (mouseEvent) {
			console.log('지도에서 클릭한 위치의 좌표는 ' + mouseEvent.latLng.toString() + ' 입니다.');
		    // 클릭한 위도, 경도 정보를 가져옵니다 
		    var latlng = mouseEvent.latLng; 
		    console.log(latlng);
		    // 마커 위치를 클릭한 위치로 옮깁니다
		    marker.setPosition(latlng);
		    
		    
		    var latlng1 = mouseEvent.latLng.toString().substring(1,mouseEvent.latLng.toString().length -1);
		    
		    latlng1 = latlng1.replace(/\s/gi, ''); // 모든 공백을 제거
		   
		    var strArray = latlng1.split(',');
		    console.log(strArray[0] + ',' + strArray[1]);
		    var lat = strArray[0];
		    console.log(lat);
		    
		    var lng = strArray[1];
		    console.log(lng);
		    var no = 0;
		    
//json ajax 통신
			 $.ajax({
				url : "/items/itemsinsert/" + lat + "/" + lng + "/" + no,
				type : "post",
				async : true,
				dataType : "json",
				contentType : 'application/json',
				success : function(data) {
					
					$("#lng").val(data.lng);
					$("#lat").val(data.lat);
					
				},
				error : function(jqXHR, status, e) {
					alert(status + " n:n " + e);
				}
			}); 
//json ajax 통신 close

//json ajax 통신 (좌표->주소 변환)
		$.ajax({
				url : "https://apis.daum.net/local/geo/coord2addr?apikey=9a98e6a57e71d0677b9b9649676f151b&longitude=" + lng + "&latitude=" + lat + "&inputCoordSystem=WGS84&output=json",
				type : "post",
				async : true,
				dataType : "jsonp",
				contentType : 'application/json',
				success : function(data) {
					//alert("aa");
					//console.log(data);
					console.log(data.fullName);
					$("#address").val(data.fullName);
					$(".itemsNoNext").css('display','none');
					$(".itemsNext").css('display','inline');
					$("#address1").html("위치 : " + data.fullName);
					//$("#lat").val(data.lat);
					
				},
				error : function(jqXHR, status, e) {
					alert(status + " t:t " + e);
				}
			}); 

//json ajax 통신 (좌표->주소 변환) close

		});	
/* 클릭한 곳에 마커 생성하기 close */

		// 지도 드래깅 이벤트를 등록한다 (드래그 시작 : dragstart, 드래그 종료 : dragend)
		daum.maps.event.addListener(map, 'drag', function () {
			var message = '지도를 드래그 하고 있습니다. ' + 
							'지도의 중심 좌표는 ' + map.getCenter().toString() +' 입니다.';
			console.log(message);
		});

/* 현재 위치 표시 */
if(keyword == null){
 //HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
 
 // GeoLocation을 이용해서 접속 위치를 얻어옵니다
 navigator.geolocation.getCurrentPosition(function(position) {
     
     var lat = position.coords.latitude, // 위도
         lon = position.coords.longitude; // 경도
     
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
 
  // 지도 중심좌표를 접속위치로 변경합니다
 map.setCenter(locPosition);       
} 

}else{
	alert("null이 아니래!!!");
}
/* 현재 위치 표시 close */

/* 장소검색 */
//장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places();  

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
var keyword = null;
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

</script>



</section>

<aside>
<h1 class="toptitle"><strong>판매위치 지정</strong></h1>
<h3 class="subtitle">판매할 위치를</h3> 
<h3 class="subtitle">지정하고</h3>
<h3 class="subtitle">다음 버튼을 눌러주세요.</h3>
<h3 class="subtitle" id="address1"></h3>

<form action="/items/itemsinsertview" method="post" >
<input type="hidden" id="lat" name="lat" value="">
<input type="hidden" id="lng" name="lng" value="">
<input type="hidden" id="address" name="address" value="">
<a href="/"><input class="itemsBack" type="button" value="취소"></a>
<input class="itemsNoNext" type="button" value="다음">
<input class="itemsNext" type="submit"  value="다음">
</form>

</aside>


</body>
</html>