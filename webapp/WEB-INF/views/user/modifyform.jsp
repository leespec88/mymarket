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
	
	$('#month').change(function(){
		var month = $('#month').val();
		var days = null;
		if(month=='2'){
			days+="<c:forEach var='i' begin='1' end='28' step='1'>";
			days+="<option value='${i }'>${i }일</option></c:forEach>";
		}else if(month=='4' || month=='6' || month=='9' || month=='11'){
			days+="<c:forEach var='i' begin='1' end='30' step='1'>";
			days+="<option value='${i }'>${i }일</option></c:forEach>";
		}else{
			days+="<c:forEach var='i' begin='1' end='31' step='1'>";
			days+="<option value='${i }'>${i }일</option></c:forEach>";
		}
		$('#day').html(days);
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
		<form class="form-horizontal" id="modifyform" action="/user/modify"
			method="post">
			<fieldset>
				<div class="form-group">
					<h2 class="text-center" style="margin-bottom: 30px;">회원정보수정</h2>
				</div>
				<div class="form-group">
					<label for="inputName" class="col-lg-2 control-label">이름</label>
					<div class="col-lg-8">
						<input type="text" class="form-control" id="name" name="name"
							value="${authUser.name }" readonly="readonly">
					</div>
				</div>
				<div class="form-group">
					<label for="inputEmail" class="col-lg-2 control-label">이메일ID</label>
					<span class="col-lg-8"> <c:choose>
							<c:when test="${authUser.email!='null' }">
								<input type="text" class="form-control" id="email" name="email"
									value="${authUser.email }" readonly="readonly">
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" id="email" name="email"
									placeholder="Email" readonly="readonly">
							</c:otherwise>
						</c:choose>
					</span>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">전화번호</label>
					<div class="col-lg-8">
						<input type="text" class="form-control" id="" name="phone"
							value="${authUser.phone }" placeholder="Phone Number">
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">성별</label>
					<div class="col-lg-8" id="genderForm">
						<select class="form-control" id="" name="gender">
								<c:choose>
									<c:when test="${authUser.gender eq 'male' }">
										<option value='male' selected="selected">남 자</option>
										<option value='female'>여 자</option>
									</c:when>
									<c:when test="${authUser.gender eq 'female' }">
										<option value='male'>남 자</option>
										<option value='female' selected="selected">여 자</option>
									</c:when>
									<c:otherwise>
										<option value=''>선 택</option>
										<option value='male'>남 자</option>
										<option value='female'>여 자</option>
									</c:otherwise>
								</c:choose>
								
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">생년월일</label>
					<div class="col-lg-8" id="">
						<span class="select"> 
							
							<select class="form-control" name="year">
									<c:forEach var="i" begin="1931" end="1997" step="1" >
										<c:choose>
										<c:when test="${year==i }">
											<option value="${year }" selected="selected">${year }년</option>
										</c:when>
										<c:otherwise>
											<option value="${i }">${i }년</option>
										</c:otherwise>
										</c:choose>
									</c:forEach>
							</select> 
							</span>
							<span class="select"> 
							<select class="form-control" name="month" id="month">
									<c:forEach var="i" begin="1" end="12" step="1" >
										<c:choose>
										<c:when test="${month==i }">
											<option value="${month }" selected="selected">${month }월</option>
										</c:when>
										<c:otherwise>
											<option value="${i }">${i }월</option>
										</c:otherwise>
										</c:choose>
									</c:forEach>
							</select> 
							</span>
							<span class="select"> 
							<select class="form-control" name="day" id="day">
									<c:forEach var="i" begin="1" end="31" step="1" >
										<c:choose>
										<c:when test="${day==i }">
											<option value="${day }" selected="selected">${day }일</option>
										</c:when>
										<c:otherwise>
											<option value="${i }">${i }일</option>
										</c:otherwise>
										</c:choose>
									</c:forEach>
							</select>
							</span>
					</div>
				</div>

		<div class="form-group" >
	      <div class="col-lg-8 col-lg-offset-2">
	        <a href="/"  class="btn btn-default modifyA">취소</a>
	        <input type="submit" class="btn btn-danger btn-submit" value="저장하기">
	      </div>
	    </div>
	  </fieldset>
	</form>
	<br><br><br><br><br><br><br><br>
	
	<c:if test="${empty authUser.idNo }">
	<div><h2 class="text-center" style="margin-bottom: 30px;">패스워드수정</h2></div>
	<form class="form-horizontal" id="passwordModify" action="/user/pwModify" method="post">
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
	    
	    <div class="form-group">
	      <div class="col-lg-8 col-lg-offset-2">
	        <a href="/"  class="btn btn-default modifyA">취소</a>
	        <input type="submit" class="btn btn-danger btn-submit" value="수정하기">
	      </div>
	    </div>
	</form>
	</c:if>
</div>


<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>