<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- bootstrap -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
	<style>
		#textlist {padding-top:50px;color:#A6A6A7;}
		.img-thumbnail{width: 100px; height: 100px;}
	</style>
	
<style>
/* 사이드바 래퍼 스타일 */
@media(max-width:767px){
	#sidebar-wrapper{
	/* position: fixed; */
	/* width: 95%; */
	height: 100%;
	margin-left: -33px;
	overflow-x: hidden;
	overflow-y: auto;
	}
}
@media(min-width:768px){
#sidebar-wrapper {
	position: fixed;
	width: 58%;
	height: 80%;
	margin-left: -33px;
	overflow-x: hidden;
	overflow-y: auto;
}
}
/* 사이드바 래퍼 스타일 close */
</style>
 	
 	
	<title></title>
</head>

<body>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>

	<div class="container-fluid">
	    <div class="row">
	    	<!-- 사이드바 넣을 블럭을 잡아주고 닫아줌 -->
	    	

 			    <div class="col-sm-7">
 			    <h1 class="text-center"  id="textlist"><strong>상품리스트</strong></h1>
		    	
	    			    
<div id="page-wrapper">
	<!-- 사이드바 -->
	<div id="sidebar-wrapper">
	
		    	<!-- 아이템 리스트 부분 코딩 -->
		    	<div class="row">
		    		<!-- <div class="col-sm-12 col-md-6">
			    		<div class="well">
			    			<img class="img-thumbnail" src="/images/puppy.jpg" alt="Chania" width="530" height="345">
			    			<p><span>강아지장난감</span><a href="#"><span class="glyphicon glyphicon-map-marker"></span></a></p>
			    			<p><span>가격 : </span><span>10000원</span><span>10월 10일 10시</span></p>
			    			<p><span>tag : </span><span>#원</span></p>
			    		</div>
		    		</div> -->
		    </div>
		    
		</div>
	</div>
</div>	
<!-- /사이드바 -->	 
		 
<div class="col-sm-5" style="padding-top:50px;">
<!-- 맵부분 코딩 -->
		    
   	<c:set var="status" value="${fn:length(list)}"></c:set>
   	
	<c:forEach var="vo" items="${list }" varStatus="status" begin="0">
		<input type="hidden" id="vo" value="${fn:length(list)}">
		<input type="hidden" id="no${status.index+1 }" value="${vo.no}">
		<input type="hidden" id="location${status.index+1 }" value="${vo.location}">
		<input type="hidden" id="title${status.index+1 }" value="${vo.title}">
		<input type="hidden" id="url${status.index+1 }" value="${vo.url}">
		<input type="hidden" id="regDate${status.index+1 }" value="${vo.regDate}">
		<input type="hidden" id="price${status.index+1 }" value="${vo.price}">
	</c:forEach>
	
		    	
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

<script type="text/javascript" src="/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9a98e6a57e71d0677b9b9649676f151b&libraries=services"></script>
<script type="text/javascript" src="/assets/js/main.js"></script>
		    	
</div>
<!-- 맵부분 코딩 close-->
		</div>
	</div>
</body>
</html>