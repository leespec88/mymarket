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
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>상품등록페이지</title>
</head>
<body>

<!-- 이미지 미리보기 -->
<script type="text/javascript">

	 var InputImage1 = 
		(function loadImageFile() {
	    if (window.FileReader) {
	        var ImagePre; 
	        var ImgReader = new window.FileReader();
	        var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 
	        ImgReader.onload = function (Event) {
	            if (!ImagePre) {
	                var newPreview = document.getElementById("imagePreview1");
	                ImagePre = new Image();
	                ImagePre.style.width = "200px";
	                ImagePre.style.height = "140px";
	                newPreview.appendChild(ImagePre);
	            }
	            ImagePre.src = Event.target.result;
	        };
	        return function () {
	        	
	            var img = document.getElementById("image1").files;
	           
	            if (!fileType.test(img[0].type)) { 
	            	alert("이미지 파일을 업로드 하세요"); 
	            	return; 
	            }
	            
	            ImgReader.readAsDataURL(img[0]);
	        }
	    }
	            document.getElementById("imagePreview1").src = document.getElementById("image1").value;
	      
	})();
	var InputImage2 = 
		(function loadImageFile() {
	    if (window.FileReader) {
	        var ImagePre; 
	        var ImgReader = new window.FileReader();
	        var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 
	        ImgReader.onload = function (Event) {
	            if (!ImagePre) {
	                var newPreview = document.getElementById("imagePreview2");
	                ImagePre = new Image();
	                ImagePre.style.width = "200px";
	                ImagePre.style.height = "140px";
	                newPreview.appendChild(ImagePre);
	            }
	            ImagePre.src = Event.target.result;
	        };
	        return function () {
	        	
	            var img = document.getElementById("image2").files;
	           
	            if (!fileType.test(img[0].type)) { 
	            	alert("이미지 파일을 업로드 하세요"); 
	            	return; 
	            }
	            
	            ImgReader.readAsDataURL(img[0]);
	        }
	    }
	            document.getElementById("imagePreview2").src = document.getElementById("image2").value;
	      
	})();
	var InputImage3 = 
		(function loadImageFile() {
	    if (window.FileReader) {
	        var ImagePre; 
	        var ImgReader = new window.FileReader();
	        var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 
	        ImgReader.onload = function (Event) {
	            if (!ImagePre) {
	                var newPreview = document.getElementById("imagePreview3");
	                ImagePre = new Image();
	                ImagePre.style.width = "200px";
	                ImagePre.style.height = "140px";
	                newPreview.appendChild(ImagePre);
	            }
	            ImagePre.src = Event.target.result;
	        };
	        return function () {
	        	
	            var img = document.getElementById("image3").files;
	           
	            if (!fileType.test(img[0].type)) { 
	            	alert("이미지 파일을 업로드 하세요"); 
	            	return; 
	            }
	            
	            ImgReader.readAsDataURL(img[0]);
	        }
	    }
	            document.getElementById("imagePreview3").src = document.getElementById("image3").value;
	      
	})();
	var InputImage4 = 
		(function loadImageFile() {
	    if (window.FileReader) {
	        var ImagePre; 
	        var ImgReader = new window.FileReader();
	        var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 
	        ImgReader.onload = function (Event) {
	            if (!ImagePre) {
	                var newPreview = document.getElementById("imagePreview4");
	                ImagePre = new Image();
	                ImagePre.style.width = "200px";
	                ImagePre.style.height = "140px";
	                newPreview.appendChild(ImagePre);
	            }
	            ImagePre.src = Event.target.result;
	        };
	        return function () {
	        	
	            var img = document.getElementById("image4").files;
	           
	            if (!fileType.test(img[0].type)) { 
	            	alert("이미지 파일을 업로드 하세요"); 
	            	return; 
	            }
	            
	            ImgReader.readAsDataURL(img[0]);
	        }
	    }
	            document.getElementById("imagePreview4").src = document.getElementById("image4").value;
	      
	})();
	var InputImage5 = 
		(function loadImageFile() {
	    if (window.FileReader) {
	        var ImagePre; 
	        var ImgReader = new window.FileReader();
	        var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 
	        ImgReader.onload = function (Event) {
	            if (!ImagePre) {
	                var newPreview = document.getElementById("imagePreview5");
	                ImagePre = new Image();
	                ImagePre.style.width = "200px";
	                ImagePre.style.height = "140px";
	                newPreview.appendChild(ImagePre);
	            }
	            ImagePre.src = Event.target.result;
	        };
	        return function () {
	        	
	            var img = document.getElementById("image5").files;
	           
	            if (!fileType.test(img[0].type)) { 
	            	alert("이미지 파일을 업로드 하세요"); 
	            	return; 
	            }
	            
	            ImgReader.readAsDataURL(img[0]);
	        }
	    }
	            document.getElementById("imagePreview5").src = document.getElementById("image5").value;
	      
	})();
	var InputImage6 = 
		(function loadImageFile() {
	    if (window.FileReader) {
	        var ImagePre; 
	        var ImgReader = new window.FileReader();
	        var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 
	        ImgReader.onload = function (Event) {
	            if (!ImagePre) {
	                var newPreview = document.getElementById("imagePreview6");
	                ImagePre = new Image();
	                ImagePre.style.width = "200px";
	                ImagePre.style.height = "140px";
	                newPreview.appendChild(ImagePre);
	            }
	            ImagePre.src = Event.target.result;
	        };
	        return function () {
	        	
	            var img = document.getElementById("image6").files;
	           
	            if (!fileType.test(img[0].type)) { 
	            	alert("이미지 파일을 업로드 하세요"); 
	            	return; 
	            }
	            
	            ImgReader.readAsDataURL(img[0]);
	        }
	    }
	            document.getElementById("imagePreview6").src = document.getElementById("image6").value;
	      
	})();
	var InputImage7 = 
		(function loadImageFile() {
	    if (window.FileReader) {
	        var ImagePre; 
	        var ImgReader = new window.FileReader();
	        var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 
	        ImgReader.onload = function (Event) {
	            if (!ImagePre) {
	                var newPreview = document.getElementById("imagePreview7");
	                ImagePre = new Image();
	                ImagePre.style.width = "200px";
	                ImagePre.style.height = "140px";
	                newPreview.appendChild(ImagePre);
	            }
	            ImagePre.src = Event.target.result;
	        };
	        return function () {
	        	
	            var img = document.getElementById("image7").files;
	           
	            if (!fileType.test(img[0].type)) { 
	            	alert("이미지 파일을 업로드 하세요"); 
	            	return; 
	            }
	            
	            ImgReader.readAsDataURL(img[0]);
	        }
	    }
	            document.getElementById("imagePreview7").src = document.getElementById("image7").value;
	      
	})();
	var InputImage8 = 
		(function loadImageFile() {
	    if (window.FileReader) {
	        var ImagePre; 
	        var ImgReader = new window.FileReader();
	        var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 
	        ImgReader.onload = function (Event) {
	            if (!ImagePre) {
	                var newPreview = document.getElementById("imagePreview8");
	                ImagePre = new Image();
	                ImagePre.style.width = "200px";
	                ImagePre.style.height = "140px";
	                newPreview.appendChild(ImagePre);
	            }
	            ImagePre.src = Event.target.result;
	        };
	        return function () {
	        	
	            var img = document.getElementById("image8").files;
	           
	            if (!fileType.test(img[0].type)) { 
	            	alert("이미지 파일을 업로드 하세요"); 
	            	return; 
	            }
	            
	            ImgReader.readAsDataURL(img[0]);
	        }
	    }
	            document.getElementById("imagePreview8").src = document.getElementById("image8").value;
	      
	})();
	function imgdel(){
		//alert("aa;");
		for(i=1; i<=count; i++){
			//alert(i);
			document.getElementById("imagePreview"+i).innerHTML = '';
		}
		count=0;
	}
	 
	function imgdelselect(i){
		document.getElementById("imagePreview"+i).innerHTML = '';
		count--;
	}
</script>
<div class="container">
	<h2>상품 등록</h2>
	<form class="form-horizontal" role="form" method="post" action="upload" enctype="multipart/form-data">
		<div class="form-group">
			<label class="control-label col-sm-2" for="email">Email :</label>
			<div class="col-sm-8">
		        <input type="email" class="form-control" name="email" value="${authUser.email }">
		     </div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-2" for="image">이미지 :</label>
			<div class="col-sm-8">
				<input id="image1" type="file" name="file1" onchange="InputImage1();">
				<input id="image2" type="file" name="file2" onchange="InputImage2();">
				<input id="image3" type="file" name="file3" onchange="InputImage3();">
				<input id="image4" type="file" name="file4" onchange="InputImage4();">
				<input id="image5" type="file" name="file5" onchange="InputImage5();">
				<input id="image6" type="file" name="file6" onchange="InputImage6();">
				<input id="image7" type="file" name="file7" onchange="InputImage7();">
				<input id="image8" type="file" name="file8" onchange="InputImage8();">
			</div>
		</div>
		<div id="imagePreview1" onclick="imgdelselect(1)"></div>
		<div id="imagePreview2" onclick="imgdelselect(2)"></div>
		<div id="imagePreview3" onclick="imgdelselect(3)"></div>
		<div id="imagePreview4" onclick="imgdelselect(4)"></div>
		<div id="imagePreview5" onclick="imgdelselect(5)"></div>
		<div id="imagePreview6" onclick="imgdelselect(6)"></div>
		<div id="imagePreview7" onclick="imgdelselect(7)"></div>
		<div id="imagePreview8" onclick="imgdelselect(8)"></div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="price">가격 :</label>
			<div class="col-sm-8">
		        <input type="text" name="price" placeholder="원">
		    </div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="title">제목 :</label>
			<div class="col-sm-8">
		        <input type="text" name="title">
		    </div>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2" for="content">내용 :</label>
			<div class="col-sm-8">
		        <textarea class="form-control" rows="5" id="comment" name="content"></textarea>
		    </div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<label class="radio-inline"><input type="radio" name="tradeCategory" value="판매">판매</label>
				<label class="radio-inline"><input type="radio" name="tradeCategory" value="구매">구매</label>
    		</div>
    	</div>
    	
    	<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<label class="radio-inline"><input type="radio" name="itemCondition" value="중고">중고</label>
				<label class="radio-inline"><input type="radio" name="itemCondition" value="신품">신품</label>
    		</div>
    	</div>
    	
    	<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<label class="radio-inline"><input type="radio" name="shippingFee" value="포함">포함</label>
				<label class="radio-inline"><input type="radio" name="shippingFee" value="미포함">미포함</label>
    		</div>
    	</div>
    	
		<input type="hidden" name="userNo" value="${authUser.no }"><br/>
		<!-- <input type="text" name="email" value="email 히든으로 가져갈꺼임"><br/> -->
		<input type="hidden" name="location" value="${latlng}">
		<input type="hidden" name="address" value="${address}">
		<input type="hidden" name="userName" value="${authUser.name }">
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" value="완료">
				<a href="/"><input type="button"  value="취소"></a><br/>
			</div>
		</div>
		</form>
</div>		
		
			
</body>
</html>