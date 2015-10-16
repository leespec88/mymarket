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
		<link href="/assets/css/font/font.css" rel="stylesheet" type="text/css"/>
	
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
	.img-responsive{
	height: 400px;
	}
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
 .imageText {
	position: absolute;
	z-index: 2;
	margin-top: 300px;
	background: #051235;
	color: #fff
	
}

@media ( max-width :1200px) {
	.imageText {
		margin-top: 250px
	}
}

@media ( max-width :1000px) {
	.imageText {
		margin-top: 320px
	}
}

@media ( max-width :600px) {
	.imageText {
		margin-top: 300px
	}
}

@media ( max-width :540px) {
	.imageText {
		margin-top: 250px
	}
}

@media ( max-width :475px) {
	.imageText {
		margin-top: 200px
	}
}

@media ( max-width :410px) {
	.imageText {
		margin-top: 180px
	}
}

@media ( max-width :380px) {
	.imageText {
		margin-top: 150px
	}
}

@media ( max-width :380px) {
	.imageText {
		margin-top: 0
	}
}


	.search{
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
body {
	position: relative;
}

#section1 {
	padding-top: 130px;
	height: 600px;
	color: #fff;
	text-align: center;
}



#sBtn {
	padding-top: 3em;
}

#search {
	color: #fff;
}

.row {
	height: 400px;
	padding: 15px 0 0 30px;
}

.num {
	display: block;
	float: left;
	min-width: 13px;
	_width: 13px;
	height: 12px;
	margin-right: 9px;
	border: 1px solid #e0e0e0;
	line-height: 12px;
	text-align: center;
}
 .nav-tabs {width:110%;}
	.nav-tabs li {display:table-cell;border-left:1px solid #ccc;text-align:center}
	.nav-tabs li:first-child {border-left:0 none}
	.nav-tabs .tit {display:block;padding:5px;cursor:pointer;}
	.nav-tabs .on .tit {color:#fff;background-color:#d9534f}
	.tab_cont {padding:2px;margin-top:5px;}
	.piece {
        min-width: 300px;
        min-width: 400px;
        max-width: 500px;
        padding: 10px;
        margin: 10px;
	} 
	.keytem {
	padding-left:5px;
	}
	.keylist {
	padding-top:8px;
	
	
	}
	.keywordlist {
	display: block;
	overflow: hidden;
	_width: 210px;
	font-size: 11px;
	white-space: nowrap;
	text-overflow: ellipsis;
	word-wrap: normal;
	color: #444;
	font-family: 돋움,dotum,sans-serif;
}

.keywordlist:hover {
	text-decoration: underline;
}
.glyphicon-heart {
	color: darkorange;
}

#cursor {
	cursor: pointer;
}
</style>
</head>
<body>
	
	<div id="section1" class="container-fluid" style="background-image:url(images/t7.jpg)">
		<h1 class="text-jumbo"><strong>우리들의 즐거운 중고장터</strong></h1>
		<h3 class="text-subjumbo"><strong>마이마켓에 오신것을 환영합니다.</strong></h3>
		<p  id="sBtn"><a href="/main/" ><button type="button" class="btn btn-danger btn-lg"><strong>주변상품검색</strong></button></a></p>
		<form id="indexSearch" role="form" action="/searchMain" method="post">
			<div class="search form-inline">
				<label class="sr-only"></label>
          		<input type="text" name="kwd" placeholder="상품검색창입니다." class="kwdinput">
          		<button type="submit" class="searchbar__submit btn btn-primary btn-large" ><strong>확인</strong></button>
        	</div>
		</form>
	</div>
	
	<div class="container" style="padding-top: 30px;">
			<div class="row">
				<div class="col-sm-3 piece jq_tabonoff_auto">
					<!-- <ul class="jq_tab tab_menu container"> -->
					<ul class="jq_tab nav nav-tabs nav-justified">
						<li><strong class="tit">검색어</strong></li>
						<li><strong class="tit">인기</strong></li>
						<li><strong class="tit">10대</strong></li>
						<li><strong class="tit">20대</strong></li>
						<li><strong class="tit">30대</strong></li>
						<!-- <li><strong class="tit">40대</strong></li> -->
					</ul>
					<div class="jq_cont tab_cont keylist">
						<div class="cont">
							<c:set var="count" value="${fn:length(KwdCntList)}" />
							<form id="commonForm">
								<c:forEach var="item" items="${KwdCntList}" varStatus="count" begin="0">
									<div class="col-sm-12 keytem">
										<p>
											<em class="num">${count.index+1}</em> <a href="#"><span
												class="keywordlist" onclick="goKeyword('${item.KEYWORD}')">${item.KEYWORD}(${item.COUNT})</span></a>
										</p>
									</div>
								</c:forEach>
							</form>
						</div>
						<div class="cont">
							<form id="commonForm">
								<c:forEach var="items" items="${selectListViewCnt}"  varStatus="count">
									<div class="col-sm-12 keytem">
										<p>
												 <em class="num">${count.index+1}</em> <a href="#"><span
													class="keywordlist" onclick="goKeyword('${items.TITLE}')">${items.TITLE}(${items.VIEW_COUNT})</span></a> 
										</p>
									</div>
								</c:forEach>
							</form>
						</div>
						<div class="cont">
							<form id="commonForm">
									<div class="row">
									<div class="col-sm-6 keytem">
										<p class="bg-primary">남자</p>
										<c:forEach var="m1" items="${m1}"  varStatus="count">
										<p>
											<em class="num">${count.index+1}</em> <a href="#"><span
												class="keywordlist" onclick="goKeyword('${m1.keyword}')">${m1.keyword}(${m1.count})</span></a>
										<p>
										</c:forEach>
									</div>
									<div class="col-sm-6 keytem">
										<p class="bg-success">여자</p>
										<c:forEach var="f1" items="${f1}" varStatus="count">
											<p>
												<em class="num">${count.index+1}</em> <a href="#"><span
													class="keywordlist" onclick="goKeyword('${f1.keyword}')">${f1.keyword}(${f1.count})</span></a>
											</p>
										</c:forEach>			
									</div>
								</div>
							</form>
						</div>
						<div class="cont">
							<form id="commonForm">
								<div class="row">
									<div class="col-sm-6 keytem">
										<p class="bg-primary">남자</p>
										<c:forEach var="m2" items="${m2}"  varStatus="count">
										<p>
											<em class="num">${count.index+1}</em> <a href="#"><span
												class="keywordlist" onclick="goKeyword('${m2.keyword}')">${m2.keyword}(${m2.count})</span></a>
										<p>
										</c:forEach>
									</div>
									<div class="col-sm-6 keytem">
										<p class="bg-success">여자</p>
										<c:forEach var="f2" items="${f2}" varStatus="count">
											<p>
												<em class="num">${count.index+1}</em> <a href="#"><span
													class="keywordlist" onclick="goKeyword('${f2.keyword}')">${f2.keyword}(${f2.count})</span></a>
											</p>
										</c:forEach>			
									</div>
								</div>
							</form>
						</div>
						<div class="cont">
							<c:set var="count3" value="${fn:length(ageGrouplist)}" />
							<form id="commonForm">
								<div class="row">
										<div class="col-sm-6 keytem">
											<p class="bg-primary">남자</p>
											<c:forEach var="m3" items="${m3}"  varStatus="count">
											<p>
												<em class="num">${count.index+1}</em> <a href="#"><span
													class="keywordlist" onclick="goKeyword('${m3.keyword}')">${m3.keyword}(${m3.count})</span></a>
											<p>
											</c:forEach>
										</div>
										<div class="col-sm-6 keytem">
											<p class="bg-success">여자</p>
											<c:forEach var="f3" items="${f3}" varStatus="count">
												<p>
													<em class="num">${count.index+1}</em> <a href="#"><span
														class="keywordlist" onclick="goKeyword('${f3.keyword}')">${f3.keyword}(${f3.count})</span></a>
												</p>
											</c:forEach>			
										</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-sm-6">
					<div class="embed-responsive embed-responsive-16by9">
						<iframe class="embed-responsive-item"
							src="http://www.youtube.com/embed/XGSy3_Czz8k"></iframe>
					</div>
				</div> 
	</div>
</div>

	<div class="container text-center" style="padding-top: 10px">
		<h1>지역별 상품</h1>
		<div class="row">
			<div class="col-sm-8">
				<h1 class="imageText">서울</h1>
				<a href="#"><img style="position: relative; z-index: 1;" class="img-responsive"
					src="/images/seoul3.jpg" width="800" height="345">
				</a>
			</div>
			<div class="col-sm-4">
				<h1 class="imageText">부산</h1>
				<a href="#"><img style="position: relative; z-index: 1;" class="img-responsive"
					src="/images/busan.jpg" width="530" height="345">
				</a>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4">
				<h1 class="imageText">제주도</h1>
				<a href="#"><img style="position: relative; z-index: 1;" class="img-responsive"
					src="/images/jeju.jpg" width="530" height="345">
				</a>
			</div>
			<div class="col-sm-4">
				<h1 class="imageText">인천</h1>
				<a href="#"><img style="position: relative; z-index: 1;" class="img-responsive"
					src="/images/incheon.jpg" width="530" height="345">
				</a>
			</div>
			<div class="col-sm-4">
				<h1 class="imageText">광주</h1>
				<a href="#"><img style="position: relative; z-index: 1;" class="img-responsive"
					src="/images/guwangju.jpg" width="530" height="345">
				</a>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4">
				<h1 class="imageText">울산</h1>
				<a href="#"><img style="position: relative; z-index: 1;" class="img-responsive"
					src="/images/ulsan.jpg" width="530" height="345">
				</a>
			</div>
			<div class="col-sm-8">
				<h1 class="imageText">경기도</h1>
				<a href="#"><img style="position: relative; z-index: 1;" class="img-responsive"
					src="/images/gyeonggi.jpg" width="800" height="345">
				</a>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4">
				<h1 class="imageText">강원도</h1>
				<a href="#"><img style="position: relative; z-index: 1;" class="img-responsive"
					src="/images/gangwon.jpg" width="530" height="345">
				</a>
			</div>
			<div class="col-sm-4">
				<h1 class="imageText">충청북도</h1>
				<a href="#"><img style="position: relative; z-index: 1;" class="img-responsive"
					src="/images/choongbuk.jpg" width="530" height="345">
				</a>
			</div>
			<div class="col-sm-4">
				<h1 class="imageText">충청남도</h1>
				<a href="#"><img style="position: relative; z-index: 1;" class="img-responsive"
					src="/images/choongnam.jpg" width="530" height="345">
				</a>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4">
				<h1 class="imageText">경상북도</h1>
				<a href="#"><img style="position: relative; z-index: 1;" class="img-responsive"
					src="/images/gyungbuk.jpg" width="530" height="345">
				</a>
			</div>
			<div class="col-sm-8">
				<h1 class="imageText">경상남도</h1>
				<a href="#"><img style="position: relative; z-index: 1;" class="img-responsive"
					src="/images/gyungnam.jpg" width="800" height="345">
				</a>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-8">
				<h1 class="imageText">전라북도</h1>
				<a href="#"><img style="position: relative; z-index: 1;" class="img-responsive"
					src="/images/junbuk.jpg" width="800" height="345">
				</a>
			</div>
			<div class="col-sm-4">
				<h1 class="imageText">전라남도</h1>
				<a href="#"><img style="position: relative; z-index: 1;" class="img-responsive"
					src="/images/junnam.jpg" width="530" height="345">
				</a>
			</div>
		</div>
	</div>
	<div class="container text-center" style="padding-top: 10px">
		<h1>최근 올라온 상품</h1>
		<div class="row">
		<!-- 고유번호 설정을 위한 c:set 설정 -->
		<c:set var="status" value="${fn:length(RecentRegItemlist) }"></c:set>
		
			<c:forEach var="recentItem" items="${RecentRegItemlist}" varStatus="status" begin="0">
				<div class="col-sm-12 col-md-6"
					style="padding-top: 10px; padding-left: 30px">
					<div>
						<h2 class="imageText">
							<%-- <a class="jjim" href="/jjim/insert/${recentItem.NO}/${authUser.no}"> --%>
							<c:if test="${authUser!=null}">
								<a id="cursor" class="jjim"	<%-- onclick="jjimClick(${recentItem.NO})" --%>>
									<span
									class="glyphicon glyphicon-heart" id="glyphicon-heart${status.index+1}"
									style="margin-left: 5px; margin-right: 5px" onclick="javascript:heartbit(${status.index+1});">
									<input type="hidden" id="jjimNo${status.index+1}" value="${recentItem.NO }">
									<input type="hidden" id="itemNo" value="${status.index+1}">
									<input type="hidden" id="authNo" value="${authUser.no }">
									</span>
									</a>
							</c:if>
							<span class="itemPrice">${recentItem.PRICE}</span> 
						</h2>
						<a href="items/detailView/${recentItem.NO}"><img
							style="position: relative; z-index: 1;" class="img-responsive"
							src="${recentItem.IMAGE}" alt="Chania" width="530" height="345">
						</a>

					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="container-fluid"
		style="background: #4C7080; margin-top: 30px">
		<h5 class="text-center" style="color: #fff">(주)마이마켓의 사전 서면 동의 없이
			마이마켓 사이트의 일체의 정보, 콘텐츠 및 UI등을 상업적 목적으로 전재, 전송, 스크래핑 등 무단 사용할 수 없습니다.</h5>
	</div>
	<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
<script type="text/javascript">
$(document).ready(
		function() {
				$('.itemPrice').number(true);
			});
</script>	
<script>
	$(document)
			.ready(
					function() {
						$('.jq_onoff .jq_hide').css('display', 'none');
						$('.jq_autoonoff .jq_hide').css('display', 'none');

						//탭(ul) onoff
						$('.jq_tabonoff .jq_cont').children().css('display',
								'none');
						$('.jq_tabonoff .jq_cont div:first-child').css(
								'display', 'block');
						$('.jq_tabonoff .jq_tab li:first-child').addClass('on');
						$('.jq_tabonoff').delegate(
								'.jq_tab li',
								'click',
								function() {
									var index = $('.jq_tabonoff .jq_tab li')
											.index(this);
									$(this).siblings().removeClass();
									$(this).addClass('on');
									$(this).parent().next('.jq_cont')
											.children().slideUp('fast').eq(
													index).slideDown('fast');
								});

						//탭(ul) onoff(auto)
						$('.jq_tabonoff_auto .jq_cont').children().css(
								'display', 'none');
						$('.jq_tabonoff_auto .jq_cont div:first-child').css(
								'display', 'block');
						$('.jq_tabonoff_auto .jq_tab li:first-child').addClass(
								'on');
						function tabonoff(o) {
							var index = $('.jq_tabonoff_auto .jq_tab li')
									.index(o);
							$(o).siblings().removeClass();
							$(o).addClass('on');
							$(o).parent().next('.jq_cont').children().slideUp(
									'fast').eq(index).slideDown('fast');
						}
						(function(a) {
							a.fn.tabonoff_auto = function(p) {
								var s_t_i = p && p.scroller_time_interval ? p.scroller_time_interval
										: "4000"; //롤링타임 수정가능
								var dom = a(this);
								var s_length = dom.length;
								var timer;
								var current = 0;
								begin();
								play();
								function begin() {
									dom.click(function() {
										current = dom.index($(this));
										play();
										stop()
									});
									dom.parent().parent().hover(function() {
										stop();
									}, function() {
										timer = setTimeout(play, s_t_i);
									});
								}
								function stop() {
									clearTimeout(timer);
								}
								function play() {
									clearTimeout(timer);
									tabonoff(dom[current]);
									if (current >= s_length - 1) {
										current = 0;
									} else {
										current++;
									}
									timer = setTimeout(play, s_t_i);
								}
							}
						})(jQuery);
						$(".jq_tabonoff_auto li").tabonoff_auto();
						function addComma(obj){
						var input = Number(obj.val()).toLocaleString('en');
						$(obj).val(input);
						}
					});
	//찜 눌렀을때 ajax 발동 - 디비 등록 - 찜 하트 이미지 변경( 빨간색 )	
	function heartbit(number){
		//alert("aa");
				var jjimNo = document.getElementById("jjimNo"+number).value;
				var itemNo = $('#itemNo').val();
				var authNo = $('#authNo').val();
				var info = confirm("찜하실래요?");
				console.log(jjimNo);
				console.log(authNo); //85
				console.log(itemNo); //1
				
				if(info==true){
					$('#glyphicon-heart'+number).css('color', 'red');
					$.ajax({
						url:'/jjim/insert/'+jjimNo+'/'+authNo,
						type:'get',
						dataType:'json',
						success:function(response){
							console.log(response);
									
						}
					});	
				} else 
					return false;
		}			
		
	
</script>
<script type="text/javascript" src="/assets/js/jquery-number-master/jquery.number.min.js"></script>
</html>
