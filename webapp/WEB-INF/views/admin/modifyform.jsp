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
<div class="container">
	<form class="form-horizontal" id="modifyform" action="/admin/modify" method="post">
	  <fieldset>
	    <legend>회원정보수정</legend>
	    <div class="form-group">
	    <input type="hidden" name="no" value="${member.no }">
	      <label for="inputName" class="col-lg-2 control-label">이름</label>
	      	<div class="col-lg-5">
	        	<input type="text" class="form-control" id="name" name="name" value="${member.name }">
	     	</div>
	     </div>
	    <div class="form-group">
	      <label for="inputEmail" class="col-lg-2 control-label">이메일ID</label>
	      <span class="col-lg-5">
	      <c:choose>
	      	<c:when test="${member.email!='null' }">
	      		<input type="text" class="form-control" id="email" name="email" value="${member.email }">
	      	</c:when>
	      	<c:otherwise>
	      		<input type="text" class="form-control" id="email" name="email" value="" placeholder="Email">
	      	</c:otherwise>
	      </c:choose>
	        	
	      </span>
	    </div>
	    <div class="form-group">
	      	<label class="col-lg-2 control-label">전화번호</label>
	      	<div class="col-lg-5">
	        	<input type="text" class="form-control" id="" name="phone" value="${member.phone }" placeholder="Phone Number">
	     	</div>
	    </div>
	    <div class="form-group">
	      	<label class="col-lg-2 control-label">성별</label>
	      	<div class="col-lg-5">
	      <c:choose>
	      	<c:when test="${member.gender != 'null' }">
	      		<input type="text" class="form-control" id="" name="gender" value="${member.gender }">
	      	</c:when>
	      	<c:otherwise>
	      		<input type="text" class="form-control" id="" name="gender"placeholder="Male or Femail">
	      	</c:otherwise>
	      </c:choose>
	     	</div>
	    </div>
	    <div class="form-group">
	      	<label class="col-lg-2 control-label">생년월일</label>
	      	<div class="col-lg-5">
	        	<input type="text" class="form-control" id="" name="birth" value="${member.birth }" placeholder="YYYY-MM-DD">
	     	</div>
	    </div>
	    <div class="form-group">
	      	<label class="col-lg-2 control-label">회원종류</label>
	      	<div class="col-lg-5">
	        	<input type="text" class="form-control" id="" name="memberType" value="${member.memberType }" placeholder="일반or탈퇴">
	     	</div>
	    </div>
	    
	    <div class="form-group">
	      <div class="col-lg-5 col-lg-offset-2">
	        <a href="/admin/memberList"  class="btn btn-default">취소</a>
	        <input type="submit" class="btn btn-primary btn-submit" value="수정">
	      </div>
	    </div>
	  </fieldset>
	</form>
</div>
</body>
</html>