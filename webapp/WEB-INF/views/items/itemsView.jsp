<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
		<link href="/assets/css/font/font.css" rel="stylesheet" type="text/css"/>
	
<style>
#itemview {
	padding-top: 100px;
}

.reply {
	padding-top: 20px;
}

textarea {
	resize: none;
}

#itemviewTitle {
	padding-left: 37px;
}
img[Attributes Style] {
    width: 480px;
    height: 480px;
}

</style>

<title>Insert title here</title>
</head>
<body>

	<div class="container" id="itemview">
		<div class="row">
			<div class="col-sm-5 largeImg" id="locationView">
				<img class="img-thumbnail" id="" src="${fileList[0].IMAGE}" alt="상품이미지가 없습니다." width="500" height="400">
			</div>
			<div class="col-sm-1" id="smallimage">
				<c:forEach var="file" items="${fileList}">
					<div class=row>
						<img style="-webkit-user-select: none" class="img-thumbnail" id="${file.IMAGE}" src="${file.IMAGE}" alt="Chania" width="52" height="40" onmouseover="javascript:setImage('${file.IMAGE}');">
					</div>
				</c:forEach>
			</div>
			<div class="col-sm-6">
				<div class="well" id="itemviewTitle">
					<div class="row">
						<c:if test="${itemVo.itemCondition == '중고' }">
							<span style="font-size:128%" class="label label-primary">중고</span>
						</c:if>
						<c:if test="${itemVo.itemCondition == '신품' }">
							<span style="font-size:128%" class="label label-success">신품</span>
						</c:if>
						<c:if test="${itemVo.shippingFee == '포함' }">
							<span style="font-size:128%" class="label label-info">택배비 포함</span>
						</c:if>
						
						<h2><c:if test="${not empty authUser }"><a href="/jjim/insert/${itemVo.no}/${authUser.no}"><span class="glyphicon glyphicon-heart" style="margin-left:5px; margin-right:5px"></span></a></c:if>${itemVo.title }</h2>
						<h1>
							<span id="price"></span>
						</h1>
						<h3>
							<a href="javascript:locationView(${itemVo.location})"><span class="glyphicon glyphicon-map-marker"></span></a>
							<span>${itemVo.address}</span>
						</h3>
					</div>
				</div>
				<div class="well">
					<div class="row">
						<div class="col-sm-4">
							<c:if test="${userVo.imageURL == null}">
							<a href=""><img width="94" height="94"
								src="/assets/css/images/img_itemdetail_profile_noimage.png"></a>
							</c:if>
							<c:if test="${userVo.imageURL != null}">
							<a href=""><img width="94" height="94"
								src="${userVo.imageURL}"></a>
							</c:if>
						</div>
						<div class="col-sm-8">
							<p>
								<a href="">${userVo.name}</a>
							</p>
							<p>
								<a href="/items/userItemList/${userVo.no}">등록 아이템 :
									${regItemCnt}</a>
							</p>
							<p>
								<a href="#"><span class="glyphicon glyphicon-phone-alt"></span>
									${userVo.phone}</a>
							</p>
							<c:if test="${not empty authUser }">
							<p>
								<%-- <a class="btn btn-danger" href="http://192.168.1.16:52273?${authUser.name }&no=${itemVo.no}">판매자와 채팅</a> --%>
								<a class="btn btn-danger" href="#" onclick="chatRoom();">판매자와 채팅</a>
								<input type="hidden" id="name" value="${authUser.name }">
								<input type="hidden" id="itemNo" value="${itemVo.no }">
								<input type="hidden" id="authNo" value="${authUser.no }">
							</p>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="well">
			<div class="row">
				<div class="col-sm-6">
					<h5>
						<strong>상세설명</strong>
					</h5>
	                    <textarea readonly="readonly" class="form-control" rows="15" id="comment">${itemVo.content}</textarea>
					<script>
						function testOne(reply) {
							$("#" + reply).toggle();
						}
					</script>
					<c:if test="${replyList[0] != null}">
						<label class="reply" for="comment">댓글</label>
						<c:forEach var="reply" items="${replyList}">
							<div class="tb-reply" id="addedFormDiv">
								<table class="">
									<tr>
										<c:if test="${reply.depth != 0}">
											<td style="padding-left:${reply.depth*30}px"><input
												type="hidden" name="articleNo" value="">
											<td><img src="/assets/css/images/gc_img.gif"></td>
										</c:if>
										<td><a class="userName" href=>${reply.userName}</a></td>
										<td><div class="replyregdate">${reply.regDate}</div></td>
										<td><a href="javascript:testOne(${reply.no})"
											class="subreply" data-toggle="tooltip" data-placement=""
											title="답장하기"> <span class="glyphicon glyphicon-share-alt"></span></a>
										</td>
										<td><c:if
												test="${not empty authUser && reply.userNo == authUser.no }">
												<a href="/items/deletereply/${reply.no}?itemNo=${reply.boardNo}" title="삭제하기"> 
													<span class="glyphicon glyphicon-trash"></span>
												</a>
											</c:if></td>
									</tr>
								</table>
								<div id="junki" style="padding-left:${reply.depth*30}px">
									<pre class="commentTextDesc">${reply.content}</pre>
								</div>

								<div class="rereply" id="${reply.no}" style="display: none">
									<form class="answerArea" action="/items/subreply/" method="post">
										<input type="hidden" name="replyNo" value="${reply.no}">
										<input type="hidden" name="parentGroupNo"
											value="${reply.groupNo}">
										<textarea class="commentTextDesc" placeholder="댓글을 입력해주세요."
											class="commnetTextArea" name="replyContent"
											id="commnetTextArea" maxlength="500"></textarea>
										<input class="commentBtn" id="commentBtn" type="image"
											src="/assets/images/btn_input_comment_normal.png"
											alt="Submit Form" />
									</form>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<form role="form" action="/items/addreply/${itemVo.no}"
						method="post">
						<div class="form-group reply">
							<label for="comment">댓글입력</label>
							<textarea name="content" class="form-control" id="usr" rows="5"></textarea>
						</div>
						<button type="submit" class="btn btn-default">입력</button>
					</form>
				</div>
				<div class="col-sm-6">
					<c:if test="${authUser.no != userVo.no }">
						<p>
							<img src="/assets/images/img_side_clean_market_titletext.png">
						</p>
						<div class="well">
							<h5>
								<strong>사람들의 눈살을 찌푸리게 하는,거래금지 아이템은 자제해주세요!</strong>
							</h5>
							<span>- 담배, 전자담배</span> <br> <span>- 술</span> <br> <span>-
								렌즈 (콘택트, 써클)</span> <br> <span>- 의약품</span> <br> <span>-
								성인용품 (콘돔 제외)</span> <br> <span>- 일부 수제식품</span> <br> <span>-
								불법 도박 관련 글 (토토 등)</span> <br> <span>- 불법시술 (타투 등)</span> <br>
							<span>- 주민등록증/운전면허증</span> <br> <span>- 불법 소프트웨어 복제품</span>
							<br>
						</div>
						<div class="well">
							<h5>
								<strong>에티켓을 지키면 꼭 돌아오는 법! 비매너 행위는 자제해주세요~</strong>
							</h5>
							<span>- 도배성 행위</span> <br> <span>- 욕설/비하적 행위</span> <br>
							<span>- 선정적인 사진/내용</span> <br> <span>- 스토킹 등 다른 회원을
								괴롭히는 행위</span> <br> <span>- 커뮤니티에 홍보글/아이템 등록</span> <br> <span>-
								성의 없이 무의미한 아이템 등록</span> <br> <span>- 그 외 운영측 판단에 거래를 방해하는
								행위</span> <br>
						</div>
					</c:if>
					<c:if test="${authUser.no == userVo.no }">
						<p>
							<img src="/assets/images/img_side_item_management_title.png"
								alt="아이템 판매 관리 텍스트" width="162" height="33"
								class="itemManagerTit">
						</p>
						<p>
							<img src="/assets/images/img_item_details_title_description.png"
								alt="아이템 판매 관리 텍스트" width="59" height="15" class="itemStatTit">
						</p>
						<div class="well">
							<form action="/items/updateSellState/${itemVo.no}" method="post">
								<label class="radio-inline"> <input type="radio"
									name="sellState" value="판매중">판매중
								</label> <label class="radio-inline"> <input type="radio"
									name="sellState" value="예약중">예약중
								</label> <label class="radio-inline"> <input type="radio"
									name="sellState" value="판매완료">판매완료
								</label> <input type="hidden" name="itemNo" value="${itemVo.no}">
								<button type="submit" class="btn btn-default">적용</button>
							</form>
						</div>
						<p>
                             <a href="#" onclick="fn_checkEvent('재등록 하시겠습니까?');">
                            <button type="button" class="btn btn-primary">재등록</button></a>  
                            <a href="/items/updateItem/${itemVo.no}"><button type="button" class="btn btn-warning">아이템수정</button></a> 
                            <a href="#" onclick="fn_checkEvent('정말 삭제하시겠습니까??');"> <button type="button" class="btn btn-danger" >아이템삭제</button></a>
							
						</p>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
<script type="text/javascript">
	$(document).ready(
			function() {
				$('input:radio[name=sellState]:input[value='+ "${itemVo.sellState}" + ']').attr("checked", true);
				/* $('#price').val().replace(/,/g, ''); */

				/* var splitCode = $("#splitCode").val().split(","); */
				/* var price = $("#price").val(); */
				var price = ${itemVo.price};
				price = Number(price).toLocaleString('en');
				console.log(price);
				$("#price").after(price + "원");

			});
</script>

<script>
	function fn_checkEvent(obj) {
		if (confirm(obj) == true) { //확인
			if(obj.match('삭제')=='삭제'){
				location.href="/items/itemDelete/" + ${itemVo.no};
			}
			if(obj.match('재등록')=='재등록'){
				location.href="/items/updateRegDate/"+${itemVo.no};
			}
		} else { 
			return;
		}
	}
	function setImage(obj) {
		$(".largeImg .img-thumbnail").attr('src', obj);
		$(".largeImg div").css('display', 'none');
		
	}
	function chatRoom(){
		var name=$('#name').val();
		var itemNo = $('#itemNo').val();
		var authNo = $('#authNo').val();
		window.open("http://192.168.1.16:52273?"+name+"&"+itemNo, "판매자와 대화창", "width=800, height=560s, toolbar=no, menubar=no");
	}

</script>

<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9a98e6a57e71d0677b9b9649676f151b&libraries=services"></script>
<style>
.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
.number {font-weight:bold;color:#ee6152;}
.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
.distanceInfo .label {display:inline-block;width:50px;color:black;}
</style>
<script>
function locationView(viewlat, viewlon){
	console.log(viewlat +","+ viewlon);
	

//현제 위치
var viewPosition = new daum.maps.LatLng(viewlat, viewlon);
var curLat=null;
var curLon=null;
var distanceOverlay;// 선의 거리정보를 표시할 커스텀오버레이 입니다
//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        curLat=lat;
        curLon=lon;
        console.log("now : " + curLat + "," + curLon);
        
        var locPosition = new daum.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
        message = '<div style="padding:5px;">내위치!!!</div>'; // 인포윈도우에 표시될 내용입니다
    	
        console.log("now2: " + locPosition);
        console.log("view: " + viewPosition);
	    // 마커와 인포윈도우를 표시합니다
	    displayMarker(locPosition, message);
        
      //선그리기
        var polyline = new daum.maps.Polyline({
            map: map,
            path: [
                new daum.maps.LatLng(curLat, curLon),
                new daum.maps.LatLng(viewlat, viewlon) 
            ],
            strokeWeight: 3,
            strokeColor: 'red',
            strokeOpacity: 0.8,
            strokeStyle: 'solid'
        });
      
        var distance = Math.round(polyline.getLength()), // 선의 총 거리를 계산합니다
        content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
     
        // 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
	     // HTML Content를 만들어 리턴하는 함수입니다
	     function getTimeHTML(distance) {
	
	         // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
	         var walkkTime = distance / 67 | 0;
	         var walkHour = '', walkMin = '';
	
	         // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
	         if (walkkTime > 60) {
	             walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
	         }
	         walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'
	
	         // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
	         var bycicleTime = distance / 227 | 0;
	         var bycicleHour = '', bycicleMin = '';
	
	         // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
	         if (bycicleTime > 60) {
	             bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
	         }
	         bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'
	
	         // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
	         var content = '<ul class="dotOverlay distanceInfo">';
	         content += '    <li>';
	         content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
	         content += '    </li>';
	         content += '    <li>';
	         content += '        <span class="label">도보</span>' + walkHour + walkMin;
	         content += '    </li>';
	         content += '    <li>';
	         content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
	         content += '    </li>';
	         content += '</ul>'
	
	         return content;
	     }
        
	    // 그려진 선의 거리정보를 지도에 표시합니다
	    showDistance(content, viewPosition);  
	 // 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
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
      
      
      console.log(distance);
      //선그리기 close
        
        

            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new daum.maps.LatLng(33.450701, 126.570667),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
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
    
    map.setCenter(markerPosition);
   
}

//alert(map.getCenter(markerPosition));
	var mapContainer = document.getElementById('locationView'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(curLat, curLon), // 지도의 중심좌표
        level: 2 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다



//상품위치
// 마커가 표시될 위치입니다 
var markerPosition  = new daum.maps.LatLng(viewlat, viewlon); 

// 마커를 생성합니다
var marker = new daum.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);
	
	
console.log(map.getCenter(markerPosition)); //vb: 4655241.070416928, wb: 10.460297404189829	

    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(markerPosition);   
	//alert(location);
	
	
	
	//console.log(curLat + " " + curLon);
	
	

}

</script>

</html>