<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<style>
.jjimimg {
width: 500px;
height: 400px;
}
</style>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<!-- bootstrap -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	
	<title>Insert title here</title>
</head>


<body>
	<div class="container" style="padding-top:100px">
	<h1 class="text-center">찜 목록</h1>
		<div class="row" style="padding-top:20px">
	<c:set var="status" value="${fn:length(jlist)}"></c:set>
		<c:forEach var="vo" items="${jlist }" varStatus="status">
		<!-- 리스트부분 -->
			<div class="col-sm-6">
				<img class="jjimimg" src="${vo.image}" alt="사진이없어욤">
    			<p  style="padding-top:10px; padding-right:60px;">
    				<span>${vo.title }</span>><span class="glyphicon glyphicon-map-marker" href=javascript:setPosition('"+itemList[i].location+"');></a></span>
    				<a href="/jjim/delete/${vo.itemNo}" class="btn btn-info btn-sm pull-right"><span class="glyphicon glyphicon-trash"></span> 삭제 </a>
    			</p>
    			<p><span>가격 : </span><span>${vo.price} 원</span></p>
			</div>
		</c:forEach>
	</div>
	</div>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
</body>
</html>