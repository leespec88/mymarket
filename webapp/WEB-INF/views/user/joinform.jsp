<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="/assets/css/main.css" type="text/css">
</head>
<style type="text/css">
	 
</style>
<script src="/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
$(function(){
	$('#joinform').submit(function(){
		var $name = $('#name');
		var name=$name.val();
		if(name==""){
			alert("이름이 비어있습니다. 필수입력 사항입니다.");
			$name.focus();
			return false;
		}
		
		var $email = $("#email");
		var email = $email.val();
		if(email==""){
			alert("이메일이 비어있습니다. 필수입력 사항입니다.");
			$email.focus();
			return false;
		}
		
		var re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	   	
		if(re.test(email)==false){
	   		alert("유효한 이메일 형식이 아닙니다.");
			$email.focus();
			return false;
	   	}
	   	//이메일 중복 체크
	 
	   	
		//3. 패스워드
		var $password = $("input[type='password']");
		var password = $password.val();
		var $pwCheck = $('pwCheck');
		var pwCheck = $pwCheck.val();
		if(password==""){
			alert("패스워드가 비어있습니다. 필수입력 사항입니다.");
			$password.focus();
			return false;
		}else if(!password.equals(pwCheck)){
			alert("패스워드가 일치해야 합니다.");
			$pwcheck.focus();
			return false;
		}
		
	});
	
	

});

function joinCheck(){
	var email=$('#email').val();
	console.log(email);
 	$.ajax({
		url:'/user/checkEmail',
		type:'post',
		dataType:'json',
		data:{'email':email},
		success:function(result){
			if(result)
				alert("사용불가");
			else
				alert("사용가능");
		}
	});
};
</script>
<body class="joinform">
<div class="container">
	<form class="form-horizontal" id="joinform" action="/user/join" method="post">
	  <fieldset>
	    <legend>회원가입</legend>
	    <div class="form-group">
	      <label for="inputName" class="col-lg-2 control-label">이름</label>
	      	<div class="col-lg-8">
	        	<input type="text" class="form-control" id="name" name="name" placeholder="Name">
	     	</div>
	     </div>
	    <div class="form-group">
	      <label for="inputEmail" class="col-lg-2 control-label">이메일ID</label>
	      <span class="col-lg-8">
	        <input type="text" class="form-control" id="email" name="email" placeholder="Email">
	      </span>
	      	<input type="button" class="btn btn-warning" onclick="joinCheck();" value="중복확인" >
	    </div>
	    <div class="form-group">
	      <label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
	      <div class="col-lg-8">
	        <input type="password" class="form-control" id="password" name="password" placeholder="Password">
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="confirmPassword" class="col-lg-2 control-label">비밀번호확인</label>
	      <div class="col-lg-8">
	        <input type="password" class="form-control" id="pwCheck" name="pwCheck" placeholder="Password">
	      </div>
	      <div id="message"></div>
	    </div>
	    <div class="form-group">
	      <div class="col-lg-8 col-lg-offset-2">
	        <a href="/"><input type="button" class="btn btn-default" value="취소"/></a>
	        <input type="submit" class="btn btn-primary btn-submit">
	      </div>
	    </div>
	  </fieldset>
	</form>
</div>
</body>
</html>