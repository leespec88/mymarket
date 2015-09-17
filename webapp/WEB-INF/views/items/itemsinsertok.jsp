<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
등록완료

<form action="/" method="post" >
<input type="hidden" id="lat" name="lat" value="">
<input type="hidden" id="lng" name="lng" value="">


<div class="result-images">
		<c:if test="${not empty productImageUrl1 }">
			<img src="${productImageUrl1 }" style="width:150px">
		</c:if>
		
		<c:if test="${not empty productImageUrl2 }">
			<img src="${productImageUrl2 }" style="width:150px">
		</c:if>
		
		<c:if test="${not empty productImageUrl3 }">
			<img src="${productImageUrl3 }" style="width:150px"><br>
		</c:if>
		<c:if test="${not empty productImageUrl4 }">
			<img src="${productImageUrl4 }" style="width:150px">
		</c:if>
		
		<c:if test="${not empty productImageUrl5 }">
			<img src="${productImageUrl5 }" style="width:150px">
		</c:if>
		
		<c:if test="${not empty productImageUrl6 }">
			<img src="${productImageUrl6 }" style="width:150px"><br>
		</c:if>
		<c:if test="${not empty productImageUrl7 }">
			<img src="${productImageUrl7 }" style="width:150px">
		</c:if>
		
		<c:if test="${not empty productImageUrl8 }">
			<img src="${productImageUrl8 }" style="width:150px">
		</c:if>
		
		
</div>
타이틀 : ${itemsVo.title}<br>
내용 : ${itemsVo.content}<br>
신품/중고 : ${itemsVo.tradeCategory}<br>
판매/구매 : ${itemsVo.itemCondition}<br>
가격 : ${itemsVo.price}<br>
좌표 : ${itemsVo.location}<br>
이메일 : ${itemsVo.email}<br>
택배비 : ${itemsVo.shippingFee}<br>
viewCount : ${itemsVo.viewCount}<br>
address : ${itemsVo.address}<br>
	
<%-- <input type="text" name="location" value="${productImageUrl1 }">
<input type="text" name="location" value="${productImageUrl2 }">
<input type="text" name="location" value="${productImageUrl3 }"> --%>
<input type="submit"  value="메인으로"><br/>
</form>

</body>
</html>