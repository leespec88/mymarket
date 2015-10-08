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
  	
  	
  	
  	
  	
  	
  	
<style>	
  	/* .form-group form-inline{
    background-color: #000;
    background-color: rgba(0,0,0,0.6);
    bottom: 0;
    left: 0;
    padding-bottom: 30px;
    padding-top: 30px;
    position: absolute;
    right: 0;
	} */
	.form-group{
	
	background-color: #000;
	background-color: rgba(0,0,0,0.6);
	padding-bottom: 30px;
    padding-top: 30px;
    position: relative;
	}
	
	#indexSearch {
    padding-top: 123px;
	}
	.container-fluid {
    padding-right: 0px;
    padding-left: 0px;
	}
	
	.text-jumbo {
    font-size: 60px;
    font-weight: 700;
    }

	.header {
    background: transparent;
    border-bottom: none;
    z-index: 1000;
    top: 20px;
    width: 100%;
    position: absolute;
    display: block;
	}
	
	.navbar-default {
	background: transparent;
	border-color: transparent;
	/* color: white; */
    /* background-color: #f8f8f8; */
    /* border-color: #e7e7e7; */
	}
	
	.navbar-default .navbar-nav > li > a {
    color: white;
	}
	.navbar-default  .navbar-brand {
    color: white;
	}
	.container-fluid > .navbar-collapse {
    margin-right: 15px;
    margin-left: 15px;
	}
	.container-fluid > .navbar-header{
	margin-left: 15px;
	}
	.btn-primary {
	    color: #fff;
	    background-color: #337ab7;
	    border-color: #2e6da4;
	    board
	}
	.btn {
	    display: inline-block;
	    padding: 6px 12px;
	    margin-bottom: 0;
	    font-size: 14px;
	    font-weight: normal;
	    line-height: 1.42857143;
	    text-align: center;
	    white-space: nowrap;
	    vertical-align: baseline;
	    -ms-touch-action: manipulation;
	    touch-action: manipulation;
	    cursor: pointer;
	    -webkit-user-select: none;
	    -moz-user-select: none;
	    -ms-user-select: none;
	    user-select: none;
	    background-image: none;
	    border: 1px solid transparent;
	    border-radius: 0px;
	    padding:12px 26px;
	}
	
	.kwdinput{
		height:46px; 
		width:80%; 
		color:#000; 
		font-size:16px; 
		margin:-4px;"
	}
	
	
@media (max-width:713px){
	.text-jumbo {
    font-size: 50px;
    font-weight: 700;
    }
    #indexSearch {
    padding-top: 135px;
	}
}

@media (max-width:600px){
	.text-jumbo {
    font-size: 40px;
    font-weight: 700;
    }
    .text-subjumbo{
    font-size: 20px;
    }
    #indexSearch {
    padding-top: 150px;
	}
}
@media (max-width:479px){
	.text-jumbo {
    font-size: 40px;
    font-weight: 700;
    }
    #indexSearch {
    padding-top: 106px;
	}
	.kwdinput{
		width:60%; 
	}
}
</style>
  	
  	
  	
  	
  	
  	
  	
  	
</head>

<body>
	
	<div id="section1" class="container-fluid" style="background-image:url(images/t7.jpg)">
		<h1 class="text-jumbo"><strong>우리들의 즐거운 중고장터</strong></h1>
		<h3 class="text-subjumbo"><strong>마이마켓에 오신것을 환영합니다.</strong></h3>
		<p  id="sBtn"><a href="/main/" ><button type="button" class="btn btn-danger btn-lg"><strong>주변상품검색</strong></button></a></p>
		<form id="indexSearch" role="form" action="/searchMain" method="post">
			<div class="form-group form-inline">
				<label class="sr-only"></label>
          		<input type="text" name="kwd" placeholder="상품검색창입니다." class="kwdinput">
          		<button type="submit" class="searchbar__submit btn btn-primary btn-large" ><strong>확인</strong></button>
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
	
	<div class="header">
	<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
	</div>
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