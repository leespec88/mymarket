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
<body class="loginform">
<div class="container">
	<form class="form-horizontal" action="/user/login" method="post">
	  <fieldset>
	    <legend>로그인</legend>
	    <div class="form-group">
	      <label for="inputEmail" class="col-lg-2 control-label">이메일ID</label>
	      <div class="col-lg-10">
	        <input type="text" class="form-control" id="inputEmail" name="email"  placeholder="Email">
	      </div>
	    </div>
	    <div class="form-group">
	      <label for="inputPassword" class="col-lg-2 control-label">비밀번호</label>
	      <div class="col-lg-10">
	        <input type="password" class="form-control" id="inputPassword" name="password" placeholder="Password">
	      </div>
	    </div>
	    <div class="form-group">
	      <div class="col-lg-10 col-lg-offset-2">
	        <a href="/"><input type="button" class="btn btn-default" value="취소"/></a>
	        <input type="submit" class="btn btn-primary btn-submit" value="확인" >
	      </div>
	    </div>
	  </fieldset>
	</form>
</div>
</body>
</html>