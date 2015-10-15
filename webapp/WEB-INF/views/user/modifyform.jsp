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
<style>
.col-md-9{
	position: relative;
    min-height: 1px;
    padding-left: 12.5px;
    padding-right: 12.5px;
    box-sizing: border-box;
}

#dashboard-content{
	padding:20px;
	margin-top:30px;
	width:55%;
}

div.panel{
    background-color: #fff;
    border-radius: 0;
    margin-top:50px;
}

div.panel-header {
	margin:0;
	margin-top:0;
	color: #565a5c;
    font-size: 16px;
    font-weight:bold;
   	padding:20px;
    border: 1px solid #dce0e0;
    background-color: #edefed;
}

div.panel-body {
	border: 1px solid #dce0e0;
	margin:0;
}

.col-sm-3{
	font-weight:bold;
	width:25%;
	height:40px;
	float:left;
	padding-top:11px;
	padding-left: 6.25px;
    padding-right: 6.25px;
}

.col-sm-9{
	width:75%;
	float:left;
	padding-left: 6.25px;
    padding-right: 6.25px;
}

div.space-4{
	margin-top:30px;
	margin-bottom:20px;
}

div.birth{
	display:inline-block;
}

button.modifyBtn{
	font-size:15px;
	font-weight:bold;
	width:120px;
	height:42px;
	border-radius:0;
	margin-top:50px;
}

.text-muted {
	margin-top:5px;
}
</style>
</head>
<script src="/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
$(function(){
	$('#modifyform').submit(function(){
		var password = $('#password').val();
		var pwCheck = $('#pwCheck').val();
		
		if(password != pwCheck){
			alert('패스워드가 일치하지 않습니다.');
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
<body class="modifyform" >
	
<div class="col-md-9">
	<div id="dashboard-content">
	<form class="form-horizontal" id="modifyform" action="/user/modify" method="post">
			<!-- <div class="panel row-space-4">
				<div class="panel-header" >
				프로필사진 수정 
				</div>
				
				<div class="panel-body">
					<div class="row row-condensed space-4">
						<img src="/assets/images/person.png" class="img-responsive" alt="Cinque Terre">
						<div class="col-sm-9">
							<button type="button" class="btn btn-default">파일 업로드하기</button>
							<input type="hidden" class="form-control" id="imageURL" name="imageURL" >
						</div>
					</div>
				</div>
				pannel body 끝
			</div> -->
			
			<div class="panel row-space-4">
				<div class="panel-header">
				필 수 사 항
				</div>
				
				<div class="panel-body">
					
					<div class="row row-condensed space-4">
						<label for="inputName" class="text-right col-sm-3" for="name">이름</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="name" name="name" value="${authUser.name }">
							<div class="text-muted row-space-top-1">이 자료는 다른 회원들에게 절대 공개되지 않습니다.</div>
						</div>
					</div>
					
					<div class="row row-condensed space-4">
						<label class="text-right col-sm-3" for="email">EMAIL</label>
						<div class="col-sm-9">
						<c:choose>
							<c:when test="${authUser.email!='null' }">
								<input type="text" class="form-control" id="email" name="email" value="${authUser.email }" readonly="readonly" >
								<div class="text-muted row-space-top-1">이 자료는 다른 회원들에게 절대 공개되지 않습니다.</div>
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" id="email" name="email" placeholder="@Email" readonly="readonly">
								<div class="text-muted row-space-top-1">이 자료는 다른 회원들에게 절대 공개되지 않습니다.</div>
							</c:otherwise>
						</c:choose>
							
						</div>
					</div>
					
					<div class="row row-condensed space-4">
						<label class="text-right col-sm-3" for="phone">휴대전화</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="phone" name="phone" value="${authUser.phone }" placeholder="'-' 빼주세요">
							<div class="text-muted row-space-top-1">이 자료는 다른 회원들에게 절대 공개되지 않습니다.</div>
						</div>
					</div>
					
					<div class="row row-condensed space-4">
						<label class="text-right col-sm-3" for="gender">성 별</label>
						<div class="col-sm-9" id="genderForm">
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
							<div class="text-muted row-space-top-1">이 정보는 통계 목적으로 사용되며 다른 회원들에게 절대 공개되지 않습니다.</div>
						</div>
					</div>
					
					<div class="row row-condensed space-4">
						<label class="text-right col-sm-3" for="birth">생년월일</label>
						<div class="col-sm-9">
							<div class="select birth">
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
							</div>
							
							<div class="select birth">
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
							</div>
							
							<div class="select birth">
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
							</div>
							<div class="text-muted row-space-top-1">이 정보는 통계 목적으로 사용되며 다른 회원들에게 절대 공개되지 않습니다.</div>
						</div>
					</div>
				</div>
				<!-- pannel body 끝 -->
			</div>
			<c:if test="${authUser.idNo eq '' }">
			<div class="panel row-space-4">
				<div class="panel-header" >
				비 밀 번 호 <span class="glyphicon glyphicon-lock"></span>
				</div>
				
				<div class="panel-body">
					<div class="row row-condensed space-4">
						<label class="text-right col-sm-3" for="password">패스워드</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" id="password" name="password" >
						</div>
					</div>
					<div class="row row-condensed space-4">
						<label class="text-right col-sm-3" for="password">패스워드확인</label>
						<div class="col-sm-9">
							<input type="password" class="form-control" id="pwCheck" name="pwCheck" >
						</div>
					</div>
				</div>
				<!-- pannel body 끝 -->
			</div>
			</c:if>
			<button type="submit" class="btn btn-danger btn-large modifyBtn">저장하기</button>
		</form>
	</div>
</div>
		<%--
		<div class="form-group" >
	      <div class="col-lg-8 col-lg-offset-2">
	        <a href="/"  class="btn btn-default modifyA">취소</a>
	        <input type="submit" class="btn btn-danger btn-submit" value="저장하기">
	      </div>
	    </div>
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
</div> --%>


<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>