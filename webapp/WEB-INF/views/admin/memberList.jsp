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
<style>
  div { position:relative; }
  .align-center { width:200px; left:0; right:0; margin-left:auto; margin-right:auto; } /* 가로 중앙 정렬 */
  
</style>
<script src="/assets/js/jquery/jquery-1.9.0.js"></script>
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
  <h3>Member List(${totCnt })</h3>
  <div class="table-responsive" style="margin-top:30px">
  <form class="navbar-form navbar-right" role="search" action="/admin/memberList" method="post">
  	<div class="form-group">
  		<input type="text" class="form-control" placeholder="Name Search" name="kwd">
  	</div>
  		<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></button>
  </form>
  <table class="table table-bordered" >
    <thead>
      <tr class="active">
        <th>#</th>
        <th>이름</th>
        <th>이메일</th>
        <th>전화번호</th>
        <th>생년월일</th>
        <th>성별</th>
        <th>회원종류</th>
        <th>가입일자</th>
        <th>비고</th>
      </tr>
    </thead>
    <tbody>
    <c:forEach var="memberList" items="${memberList }" varStatus="status">
      <tr>
        <td>${memberList.no}</td>
        <td>${memberList.name }</td>
        <td>
        <c:choose>
        	<c:when test="${memberList.email!='null'}">
        		${memberList.email }
	      	</c:when>
	      	<c:otherwise>
	      		
	      	</c:otherwise>
        </c:choose></td>
        <td>${memberList.phone }</td>
        <td>${memberList.birth }</td>
        <td>
        <c:choose>
        	<c:when test="${memberList.gender!='null'}">
        		${memberList.gender }
	      	</c:when>
	      	<c:otherwise>
	      		
	      	</c:otherwise>
        </c:choose></td>
		</td>
        <td>${memberList.memberType }</td>
        <td>${memberList.regDate }</td>
        <td>
        <a href="/admin/memberInfo?no=${memberList.no}&name=${memberList.name}" type="button" class="btn">
        	<span class="glyphicon glyphicon-zoom-in"></span>
      	</a>
        <a href="/admin/modifyform?no=${memberList.no }" type="button" class="btn">
        	<span class="glyphicon glyphicon-pencil"></span>
      	</a>
      	</td>
      </tr>
      </c:forEach>
    </tbody>
  </table>

</div>
<div class="container-fluid">
<div class="align-center">
<%-- 	<c:if test="${totPageNo>0 }">
		<a href="/admin/memberList?currentPageNo=1"><span class="glyphicon glyphicon-step-backward"/></a>
	</c:if> --%>
	<c:if test="${totGroupNo>1 }">
		<a href="/admin/memberList?currentPageNo=${currentGroupStartPageNo-groupSize>0?currentGroupLastPageNo-groupSize:1 }">
			<span class="glyphicon glyphicon glyphicon-triangle-left"/>
		</a>
	</c:if>
	
	<c:forEach var="i" begin="${currentGroupStartPageNo }" step="1" end="${currentGroupLastPageNo }" >
		<c:if test="${totPageNo>=i }">
			<a href="/admin/memberList?currentPageNo=${i }" class="btn btn-default">${i }</a>&nbsp;
		</c:if>
	</c:forEach>
	<c:if test="${totGroupNo>1 }">
		<a href="/admin/memberList?currentPageNo=${currentGroupLastPageNo+groupSize>totPageNo?totPageNo:(currentGroupStartPageNo+groupSize)}">
			<span class="glyphicon glyphicon-triangle-right"/>
		</a>
	</c:if>
<%-- 	<c:if test="${totPageNo>0 }">
		<a href="/admin/memberList?currentPageNo=${totPageNo }"><span class="glyphicon glyphicon-step-forward"></span></a>
	</c:if> --%>
</div> 
</div>
</div>
</body>
</html>