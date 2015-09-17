<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/assets/css/main.css" type="text/css">

<style type="text/css">
th { text-align:center;}
.container{ align:center;}
img { height:200px; width:300px;}
</style>
<script type="text/javascript">
$(function(){
	$('li').on({
		mouseenter: function(){ $(this).addClass('active');},
		mouseleave: function(){ $(this).removeClass('active');}
	});
});
</script>
</head>
<body class="viewContext">
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/"><strong id="my">My</strong>Market</a>
    </div>
    <div>
      <ul class="nav navbar-nav">
        <li><a href="/admin/memberList">member</a></li>
        <li><a href="/admin/items">items</a></li>
        <li><a href="/admin/boardList">board</a></li>
      </ul>
    </div>
  </div>
</nav>
<div class="container">
	<h2>판매상품</h2>
	<table class="table table-bordered" style="width:700px">
		<tbody>
			<tr>
				<th class="col-sm-2 col-md-2 col-lg-2">
				물품 #
				</th>
				<td class="col-sm-10 col-md-10 col-lg-10">
				${item.no }
				</td>
			</tr>
			<tr>
				<th>제 목</th>
				<td>${item.title }</td>
			</tr>
			<tr>
				<th>가격</th>
				<td>${item.price }</td>
			</tr>
			<tr>
				<th>판매자</th>
				<td>${user.name } ${item.email }</td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td></td>
			</tr>
			
			<c:forEach var="itemPic" items="${itemPic }" varStatus="status">
			<tr class="image">
				<th>File1</th>
				<td><img src="${itemPic.url }"></td>
			</tr>
			</c:forEach>
			
			<tr>
				<th>등록일</th>
				<td>${item.regDate }</td>
			</tr>
		</tbody>
	</table>
		<div class="form-group">
	      <div class="col-sm-2 col-md-2 col-lg-2">
	        <a href="/admin/items"  class="btn btn-default">취소</a>
	      </div>
	    </div>
</div>
</body>
</html>