<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Upload completed</h1>

	<div class="result-images">
		<input type="text" value="${productImageUrl1 }" width="300px">
		<c:if test="${not empty productImageUrl1 }">
			<img src="/mymarket/${productImageUrl1 }" style="width:150px"><br>
		</c:if>
		
		<c:if test="${not empty productImageUrl2 }">
			<img src="/mymarket/${productImageUrl2 }" style="width:150px"><br>
		</c:if>
		
		<c:if test="${not empty productImageUrl3 }">
			<img src="/mymarket/${productImageUrl3 }" style="width:150px"><br>
		</c:if>
		
	</div>

	<p>
		<a href='/map/form'> 다시 업로드 하기 </a>
	</p>
	
</body>
</html>