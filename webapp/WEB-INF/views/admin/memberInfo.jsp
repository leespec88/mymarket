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
</head>
<script type="text/javascript">
$(function(){
	$('li').on({
		mouseenter: function(){ $(this).addClass('active');},
		mouseleave: function(){ $(this).removeClass('active');}
	});
});
</script>
<body>
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

<div class="container"  style="margin-top:50px">
  <h3>${name} 게시물</h3>
  <div class="table-responsive" style="margin-top:30px">
  <table class="table table-bordered" >
    <thead>
      <tr class="active" align="center">
        <th>#</th>
        <th>Title</th>
        <th>등록일</th>
        <th>조회수</th>
        <th>댓글수</th>
        <th>상세보기  &  삭제</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="boardList" items="${boardList }" varStatus="status">
      
      <tr>
        <td>${boardList.no }</td>
        <td>${boardList.title }</td>
        <td>${boardList.regDate }</td>
        <td>${boardList.viewCnt }</td>
        <td>${boardList.replyCnt }</td>
        <td>
        <a href="/admin/viewContext?no=${boardList.no }" type="button" class="btn">
        	<span class="glyphicon glyphicon-zoom-in"></span>
        </a>
        <a href="/admin/deleteContext?no=${boardList.no }" type="button" class="btn">
        	<span class="glyphicon glyphicon glyphicon-trash"></span>
      	</a>
      	</td>
      </tr>
      
      </c:forEach>
    </tbody>
  </table>

</div>
</div>

<div class="container"  style="margin-top:50px">
  <h3>${name} Items</h3>
  <div class="table-responsive" style="margin-top:30px">
  <table class="table table-bordered" >
    <thead>
      <tr class="active">
        <th>#</th>
        <th>ID(Email)</th>
        <th>제 목</th>
        <th>가격</th>
        <th>등록일</th>
        <th>비고</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="items" items="${items }" varStatus="status">
      <tr>
        <td>${items.no }</td>
        <td>${items.email }</td>
        <td>${items.title }</td>
        <td>${items.price }</td>
        <td>${items.regDate }</td>
        <td>
        <a href="/admin/viewItem?no=${items.no }" type="button" class="btn">
        	<span class="glyphicon glyphicon-zoom-in"></span>
        </a>
        <a href="/admin/deleteItems?no=" type="button" class="btn">
        	<span class="glyphicon glyphicon glyphicon-trash"></span>
      	</a>
      	</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>

</div>
</div>
</body>
</html>