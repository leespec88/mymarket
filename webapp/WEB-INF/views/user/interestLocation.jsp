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
	
	<title>관심지역설정</title>
	<style>
		#location {margin-top:200px}
		#city     {margin-top:30px}
		#intLo    {margin-top:30px}
	</style>
	
</head>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<div class="container" id="location">
		<div class="row">
			<div class="col-sm-6 col-sm-offset-3">
				<h2>관심지역 설정</h2>
		  		<p>원하는 지역을 설정하시고 해당지역의 상품등록 소식을 실시간으로 받아보세요!</p>
		  		<form role="form" id="city" action="/interest/location" method="post">
		  			<input type="hidden" name="userNo" value="${userNo }">
		    		<div class="form-group form-inline">
		      			<label for="sel1">시/도 : </label>
		   				<select class="form-control" name="cityName" id="sel1">
		   					<option>선택하세요</option>
			   				<option>서울특별시</option>
				        	<option>경기도</option>
				        	<option>인천광역시</option>
				        	<option>부산광역시</option>
				        	<option>광주광역시</option>
				        	<option>울산광역시</option>
				        	<option>대전광역시</option>
				        	<option>강원도</option>
				        	<option>충청북도</option>
				        	<option>충청남도</option>
				        	<option>대구광역시</option>
				        	<option>경상북도</option>
				        	<option>경상남도</option>
				        	<option>전라북도</option>
				        	<option>전라남도</option>
		   				</select>
		 		    </div>
		    		<div class="form-group form-inline">
		      			<label for="sel1">구/군 : </label>
		   				<select class="form-control" name="guName" id="sel1">
			   				<option>선택하세요</option>
			   				<option>강남구</option>
				        	<option>종로구</option>
				        	<option>서초구</option>
				        	<option>성동구</option>
				        	<option>양천구</option>
				        	<option>은평구</option>
				        	<option>송파구</option>
				        	<option>서대문구</option>
				        	<option>강서구</option>
				        	<option>강동구</option>
				        	<option>마포구</option>
				        	<option>금천구</option>
				        	<option>영등포구</option>
				        	<option>성북구</option>
				        	<option>용산구</option>
				        	<option>동작구</option>
				        	<option>구로구</option>
				        	<option>광진구</option>
				        	<option>동대문구</option>
				        	<option>강북구</option>
				        	<option>노원구</option>
				        	<option>도봉구</option>
				        	<option>중랑구</option>
				        	<option>중구</option>
		   				</select>
		 		    </div>
		 		    <button type="submit" class="btn btn-default">추가</button>
		  		</form>
		  	</div>
		</div>
    	
		<div class="row" id="intLo">
			<div class="col-sm-6 col-sm-offset-3">
				<h2>관심지역</h2>
				<p>등록한 관심지역 입니다.</p>
				<c:choose>
					<c:when test="${empty list }">
						<div class="well well-sm">
							<p>관심등록 지역이 없습니다.</p>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach var="vo" items="${list }">
							<div class="well well-sm">
								<p>
									<span id="city">${vo.cityName }</span><span id="gu">${vo.guName }</span>
									<a href="/interest/deleteLocation/${vo.interestNo }"><span class="glyphicon glyphicon-remove pull-right"></span></a>
								</p>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
	
</body>
</html>