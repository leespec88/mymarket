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
<title>메세지</title>
</head>
<style>
	body {background-color: #d4e3e8;}
	input[type='text'] { height: 50px }	
	
</style>
<body>

	<div id="title" style="background-color: white; padding: 15px;">
	<h2>대 화 목 록</h2>
	</div>
	<c:forEach var="msgList" items="${msgList }" varStatus="status">
		<div style="padding:5px; font-size:14px;"><p>${msgList.message }<p></div>
	</c:forEach>

</body>
</html>