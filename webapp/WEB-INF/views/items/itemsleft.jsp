<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>주소로 장소 표시하기</title>
    
</head>
<body>

<p style="margin-top:-12px">
    <em class="link">
        <a href="javascript:void(0);" onclick="window.open('http://fiy.daum.net/fiy/map/CsGeneral.daum', '_blank', 'width=981, height=650')">
            혹시 주소 결과가 잘못 나오는 경우에는 여기에 제보해주세요.
        </a>
    </em>
</p>
<div id="map" style="width:100%;height:350px;"></div>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9a98e6a57e71d0677b9b9649676f151b&libraries=services"></script>


<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 




/* 현재 위치 표시 */
if(keyword == null){
 //HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
 
 // GeoLocation을 이용해서 접속 위치를 얻어옵니다
 navigator.geolocation.getCurrentPosition(function(position) {
     
     var lat = position.coords.latitude, // 위도
         lon = position.coords.longitude; // 경도
     
     var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
         message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
     
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
//키워드로 장소를 검색합니다
 searchPlaces();

//키워드 검색을 요청하는 함수입니다
var keyword = null;
function searchPlaces() {
  keyword = document.getElementById('keyword').value;
alert('zz' + keyword);
  if (!keyword.replace(/^\s+|\s+$/g, '')) {
      alert('키워드를 입력해주세요!');
      return false;
  }

//   alert(keyword);
keywordSearch( keyword);
   // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
  //ps.keywordSearch( keyword, placesSearchCB);  
} 



//주소-좌표 변환 객체를 생성합니다
function keywordSearch(keyword){

var geocoder = new daum.maps.services.Geocoder();
alert(keyword);
//"'" + keyword + "'"
// 주소로 좌표를 검색합니다
geocoder.addr2coord(keyword, function(status, result) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 지도 중심좌표를 접속위치로 변경합니다
        map.setCenter(coords);     
        
        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="padding:5px;">검색위치</div>'
        });
        infowindow.open(map, marker);
    } 
});    
 
 
}
 
 

 

</script>

<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <p>
                <form  onsubmit="searchPlaces(); return false;">
                키워드 : <input type="text" id="keyword" size="15" autofocus="autofocus"> 
                <button type="submit">검색하기</button> 
                </form>
            </p>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
</body>
</html>