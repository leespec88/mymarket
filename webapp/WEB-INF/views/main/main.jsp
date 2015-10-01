<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<html>

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
	<input type="hidden" id="title${status.index+1 }" value="${vo.title}">

	</c:forEach>
<section>


<div class="map_wrap">
    <div id="map" style="width:100%;height:820px;position:relative;overflow:hidden;"></div><!-- 지도가 뒤에 깔리게 들어감. -->

    <div id="menu_wrap" class="bg_white">
        <div class="option">
                <form onsubmit="searchPlaces(); return false;">
                키워드 : <input type="text" id="keyword" size="15"> 
                <button type="submit">검색하기</button> 
                </form>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>

	<div id="map" style="height:780px;"></div><!-- 위쪽에 올리면 키워드 검색이 아래로 내려감 -->
	
	
<script type="text/javascript" src="/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9a98e6a57e71d0677b9b9649676f151b&libraries=services"></script>
<script type="text/javascript" src="/assets/js/main.js"></script>
<!-- <script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9a98e6a57e71d0677b9b9649676f151b"></script> -->
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
	<input type="text" class="mapBounds">
<ul class="mainImgList" id="items">
	
<c:set var="status" value="${fn:length(list)}"></c:set>
	<c:forEach var="vo" items="${list}" varStatus="status" begin="0">
	<%-- <a href="javascript:setPosition('${vo.location}');"> --%>
	<li class="mainImgCard">
	
	<input type="hidden" id="vo" value="${fn:length(list)}">
	<input type="hidden" id="no${status.index+1 }" value="${vo.no}">
	<input type="hidden" id="location${status.index+1 }" value="${vo.location}">
	<input type="hidden" id="title${status.index+1 }" value="${vo.title}">
 <!-- 이미지한장에 없으면 null 리스트 -->
<%-- 		<c:choose>
				<c:when test="${vo.itemNo eq vo.no}">
						<c:choose>
							<c:when test="${not empty vo.url }">
								<img class="thumbnailImg" src="${vo.url }">
							</c:when>
						</c:choose>
						
				</c:when>
				
			 	<c:otherwise>
						<img class="thumbnailImg">
				</c:otherwise>
				 
		</c:choose> --%>
<!-- 이미지한장에 없으면 null 리스트 close -->
		    <span class="itemTitle"><a href="/items/detailView/${vo.no}" >${vo.title}</a><a class="pull-right" href="javascript:setPosition('${vo.location}');"><img id="itemPoint" src="/assets/images/map-marker.png" ></a></span>
			<span class="itemPrice">${vo.price}원</span>
			<span class="itemTimeago">${vo.regDate}</span>
			<span class="tag">		
</span>	
</li>	
	</c:forEach>

</ul>
</div>

	</div>
	<!-- /사이드바 -->
 
</div>



</aside>

<body>

<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>