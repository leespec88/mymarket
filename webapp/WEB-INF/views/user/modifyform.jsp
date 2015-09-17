<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="/assets/css/main.css" type="text/css">
<title>Insert title here</title>
</head>
<script src="/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
$(function(){
	$('#passwordModify').submit(function(){
		var $password = $("input[type='password']");
		var password = $password.val();
		var $pwCheck = $('#pwCheck');
		var pwCheck = $pwCheck.val();
		if(password==""){
			alert("패스워드가 비어있습니다");
			$password.focus();
			return false;
		}else if(!pwCheck.equals(password)){
			alert("패스워드가 일치해야 합니다.");
			$pwcheck.focus();
			return false;
		}
	});
});

function joinCheck(){
	var email=$('#email').val();
 	$.ajax({
		url:'/user/checkEmail',
		type:'post',
		dataType:'json',
		data:{'email':email},
		success:function(result){
			if(result)
				alert("이미 사용하고 있습니다.");
			else
				alert("사용 가능합니다.");
		}
	});
};
</script>
<body class="modifyform">
<div class="container">
	<form class="form-horizontal" id="modifyform" action="/user/modify" method="post">
	  <fieldset>
	    <legend>회원정보수정</legend>
	    <div class="form-group">
	      <label for="inputName" class="col-lg-2 control-label">이름</label>
	      	<div class="col-lg-8">
	        	<input type="text" class="form-control" id="name" name="name" value="${authUser.name }" readonly="readonly">
	     	</div>
	     </div>
	    <div class="form-group">
	      <label for="inputEmail" class="col-lg-2 control-label">이메일ID</label>
	      <span class="col-lg-8">
	      <c:choose>
	        <c:when test="${authUser.email!='null' }">
	        	<input type="text" class="form-control" id="email" name="email" value="${authUser.email }" readonly="readonly">
	        </c:when>
	        <c:otherwise>
	        	<input type="text" class="form-control" id="email" name="email" placeholder="Email" readonly="readonly">
	        </c:otherwise>
	      </c:choose>
	      </span>
	    </div>
	    <div class="form-group">
	      	<label class="col-lg-2 control-label">전화번호</label>
	      	<div class="col-lg-8">
	        	<input type="text" class="form-control" id="" name="phone" value="${authUser.phone }" placeholder="Phone Number">
	     	</div>
	    </div>
	    <div class="form-group">
	      	<label class="col-lg-2 control-label">성별</label>
	      	<div class="col-lg-8">
	      	<c:choose>
	      	<c:when test="${authUser.gender!='null' }">
	        	<input type="text" class="form-control" id="" name="gender" value="${authUser.gender }" placeholder="Male or Femail">
	        </c:when>
	         <c:otherwise>
	         	<input type="text" class="form-control" id="" name="gender" placeholder="Male or Femail">
	         </c:otherwise>
	         </c:choose>
	     	</div>
	    </div>
	    <div class="form-group">
	      	<label class="col-lg-2 control-label">생년월일</label>
	      	<div class="col-lg-8">
	      	<c:choose>
	      	<c:when test="${authUser.birth!='null' }">
	        	<input type="text" class="form-control" id="" name="birth" value="${authUser.birth }" placeholder="YYYY-MM-DD">
	        </c:when>
	        <c:otherwise>
	        	<input type="text" class="form-control" id="" name="birth"placeholder="YYYY-MM-DD">
	        </c:otherwise>
	        </c:choose>
	     	</div>
	    </div>
	    
	    <div class="form-group">
	      <div class="col-lg-8 col-lg-offset-2">
	        <a href="/"  class="btn btn-default">취소</a>
	        <input type="submit" class="btn btn-primary btn-submit" value="수정">
	      </div>
	    </div>
	  </fieldset>
	</form>
</div>
<div class="container">
	<form class="form-horizontal" id="passwordModify" action="/user/pwModify" method="post">
	  <fieldset>
	    <legend>패스워드 수정</legend>
	    <div class="form-group">
	      <label for="inputPassword" class="col-lg-2 control-label">새 패스워드</label>
	      <div class="col-lg-8">
	        <input type="password" class="form-control" id="password" name="password" placeholder="Password">
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="confirmPassword" class="col-lg-2 control-label">패스워드확인</label>
	      <div class="col-lg-8">
	        <input type="password" class="form-control" id="pwCheck" name="pwCheck" placeholder="Password">
	      </div>
	    </div>
	    <c:if test="${not empty authUser.idNo }">
	    <div class="form-group">
	      <div class="col-lg-8 col-lg-offset-2">
	        <a href="/"><input type="button" class="btn btn-default" value="취소"/></a>
	        <input type="submit" class="btn btn-primary btn-submit" value="수정">
	      </div>
	    </div>
	    </c:if>
	  </fieldset>
	</form>
</div>
</body>
</html>