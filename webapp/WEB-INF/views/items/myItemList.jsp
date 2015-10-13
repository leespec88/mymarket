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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>${userVo.name}님의 아이템</title>
</head>
<style>
.soldout {
	left: 31px;
    top: 10px;
}
.text-center{
 	margin-top: 50px;
}
.img-responsive {
	width: 230px;
    height: 305px;
    padding-left: 1px;
    border-top-left-radius: 8px;
    border-top-right-radius: 8px;
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
	margin-top: 152px;
	background: #051235;
	color: #fff
}

@media ( max-width :1200px) {
	.imageText {
		margin-top: 165px
	}
}

@media ( max-width :1000px) {
	.imageText {
		margin-top: 164px
	}
}

@media ( max-width :600px) {
	.imageText {
		margin-top: 164px
	}
}

@media ( max-width :540px) {
	.imageText {
		margin-top: 164px
	}
}

@media ( max-width :475px) {
	.imageText {
		margin-top: 164px
	}
}

@media ( max-width :410px) {
	.imageText {
		margin-top: 164px
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

.container-fluid {
	padding-right: 0px;
	padding-left: 0px;
}

.text-jumbo {
	font-size: 60px;
	font-weight: 700;
}

.container-fluid>.navbar-collapse {
	margin-right: 15px;
	margin-left: 15px;
}

.container-fluid>.navbar-header {
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
	padding: 12px 26px;
}

.kwdinput {
	height: 46px;
	width: 80%;
	color: #000;
	font-size: 16px;
	margin: -4px;
	"
}

@media ( max-width :713px) {
	.text-jumbo {
		font-size: 50px;
		font-weight: 700;
	}
	#indexSearch {
		padding-top: 135px;
	}
}

@media ( max-width :600px) {
	.text-jumbo {
		font-size: 40px;
		font-weight: 700;
	}
	.text-subjumbo {
		font-size: 20px;
	}
	#indexSearch {
		padding-top: 150px;
	}
}

@media ( max-width :479px) {
	.text-jumbo {
		font-size: 40px;
		font-weight: 700;
	}
	#indexSearch {
		padding-top: 106px;
	}
	.kwdinput {
		width: 60%;
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
	padding: 15px 0 0 30px;
}

</style>
<script type="text/javascript">
$(document).ready(
		function() {
				$('.itemPrice').number(true);
			});
</script>
<body>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
			<div class="container text-center" style="padding-top: 10px">
				<h2>${userVo.name}</h2>
				<h3>${userVo.email}</h3>
				<h3>${userVo.regDate}</h3>
				
				<div class="row">
						<c:forEach var="item" items="${selectUserItemList}">
						<div class="col-sm-4" style="padding-top: 10px; padding-left: 30px">
								<h2 class="imageText">
									<span class="glyphicon glyphicon-flash itemPrice">${item.PRICE}</span>
								</h2>
								<a href="/items/detailView/${item.NO}">
								<c:if test="${item.SELL_STATE == '판매완료'}">
									<img class="soldout"src="/assets/images/img_contents_card_soldout.png" style="position: absolute; z-index: 3;" >
								</c:if>
								<img
									style="position: relative; z-index: 1;" class="img-responsive"
									src="${item.IMAGE}" alt="Chania" width="530" height="345" style="position: absolute; z-index: 1;">
								</a>
						</div>
					</c:forEach>
				</div>
			</div>
</body>
<script type="text/javascript" src="/assets/js/jquery-number-master/jquery.number.min.js"></script>
</html>