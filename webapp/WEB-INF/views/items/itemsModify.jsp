<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>상품등록페이지</title>
<%@ include file="/WEB-INF/views/include/include-header.jspf"%>
<style type="text/css">
.backgroundImg {
    background-image: /*@background-image*/url("./images/Background.jpg")/*@*/;
    background-color: /*@background-color*/#eee/*@*/;
    background-size: cover;
    background-repeat: /*@background-image-repeat=*/no-repeat/*@*/;
    background-position: /*@background-image-position*/center/*@*/;
}
textarea {
	resize:none;
}
</style>
</head>
<body>

	<!-- 이미지 미리보기 -->
	<script type="text/javascript">
	</script>
	<div class="container backgroundImg">
		<h2>아이템 수정</h2>
		<%@ include file="/WEB-INF/views/include/include-body.jspf"%>
		<form id="frm" name="frm" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label class="control-label col-sm-2" for="email">Email :</label>
				<div class="col-sm-8">
					<input type="email" class="form-control" name="email"
						value="${itemVo.email }">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="image">이미지 :</label>
				<div class="col-sm-8">
					<input id="image1" type="file" name="file1"
						onchange="InputImage1();"> <input id="image2" type="file"
						name="file2" onchange="InputImage2();"> <input id="image3"
						type="file" name="file3" onchange="InputImage3();"> <input
						id="image4" type="file" name="file4" onchange="InputImage4();">
					<input id="image5" type="file" name="file5"
						onchange="InputImage5();"> <input id="image6" type="file"
						name="file6" onchange="InputImage6();"> <input id="image7"
						type="file" name="file7" onchange="InputImage7();"> <input
						id="image8" type="file" name="file8" onchange="InputImage8();">
				</div>
			</div>
			<div id="fileDiv">
				<c:forEach var="file" items="${fileList }" varStatus="var">
					<p>
						<input type="hidden" class="fileNo" value="${file.NO_ITEM_PIC }"> 
						<img src="${file.IMAGE}" width="100px" height="100px"> 
						<button class="delFile" name="delete_${var.index }" value="${file.NO_ITEM_PIC}">삭제</button>
					</p>
				</c:forEach>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="title">제목 :</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="title" value="${itemVo.title}" size="62">
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-sm-2" for="content">내용 :</label>
				<div class="col-sm-8">
					<textarea class="form-control" rows="5" id="comment" name="content">${itemVo.content }</textarea>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-2" for="price">가격 :</label>
				<div class="col-sm-8">
					<input type="text" id="price" class="form-control" name="price" value="" onfocus="javascript:deletecomma('${itemVo.price}')"
						placeholder="원">
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<label class="radio-inline"><input type="radio"
						name="tradeCategory" value="판매">판매</label> <label
						class="radio-inline"><input type="radio"
						name="tradeCategory" value="구매">구매</label>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<label class="radio-inline"><input type="radio"
						name="itemCondition" value="중고">중고</label> <label
						class="radio-inline"><input type="radio"
						name="itemCondition" value="신품">신품</label>
				</div>
			</div>

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<label class="radio-inline"><input type="radio" name="shippingFee" value="포함">포함</label> 
					<label class="radio-inline"><input type="radio" name="shippingFee" value="미포함">미포함</label>
				</div>
			</div>
			<input type="hidden" id="itemNo" name="itemNo" value="${itemVo.no }"><br />
			<input type="hidden" name="no" value="${itemVo.no}"><br />
			<input type="hidden" name="userNo" value="${authUser.no }"><br />
			<!-- <input type="text" name="email" value="email 히든으로 가져갈꺼임"><br/> -->
			<input type="hidden" name="location" value="${itemVo.location}"> 
			<input type="hidden" name="address" value="${itemVo.address}"> 
			<input type="hidden" name="userName" value="${userVo.name }">
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<a href="#this" class="btn btn-default" id="update">수정</a> 
					<a href="/" class="btn btn-default">취소</a>
					<br/>
				</div>
			</div>
		</form>
	</div>
<script type="text/javascript">
$(document).ready(function() {
	/* $('#price').val().replace(/ /g, '');
	$('#price').val().replace(/,/g, '');  */
	
	var before = ${itemVo.price};
	var input = Number(before).toLocaleString('en');
	$('#price').val(input);
	
	$(".delFile").on("click", function(e) {
		e.preventDefault();
		fn_deleteFile($(this));
	});
	$('input:radio[name=tradeCategory]:input[value='+"${itemVo.tradeCategory}"+']').attr("checked", true);
	$('input:radio[name=itemCondition]:input[value='+"${itemVo.itemCondition}"+']').attr("checked", true);
	$('input:radio[name=shippingFee]:input[value='+"${itemVo.shippingFee}"+']').attr("checked", true);
	
	$("#update").on("click", function(e) { //저장하기 버튼
		e.preventDefault();
		fn_updateBoard();
	});
	$("a[name^='delete']").on("click", function(e) { //삭제 버튼
		e.preventDefault();
		alert("!!")
		fn_emdeleteFile($(this));
	});
});

//포커스 잃었을때 실행됨.
$('#price').blur(function() {
	/* 콤마 천단위 세팅 */
	var n = $('#price').val();
	var input = Number(n).toLocaleString('en');
	$('#price').val(input);
});


function deletecomma(){
	var n =$('#price').val();
	n = parseInt(n.replace(/,/g,""));
	$('#price').val(n);
	
}
function fn_updateBoard() {
	var comSubmit = new ComSubmit("frm");
	deletecomma();
	comSubmit.setUrl("<c:url value='/items/updateItems' />");
	comSubmit.submit();
}
function fn_addFile() {
	var str = "<p><input type='file' name='file_" + (gfv_count++)
			+ "'><a href='#this' class='btn' id='delete_" + (gfv_count)
			+ "' name='delete_" + (gfv_count) + "'>삭제</a></p>";
	$("#fileDiv").append(str);
	$("#delete_" + (gfv_count++)).on("click", function(e) { //삭제 버튼
		e.preventDefault();
		fn_emdeleteFile($(this));
	});
}
function fn_emdeleteFile(obj) {
	obj.parent().remove();
}
function fn_deleteFile(obj) {
	var comSubmit = new ComSubmit();
	comSubmit.setUrl("<c:url value='/items/deleteFile' />");
	comSubmit.addParam("fileNo", obj.val());
	comSubmit.addParam("no", $('#itemNo').val());
	comSubmit.submit();
}
</script>
<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>