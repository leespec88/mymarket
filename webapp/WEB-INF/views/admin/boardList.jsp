<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% pageContext.setAttribute("newLineChar", "\n"); %>
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
<style>
  .container { position:relative; }
  .align-center { width:200px; left:0; right:0; margin-left:auto; margin-right:auto; } /* 가로 중앙 정렬 */
</style>
<script src="/assets/js/jquery-1.11.3.js"></script>
<script type="text/javascript">
$(function(){
	$('li').on({
		mouseenter: function(){ $(this).addClass('active');},
		mouseleave: function(){ $(this).removeClass('active');}
	});
});
</script>
</head>
<body class="adminList">

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
  <h3>Board List(${totCnt })</h3>
  <div class="table-responsive" style="margin-top:30px">
    <form class="navbar-form navbar-right" role="search" action="/admin/boardList" method="post">
  	<div class="form-group">
  		<input type="text" class="form-control" placeholder="Search" name="kwd">
  	</div>
  		<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></button>
 	</form>
  <table class="table table-bordered" >
    <thead>
      <tr class="active" align="center">
        <th>#</th>
        <th>Title</th>
        <th>User#</th>
        <th>이름</th>
        <th>등록일</th>
        <th>조회수</th>
        <th>댓글수</th>
        <th>상세보기  &  삭제</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="boardList" items="${boardList }" varStatus="status">
      
      <tr>
        <td>${totCnt-((currentPageNo-1)*10)-status.index }</td>
        <td>${boardList.title }</td>
        <td>${boardList.userNo }</td>
        <td>${boardList.userName }</td>
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
<div class="container-fluid">
<div class="align-center">
	<c:if test="${totGroupNo>1 }">
		<a href="/admin/boardList?currentPageNo=${currentGroupStartPageNo-groupSize>0?currentGroupLastPageNo-groupSize:1 }">
			<span class="glyphicon glyphicon glyphicon-triangle-left"/>
		</a>
	</c:if>
	
	<c:forEach var="i" begin="${currentGroupStartPageNo }" step="1" end="${currentGroupLastPageNo }" >
		<c:if test="${totPageNo>=i }">
			<a href="/admin/boardList?currentPageNo=${i }" class="btn btn-default">${i }</a>&nbsp;
		</c:if>
	</c:forEach>
	<c:if test="${totGroupNo>1 }">
		<a href="/admin/boardList?currentPageNo=${currentGroupLastPageNo+groupSize>totPageNo?totPageNo:(currentGroupStartPageNo+groupSize)}">
			<span class="glyphicon glyphicon-triangle-right"/>
		</a>
	</c:if>
</div> 
</div>
</div>
</body>
</html>