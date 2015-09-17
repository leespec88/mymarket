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
	<h2>Context</h2>
	<table class="table table-bordered" style="width:700px">
		<tbody>
			<tr>
				<th class="col-sm-2 col-md-2 col-lg-2">
				#
				</th>
				<td class="col-sm-10 col-md-10 col-lg-10">
				${board.no }
				</td>
			</tr>
			<tr>
				<th>제 목</th>
				<td>${board.title }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${board.userName }</td>
			</tr>
			<tr>
				<th style="height:400px">내 용</th>
				<td>${board.content }</td>
			</tr>
			<tr class="image">
				<th>File1</th>
				<td><img src=""></td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${board.regDate }</td>
			</tr>
		</tbody>
	</table>
		<div class="form-group">
	      <div class="col-sm-2 col-md-2 col-lg-2">
	        <a href="/admin/boardList"  class="btn btn-default">취소</a>
	      </div>
	    </div>
</div>
</body>
</html>