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
						<select class="form-control" id="">
							<option>성별</option>
							<option value='male'>남 자</option>
							<option value='femail'>여 자</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-2 control-label">생년월일</label>
					<div class="col-lg-8" id="">
						<span class="select"> 
							
							<select class="form-control" name="year">
									<option value="1997">1997년</option>
									<option value="1996">1996년</option>
									<option value="1995">1995년</option>
									<option value="1994">1994년</option>
									<option value="1993">1993년</option>
									<option value="1992">1992년</option>
									<option value="1991">1991년</option>
									<option value="1990">1990년</option>
									<option value="1989">1989년</option>
									<option value="1988">1988년</option>
									<option value="1987">1987년</option>
									<option value="1986">1986년</option>
									<option value="1985">1985년</option>
									<option value="1984">1984년</option>
									<option value="1983">1983년</option>
									<option value="1982">1982년</option>
									<option value="1981">1981년</option>
									<option value="1980">1980년</option>
									<option value="1979">1979년</option>
									<option value="1978">1978년</option>
									<option value="1977">1977년</option>
									<option value="1976">1976년</option>
									<option value="1975">1975년</option>
									<option value="1974">1974년</option>
									<option value="1973">1973년</option>
									<option value="1972">1972년</option>
									<option value="1971">1971년</option>
									<option value="1970">1970년</option>
									<option value="1969">1969년</option>
									<option value="1968">1968년</option>
									<option value="1967">1967년</option>
									<option value="1966">1966년</option>
									<option value="1965">1965년</option>
									<option value="1964">1964년</option>
									<option value="1963">1963년</option>
									<option value="1962">1962년</option>
									<option value="1961">1961년</option>
									<option value="1960">1960년</option>
									<option value="1959">1959년</option>
									<option value="1958">1958년</option>
									<option value="1957">1957년</option>
									<option value="1956">1956년</option>
									<option value="1955">1955년</option>
									<option value="1954">1954년</option>
									<option value="1953">1953년</option>
									<option value="1952">1952년</option>
									<option value="1951">1951년</option>
									<option value="1950">1950년</option>
									<option value="1949">1949년</option>
									<option value="1948">1948년</option>
									<option value="1947">1947년</option>
									<option value="1946">1946년</option>
									<option value="1945">1945년</option>
									<option value="1944">1944년</option>
									<option value="1943">1943년</option>
									<option value="1942">1942년</option>
									<option value="1941">1941년</option>
									<option value="1940">1940년</option>
									<option value="1939">1939년</option>
									<option value="1938">1938년</option>
									<option value="1937">1937년</option>
									<option value="1936">1936년</option>
									<option value="1935">1935년</option>
									<option value="1934">1934년</option>
									<option value="1933">1933년</option>
									<option value="1932">1932년</option>
									<option value="1931">1931년</option>
									<option value="1930">1930년</option>
									<option value="1929">1929년</option>
									<option value="1928">1928년</option>
									<option value="1927">1927년</option>
									<option value="1926">1926년</option>
									<option value="1925">1925년</option>
									<option value="1924">1924년</option>
									<option value="1923">1923년</option>
									<option value="1922">1922년</option>
									<option value="1921">1921년</option>
									<option value="1920">1920년</option>
									<option value="1919">1919년</option>
									<option value="1918">1918년</option>
									<option value="1917">1917년</option>
									<option value="1916">1916년</option>
									<option value="1915">1915년</option>
							</select> 
							</span>
							<span class="select"> 
							<select class="form-control" name="month">
									<option value="1">1월</option>
									<option value="2">2월</option>
									<option value="3">3월</option>
									<option value="4">4월</option>
									<option value="5">5월</option>
									<option value="6">6월</option>
									<option value="7">7월</option>
									<option value="8">8월</option>
									<option value="9">9월</option>
									<option value="10">10월</option>
									<option value="11">11월</option>
									<option value="12">12월</option>
							</select> 
							</span>
							<span class="select"> 
							<select class="form-control" name="day">
									<option value="1">1일</option>
									<option value="2">2일</option>
									<option value="3">3일</option>
									<option value="4">4일</option>
									<option value="5">5일</option>
									<option value="6">6일</option>
									<option value="7">7일</option>
									<option value="8">8일</option>
									<option value="9">9일</option>
									<option value="10">10일</option>
									<option value="11">11일</option>
									<option value="12">12일</option>
									<option value="13">13일</option>
									<option value="14">14일</option>
									<option value="15">15일</option>
									<option value="16">16일</option>
									<option value="17">17일</option>
									<option value="18">18일</option>
									<option value="19">19일</option>
									<option value="20">20일</option>
									<option value="21">21일</option>
									<option value="22">22일</option>
									<option value="23">23일</option>
									<option value="24">24일</option>
									<option value="25">25일</option>
									<option value="26">26일</option>
									<option value="27">27일</option>
									<option value="28">28일</option>
									<option value="29">29일</option>
									<option value="30">30일</option>
									<option value="31">31일</option>
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


<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>