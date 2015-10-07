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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<link href="/assets/js/bootstrap-3.3.5-dist/css/bootstrap.css" rel="stylesheet">
	<script src="/assets/js/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
	<script>
		$(document).ready(function(){
			$('li').click(function(event){
				$('li').removeClass('active');
				$(this).addClass('active');
			});
		});
			
	</script>
	<title>Insert title here</title>
	<style>
		body {
		    position: relative; 
		}
		#section1 {padding-top:130px;height:500px;color: #fff; background-color: #1E88E5; text-align:center;}
		#indexSearch {padding-top:1em;}
		#sBtn      {padding-top:3em;}
		#search {color:#fff;}
  	</style>
</head>

<body>
	
	<div id="section1" class="container-fluid">
		<h1><strong>우리들의 즐거운 중고장터</strong></h1>
		<h3><strong>마이마켓에 오신것을 환영합니다.</strong></h3>
		<p  id="sBtn"><a href="/main/" ><button type="button" class="btn btn-danger btn-lg"><strong>주변상품검색</strong></button></a></p>
		<form id="indexSearch" role="form">
			<div class="form-group form-inline">
				<label class="sr-only"></label>
          		<input type="text" class="form-control" name="kwd" placeholder="상품검색창입니다.">
          		<button type="submit" class="btn btn-default"><strong>확인</strong></button>
        	</div>
        	
		</form>
	</div>
	<div class="container" style="padding-top:10px">
		
		<ul class="nav nav-tabs nav-justified">
			<li class="active" id="tab" ><a href="#">검색어</a></li>
			<li><a href="#">10대</a></li>
			<li><a href="#">20대</a></li>
			<li><a href="#">30대</a></li>
			<li><a href="#">40대</a></li>
		</ul>
		<div class="row">
		
		<c:forEach var="item" items="${ageGrouplist}" >
			<div class="col-sm-12">
<!-- <img class="img-responsive" src="/images/puppy.jpg" alt="Chania" width="530" height="345"> -->
    			<p><span>${item.keyword}(${item.count})</span></p>
			</div>
			</c:forEach>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>