<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="fn"%>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  
  <script src="http://code.jquery.com/jquery-2.1.0.js"></script>
  <script type="text/javascript" src="https://rawgit.com/fyneworks/multifile/2.1.0-preview/jquery.MultiFile.js"></script>
<style>
  .thumb {
    height: 75px;
    border: 1px solid #000;
    margin: 10px 5px 0 0;
  }

body{
	color: #A6A6A7;
	height: 850px;
}


</style>
  
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  
<title>상품등록페이지</title>
</head>
<body>

<div class="container">
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<h2 class="text-center" style="padding-top:60px">상품 등록</h2>
	<form id="frm" class="form-horizontal" role="form" method="post" action="upload" enctype="multipart/form-data">
		<div class="form-group">
			<label class="control-label col-sm-2" for="email">Email :</label>
			<div class="col-sm-8">
		        <input type="email" class="form-control" name="email" value="${authUser.email }">
		     </div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="image">이미지 :</label>
			<div class="col-sm-8">

<!-- 멀티파일 시도중 -->
   <input type="file" id="files" name="files[]" multiple maxlength="8"/>
<output id="list"></output>

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
<!-- 멀티파일 시도중 close-->
				
			</div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="price">가격 :</label>
			<div class="col-sm-8">
		        <input class="form-control" type="text" name="price" id="price" placeholder="원">
		    </div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="title">제목 :</label>
			<div class="col-sm-8">
		        <input class="form-control" type="text" id="title" name="title">
		    </div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="content">내용 :</label>
			<div class="col-sm-8">
		        <textarea class="form-control" rows="5" id="content" name="content"></textarea>
		    </div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<label class="radio-inline"><input type="radio" name="tradeCategory" value="판매" checked="checked">판매</label>
				<label class="radio-inline"><input type="radio" name="tradeCategory" value="구매">구매</label>
    		</div>
    	</div>
    	
    	<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<label class="radio-inline"><input type="radio" name="itemCondition" value="중고" checked="checked">중고</label>
				<label class="radio-inline"><input type="radio" name="itemCondition" value="신품">신품</label>
    		</div>
    	</div>
    	
    	<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<label class="radio-inline"><input type="radio" name="shippingFee" value="포함">포함</label>
				<label class="radio-inline"><input type="radio" name="shippingFee" value="미포함" checked="checked">미포함</label>
    		</div>
    	</div>
    	
		<input type="hidden" name="userNo" value="${authUser.no }"><br/>
		<!-- <input type="text" name="email" value="email 히든으로 가져갈꺼임"><br/> -->
		<input type="hidden" name="location" value="${latlng}">
		<input type="hidden" name="address" value="${address}">
		<input type="hidden" name="userName" value="${authUser.name }">
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" value="완료" id="btn" class="btn default-btn" onclick="deletecomma()">
				<a href="/"><input class="btn default-btn" type="button" value="취소"></a><br/>
			</div>
		</div>
		</form>
</div>
<script type="text/javascript">
$(function(){
	$('#frm').submit(function(){
		var $files = $('#files');
		var files=$files.val();
		if(files==""){
			alert("최소 1개 파일이 있어야합니다..");
			$files.focus();
			return false;
		}
		var $price = $('#price');
		var price=$price.val();
		if(price==""){
			alert("가격 비어있습니다. 필수입력 사항입니다.");
			$price.focus();
			return false;
		}
		var $title = $('#title');
		var title=$title.val();
		if(title==""){
			alert("제목 비어있습니다. 필수입력 사항입니다.");
			$title.focus();
			return false;
		}
		var $content = $('#content');
		var content=$content.val();
		if(content==""){
			alert("내용 비어있습니다. 필수입력 사항입니다.");
			$content.focus();
			return false;
		}
	})
	}
);
		
</script>	
<script>
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
</script>		
			
</body>
</html>