<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>
<style>

.thumbnailImg{
    background: url("/assets/images/img_contents_card_bg.png") no-repeat;
    width: 228px;
    height: 228px;
    margin-top: 20px;
    float: left;
    /* z-index: auto; */
    position:static;left:0px;top:0px;
} 
.mainImgCard {
    background: url("/assets/images/img_contents_card_bg.png") no-repeat;
    width: 245px; /* 230px */
    height: 305px;
    padding-right: 20px;
    margin-top: 20px;
    float: left;
    /* position:absolute;
    position:relative;left:0px;top:0px; */
}

.mainImgCard .thumbnailImg { /* 아이템 이미지 */
    width: 228px;
    height: 228px;
    padding-left: 1px;
    border-top-left-radius: 8px;
    border-top-right-radius: 8px;
    z-index: -1;
    margin-top: 1px;
}
.mainImgCard .itemTitle { /* 아이템 타이틀 */
    width: 210px;
    height: 38px;
    margin: 9px 10px -3px 10px;
    display: block;
    font-size: 12px;
    color: #666;
    overflow: hidden!important;
    text-overflow: ellipsis;
    white-space: nowrap;
    font-weight: bold;
}
.mainImgCard .itemPrice { /* 아이템 가격 */
    float: left;
    margin: 2px 10px 0 10px;
    overflow: hidden;
    font-size: 18px;
    font-weight: bold;
    color: #FA5858; /* #00aeff */
}
.mainImgCard .itemTimeago { /* 시간설정 */
    float: right;
    padding-right: 10px;
    color: #959595;
    font-size: 12px;
    padding-top: 5px;
}

.imgArea {
    float: left;
    width: 750px;
    margin-left: 10px;
    display: inline-block;
    padding-bottom: 20px;
}


li {
    display: list-item;
    text-align: -webkit-match-parent;
}
ul {
    list-style: none;
}


html, body, div, span, applet, object, iframe, select, input, textarea, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, textarea, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    vertical-align: baseline;
    font-weight: normal;
    color: #333;
    font-family: '돋움',Dotum,Arial;
}
</style>

<style>
/* 사이드바 래퍼 스타일 */
#page-wrapper {
	padding-left: 250px;
}
 
#sidebar-wrapper {
	position: fixed;
	width: 40%;
	height: 100%;
	margin-left: -250px;
	overflow-x: hidden;
	overflow-y: auto;
}
/* 사이드바 래퍼 스타일 close */

aside{
width:40%;
float:left;
margin: 0 auto;
text-align: center;

}
section {
margin-top:60px;
margin-bottom:10px;
width:60%;

float:right;
}

.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:100px;} /* 키워드 검색용 블럭 */
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="/assets/css/main.css" type="text/css">
<head>
	<meta charset="utf-8">
	<title>MyMarket 지도</title>
</head>


	<c:set var="status" value="${fn:length(list)}">
	</c:set>
	<c:forEach var="vo" items="${list }" varStatus="status" begin="0">
	
	<input type="hidden" id="vo" value="${fn:length(list)}">
	<input type="hidden" id="no${status.index+1 }" value="${vo.no}">
	<input type="hidden" id="location${status.index+1 }" value="${vo.location}">
	<input type="hidden" id="address${status.index+1 }" value="${vo.address}">
			<%-- ${vo.no}
			${vo.location}
			${vo.address} --%>
	
	</c:forEach>
<section>


<div class="map_wrap">
    <div id="map" style="width:100%;height:820px;position:relative;overflow:hidden;"></div><!-- 지도가 뒤에 깔리게 들어감. -->

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

	<div id="map" style="height:780px;"></div><!-- 위쪽에 올리면 키워드 검색이 아래로 내려감 -->
	
	
<script type="text/javascript" src="/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9a98e6a57e71d0677b9b9649676f151b&libraries=services"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9a98e6a57e71d0677b9b9649676f151b"></script>
	
	<script>
	
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new daum.maps.LatLng(37.56420, 126.98101), // 지도의 중심좌표
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
 
 
 getList(); // 마커 위치로 가기 대문에 지도 중심좌표를 접속위치로 변경을 나중에 해줘야함.
 
 
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
 
//list 뽑아주기
function getList(){
var markers = [];
	
	//alert("getList");
	var vo = document.getElementById("vo").value;
 	for(i=1; i<=vo; i++){
		//alert("aa");
		var no = document.getElementById("no"+i).value;
		console.log(no);
		var location = document.getElementById("location"+i).value;
		var title = document.getElementById("title"+i).value;
		// 마커 하나를 지도위에 표시합니다 
		console.log(location);
		latlng = location.split(','); // 37.49228309542601, 127.02738748779916를 짤라줌 
		var lat = latlng[0];
		var lng = latlng[1];
		console.log(lat + lng);
		
		// 마커 하나를 지도위에 표시합니다 
		addMarker(new daum.maps.LatLng(lat, lng));
		
		//인포윈도우
		var iwContent = '<div style="padding:5px;">'+title+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new daum.maps.LatLng(lat, lng), //인포윈도우 표시 위치입니다
	    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
	
	/*  var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
        message = '<div style="padding:5px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
    
    	// 마커와 인포윈도우를 표시합니다
    	displayMarker(locPosition, message); */
	    
		// 인포윈도우를 생성하고 지도에 표시합니다
		var infowindow = new daum.maps.InfoWindow({
		    map: map, // 인포윈도우가 표시될 지도
		    position : iwPosition, 
		    content : iwContent,
		    removable : iwRemoveable
		});
		//인포윈도우 close
		
		function addMarker(position) {
		    //alert("add");
		    // 마커를 생성합니다
		    var marker = new daum.maps.Marker({
		    	position: position
		    });

		    // 마커가 지도 위에 표시되도록 설정합니다
		    marker.setMap(map);
		    
		    // 생성된 마커를 배열에 추가합니다
		    markers.push(marker);
		}

		// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
		function setMarkers(map) {
		    for (var i = 0; i < markers.length; i++) {
		        markers[i].setMap(map);
		    }            
		}
		
	} 
		// 지도에 표시된 마커 객체를 가지고 있을 배열입니다


//addMarker(new daum.maps.LatLng(latlng)); 37.49228309542601, 127.02738748779916
}
		// 마커를 생성하고 지도위에 표시하는 함수입니다
//list 뽑아주기 close


		
		
		
		
		
		
		
		
/* <c:set var="status" value="${fn:length(list)}">
		</c:set>
		<c:forEach var="vo" items="${list }" varStatus="status">
			<tr>
				<td>${vo.no}</td>
				<td>${vo.location}</td>
				<td>${vo.address}</td>
			</tr> 
	</c:forEach> */

</script>









</section>

<aside>

<!-- 사이드바 넣을 블럭을 잡아주고 닫아줌 -->
<div id="page-wrapper">
	<!-- 사이드바 -->
	<div id="sidebar-wrapper">

	
<br>
<br>
<br>
<h1>상품 목록</h1>
<div class="imgArea">
<ul class="mainImgList" id="items">
	
	
	
<c:set var="status" value="${fn:length(list)}"></c:set>
	<c:forEach var="vo" items="${list }" varStatus="status" begin="0">
	
	
	<li class="mainImgCard">
<a href="/item/9410319">


	<input type="hidden" id="no${status.index+1 }" value="${vo.no}">
	<input type="hidden" id="location${status.index+1 }" value="${vo.location}">
	<input type="hidden" id="title${status.index+1 }" value="${vo.title}">
	<input type="hidden" id="address${status.index+1 }" value="${vo.address}">

	<img class="thumbnailImg">
 
 <c:set var="status" value="${fn:length(picList)}"></c:set>
	<c:forEach var="vopic" items="${picList }" varStatus="status" begin="0">
<c:set var="no" value="${vo.no}"></c:set>
			<c:choose>
				<c:when test="${vopic.itemNo eq no}">
						<c:if test="${not empty vopic.url }">
							<%-- <img src="${vopic.url }" style="width:100px"> --%>
						<!-- <img class="thumbnailImg" src="//img.hellomarket.com/images6/2015/item/s3/09/17/19/3713_9410319_1.jpg"> -->
						<img class="thumbnailImg" src="${vopic.url }">
						</c:if>
						
				</c:when>
				
				<%-- <c:otherwise>
						<img class="thumbnailImg">
				</c:otherwise> --%>
				
			</c:choose>
	</c:forEach>
 
 
 

 	
		<span class="itemTitle">${vo.title}</span>
			<span class="itemPrice">${vo.price}원</span>
			<span class="itemTimeago">${vo.regDate}</span>
		
		 	

</a>
	
		</li>
	</c:forEach>
	
	
<%-- 	
		<a href="/item/9410319">
			<img class="thumbnailImg" src="//img.hellomarket.com/images6/2015/item/s3/09/17/19/3713_9410319_1.jpg">
				<p></p>
			<span class="itemTitle">${vo.title}</span>
			<span class="itemPrice">${vo.price}원</span>
			<span class="itemTimeago">${vo.regDate}</span>
		</a>
--%>
		
		
		

</ul>
</div>
<%-- 	<c:set var="status" value="${fn:length(list)}">
	</c:set>
	<c:forEach var="vo" items="${list }" varStatus="status" begin="0">
	
	<input type="text" id="no${status.index+1 }" value="${vo.no}">
	<input type="hidden" id="location${status.index+1 }" value="${vo.location}">
	<input type="text" id="title${status.index+1 }" value="${vo.title}">
	<input type="hidden" id="address${status.index+1 }" value="${vo.address}"><br/><br/><br/>
	
			<c:set var="status" value="${fn:length(picList)}">
			</c:set>
			<c:forEach var="vopic" items="${picList }" varStatus="status" begin="0">
			
	<c:set var="no" value="${vo.no}"></c:set>
	<c:if test="${vopic.itemNo eq no}">
				<c:if test="${not empty vopic.url }">
					<img src="${vopic.url }" style="width:100px">
				</c:if><br/>
	</c:if>
			
			</c:forEach>
	
	</c:forEach> --%>
	
	
	
	
<%-- 	
			<c:set var="status" value="${fn:length(picList)}">
			</c:set>
			<c:forEach var="vo" items="${picList }" varStatus="status" begin="0">
			
			<input type="text" id="location${status.index+1 }" value="${vo.itemNo}">
				<c:if test="${not empty vo.url }">
					<img src="${vo.url }" style="width:100px">
				</c:if>
			
			</c:forEach>
 --%>



<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<h3></h3> 
<br/>
<h3></h3>
<br/>
<h3></h3>
<br/>
<br/>
<br/>
<br/>
<br/>


	</div>
	<!-- /사이드바 -->
 
	<!-- 본문 -->
<!-- 	<div id="page-content-wrapper">
		<div class="container-fluid">
		</div>
	</div> -->
	<!-- /본문 -->
</div>



</aside>

<body>

<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
	


<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>