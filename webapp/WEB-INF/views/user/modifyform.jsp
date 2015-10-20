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

/* #dashboard-content{
	padding:20px;
	margin-top:30px;
	width:55%;
} */

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

  .thumb {
    height: 150px;
    width: 150px;
    border: 1px solid #000;
    margin: 0 5px;
  }


/* center 맞추기 */
.maindiv{
    float: right;
    left: -50%;
    position: relative;
    margin:50px 0 80px 0;
}

#dashboard-content{
	float: left;
    position: relative;
    left: 50%;
}
/* center 맞추기 close */
</style>
</head>
<script src="/assets/js/jquery/jquery-1.9.0.js"></script>
<script type="text/javascript">
$(function(){
	$('#modifyform').submit(function(){
		var password = $('#password').val();
		var pwCheck = $('#pwCheck').val();
		
		if(password ==''){
			alert('패스워드를 입력해주세요.');
			return false;
		}
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
	
<div class="maindiv">
	<div id="dashboard-content">
	<form class="form-horizontal" id="modifyform" action="/user/modify" method="post" enctype="multipart/form-data">
			<div class="panel row-space-4">
				<div class="panel-header" >
				프로필사진 수정 
				</div>
				<div class="panel-body" >
					<div class="row row-condensed space-4" style="display:-webkit-box;">
						<output id="list">
						<span>
							<c:choose>
								<c:when test="${not empty authUser.imageURL }">
									<img src="${authUser.imageURL }" class="img-responsive" alt="Cinque Terre" style="width:150px; height:150px; margin:0 10px;">
								</c:when>
								<c:otherwise>
									<img src="/assets/images/person.png" class="img-responsive" alt="Cinque Terre" style="width:150px; height:150px; margin:0 10px;">
								</c:otherwise>
							</c:choose>
						</span>
						</output>
						<div class="profile-p"  >
							<p>잘 나온 얼굴 정면 사진은</p>
							<p> 호스트와 게스트가 서로를 알아가는 데 중요합니다.</p>
							<p> 풍경사진은 좋지 않습니다!</p>
							<p> 반드시 얼굴이 잘 나온 정면사진으로 올리시길 바랍니다.</p>
							<button type="button" onclick="document.getElementById('files').click();"class="btn btn-default" style="margin-top:40px;">사진 업로드</button>
							<input type="file" id="files" name="files[]" style="display:none;"/>
						<script>

						function handleFileSelect(evt) {
							$('span').remove();
							  //$('.thumb').remove();
						  var files = evt.target.files; // FileList object
						  // Loop through the FileList and render image files as thumbnails.
						  var count = 0;
						  for (var i = 0, f; f = files[i]; i++) {
								
						    // Only process image files.
						    if (!f.type.match('image.*')) {
						      continue;
						    }

						    var reader = new FileReader();

						    // Closure to capture the file information.
						    reader.onload = (function(theFile) {
						      return function(e) {
						        // Render thumbnail.
						        var span = document.createElement('span');
						        count++;
						        span.innerHTML = ['<img class="thumb" id="image' + count + '" src="', e.target.result,
						                          '" title="', escape(theFile.name), '"/>'].join('');
						        document.getElementById('list').insertBefore(span, null);
						      };
						    })(f);

						    // Read in the image file as a data URL.
						    reader.readAsDataURL(f);
						  }
						}
						document.getElementById('files').addEventListener('change', handleFileSelect, false);


						</script>
						</div>
					</div>
				</div>
			</div>
			
			<div class="panel row-space-4">
				<div class="panel-header">
				필 수 사 항
				</div>
				
				<div class="panel-body">
					
					<div class="row row-condensed space-4">
						<label for="inputName" class="text-right col-sm-3" for="name">이름</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="name" name="name" value="${authUser.name }">
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
							</c:otherwise>
						</c:choose>
							
						</div>
					</div>
					
					<div class="row row-condensed space-4">
						<label class="text-right col-sm-3" for="phone">휴대전화</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="phone" name="phone" value="${authUser.phone }" placeholder="'-' 빼주세요">
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
			
			<div class="panel row-space-4">
			<p style="margin-bottom:20px;">※ 아래에 비밀번호를 입력하셔야 수정이 가능합니다. 비밀번호를 변경하시려면 변경된 비밀번호를 입력해주세요.</p>
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
			<button type="submit" class="btn btn-danger btn-large modifyBtn">저장하기</button>
		</form>
	</div>
</div>

<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>