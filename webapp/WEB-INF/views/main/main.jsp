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
	<link href="/assets/css/font/font.css" rel="stylesheet" type="text/css"/>
	
	
	<style>
		#textlist {padding-top:50px;color:#A6A6A7;}
		.img-thumbnail{width:200px; height:200px;}
		.well{height: 27em;}
	</style>
	
<style>
.well p{
	text-align: center;
	width: 200px; 
	overflow: hidden;
	white-space: nowrap; 
	text-overflow: ellipsis; 
}
.itemTitle{
	font-size: 18px;
}

.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:40px;}
#menu_wrap {position:absolute;top:5;left:5;bottom:0;width:155px;padding:5px;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}

/* 
@media (min-width:992px){
.col-md-1,.col-md-10,.col-md-11,.col-md-12,.col-md-2,.col-md-3,.col-md-4,.col-md-5,.col-md-6,.col-md-7,.col-md-8,.col-md-9{float:left}
.col-md-12{width:100%}
.col-md-11{width:91.66666667%}
.col-md-10{width:83.33333333%}
.col-md-9{width:75%}
.col-md-8{width:66.66666667%}
.col-md-7{width:58.33333333%}
.col-md-6{width:50%}
.col-md-5{width:41.66666667%}
.col-md-4{width:33.33333333%}
.col-md-3{width:25%}
.col-md-2{width:16.66666667%}
.col-md-1{width:8.33333333%}
}*/
	
	
	@media(max-width:767px){
		.col-md-3{
		width:100%
		}
		.col-sm-7{
		display: none;
		}
	}


 @media(min-width:768px){
	@media(max-width:1600px){
		.col-md-3{
		width:33.33333333%
		}
	}
	
	/* @media(min-width:1599px){
		.col-md-3{
		width:25%
		}
	} */
	
	@media(max-width:1400px){
		.col-md-3{
		width:50%
		}
	}
	@media(max-width:860px){
		.col-md-3{
		width:100%
		}
	}
	/* @media(max-width:767px){
		.col-md-3{
		width:100%
		}
	} */

/* 사이드바 래퍼 스타일 */


	#sidebar-wrapper { /* min-width:768px 되기 전까지 스크롤 먹는다는 의미 스크롤 먹이는 부분 */
		position: fixed;
		width: 58%;
		height: 80%;
		margin-left: -33px;
		overflow-x: hidden;
		overflow-y: auto;
	}
}
.mapContent {
	padding:5px;
	text-align:center;
	width:150px;
	background-color:#ff5a5f;
	color:#fff;
	font-size:14px;
	font-weight:bold;
	cursor:pointer;
}
.mapPic {
	width: 120px;
	height: 120px;
}

.locDiv{
	padding:3px;
	font-weight:bold;
	
}
.locInput{
	/* height:20px; */
	width:100px;
}


/* 사이드바 래퍼 스타일 close */
</style>
 	
 	
	<title></title>
</head>

<body>
	
	<div class="container-fluid">
	    <div class="row">
	    	<!-- 사이드바 넣을 블럭을 잡아주고 닫아줌 -->
	    	

 			    <div class="col-sm-7">
		    	
	    			    
<div id="page-wrapper">
	<!-- 사이드바 -->
 			    <h1 class="text-center"  id="textlist"><strong>상품리스트</strong></h1>
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
				<div class="form-group locDiv"> 
					<input class="col-lg-3 locInput" type="text" id="keyword" value=""size="10" placeholder="지역검색">
					
					<button class="btn btn-default"type="submit">검색</button>
				</div>
			</form>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
</div>
<input type="hidden" id="keyword1" value="${place}"size="10" placeholder="지역검색"> 
<script type="text/javascript" src="/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=9a98e6a57e71d0677b9b9649676f151b&libraries=services"></script>
<script type="text/javascript" src="/assets/js/main.js"></script>
		    	
</div>
<!-- 맵부분 코딩 close-->
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>