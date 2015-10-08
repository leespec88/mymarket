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
			
			setInterval(function(){
				var imageStyle = $('#section1').attr('style');
				if(imageStyle == "background-image:url(images/t7.jpg)"){
					$('#section1').attr('style', 'background-image:url(images/t5.jpg)');
				}
				if(imageStyle == "background-image:url(images/t5.jpg)"){
					$('#section1').attr('style', 'background-image:url(images/t7.jpg)');
				}
				
			}, 5000);
		});
			
	</script>
	<title>Insert title here</title>
	<style>
		body {
		    position: relative; 
		}
		#section1 {padding-top:130px;height:600px;color: #fff; text-align:center;}
		#indexSearch {padding-top:1em;}
		#sBtn      {padding-top:3em;}
		#search {color:#fff;}
		.row {padding: 15px 0 0 30px;}
		.keywordlist {    display: block;
    overflow: hidden;
    _width: 210px;
    font-size: 12px;
    color: #000;
    white-space: nowrap;
    text-overflow: ellipsis;
    word-wrap: normal;
    }
    .keywordlist:hover{
    text-decoration: underline;
    }
    
    .num {
        display: block;
    float: left;
    min-width: 13px;
    _width: 13px;
    height: 12px;
    margin-right: 9px;
    border: 1px solid #e0e0e0;
    color: #666;
    line-height: 12px;
    text-align: center;
    }
  	</style>
</head>

<body>
	
	<div id="section1" class="container-fluid" style="background-image:url(images/t7.jpg)">
		<h1><strong>우리들의 즐거운 중고장터</strong></h1>
		<h3><strong>마이마켓에 오신것을 환영합니다.</strong></h3>
		<p id="sBtn"><a href="/main/" ><button type="button" class="btn btn-danger btn-lg"><strong>주변상품검색</strong></button></a></p>
		<form id="indexSearch" role="form" action="/searchMain" method="post">
			<div class="form-group form-inline">
				<label class="sr-only"></label>
          		<input type="text" name="kwd" placeholder="상품검색창입니다." style="height:35px;color:#000">
          		<button type="submit" class="btn btn-default"><strong>확인</strong></button>
        	</div>
		</form>
	</div>
	<div class="container" style="padding-top:10px;" >
		
		<ul class="nav nav-tabs nav-justified">
			<li class="active" id="tab" ><a href="#">검색어</a></li>
			<li><a href="#">10대</a></li>
			<li><a href="#">20대</a></li>
			<li><a href="#">30대</a></li>
			<li><a href="#">40대</a></li>
		</ul>
		<div class="row">
		<c:set var="count" value="${fn:length(ageGrouplist)}" />
		<form id="commonForm">
		<c:forEach var="item" items="${ageGrouplist}" varStatus="count" begin="0">
			
			<div class="col-sm-12" >
<!-- <img class="img-responsive" src="/images/puppy.jpg" alt="Chania" width="530" height="345"> -->
    			<p>
    			<em class="num">${count.index+1}</em>
    			<a href="#"><span class="keywordlist" onclick="goKeyword('${item.keyword}')">${item.keyword}(${item.count})</span></a>
    			</p>
			</div>
			</c:forEach>
			</form>
		</div>
	</div>
	
	<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
<script src="<c:url value="/assets/js/common.js"/>" charset="utf-8"></script>
<script type="text/javascript">
function goKeyword(obj) {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("/searchMain/");
	comSubmit.addParam("kwd", obj);
	comSubmit.submit();
}
</script>
</html>

