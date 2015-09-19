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







<%-- <SCRIPT LANGUAGE="JavaScript">

   function fileCheck(obj) {
	   alert("a" + obj);
     document.getElementById('update_image_view').innerHTML = "<img src='" + obj + "'>";
   }
</SCRIPT>  
<input type="file" name="file" onchange="fileCheck(this.value);">
<input type="file" name="file1" onchange="fileCheck('${productImageUrl1}');">
<input type="file" name="file2" onchange="fileCheck('${productImageUrl2}');">
<input type="file" name="file3" onchange="fileCheck('${productImageUrl3}');">

<table>
 <tr>
  <td align="center" id='update_image_view'>
   미리보기
  </td>
 </tr>
</table> --%>

상품등록<br/>
이미지 등록<br/>
<h1>파일 업로드 예제</h1>
<form method="post" action="upload" enctype="multipart/form-data">
<!-- 이미지 미리보기 -->
<script type="text/javascript">
/* var count = 0;
var InputImage = 
	(function loadImageFile() {
    if (window.FileReader) {
    	
        var ImagePre; 
        var ImgReader = new window.FileReader();
        var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i; 

        ImgReader.onload = function (Event) {
            //count++;
            if (!ImagePre) {
                var newPreview = document.getElementById("imagePreview"+count);
                ImagePre = new Image();
                ImagePre.style.width = "200px";
                ImagePre.style.height = "140px";
                newPreview.appendChild(ImagePre);
            alert("if : " + count);
            }else{
            	var newPreview = document.getElementById("imagePreview"+count);
                ImagePre = new Image();
                ImagePre.style.width = "200px";
                ImagePre.style.height = "140px";
                newPreview.appendChild(ImagePre);
            alert("else : " + count);
            }
            ImagePre.src = Event.target.result;
        };

        return function () {
        	count++;
        	alert("return" + count);
            var img = document.getElementById("image"+count).files;
            if (!fileType.test(img[0].type)) { 
            	alert("이미지 파일을 업로드 하세요"); 
            	return; 
            }
            
            ImgReader.readAsDataURL(img[0]);
        }
        alert("bb" + count);
    }
      alert("aa" + count);
            document.getElementById("imagePreview"+count).src = document.getElementById("image"+count).value;
})();
 */











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

<label>email:</label>
	<input type="text" name="email" value="${authUser.email }">
	<br><br>
	
		<c:forEach var="vo" varStatus="status"  begin="0" end="2" step="1">
			<%-- <input type="text" id="vo" value="${status.count}">
			<input type="text" id="no${status.index+1 }" value="${status.index+1 }">
			<input type="text" id="location${status.index+1 }" value="${status.index+1 }">
			<input type="text" id="address${status.index+1 }" value="${status.index+1 }"> --%>
			<%-- <div id="imagePreview${status.index+1 }"> --%>
			<%-- <input id="image${status.index+1 }" type="file" name="file${status.index+1 }" onchange="InputImage${status.index+1 }();"> --%>
			<!-- </div> -->
		</c:forEach>


<!-- <div id="imagePreview"></div><br> -->
<%-- <input id="image${status.index+1 }" type="file" name="file${status.index+1 }" onchange="InputImage();"> --%>
<input type="button" value=" 이미지 생성 " onclick="InputImage()">
<input id="imageadd" type="button" onclick="imgdel()" value="이미지 제거"><br/>


<!-- <input id="image" type="file" name="file" onchange="InputImage();"> -->
<input id="image1" type="file" name="file1" onchange="InputImage1();">
<input id="image2" type="file" name="file2" onchange="InputImage2();">
<input id="image3" type="file" name="file3" onchange="InputImage3();">
<input id="image4" type="file" name="file4" onchange="InputImage4();">
<input id="image5" type="file" name="file5" onchange="InputImage5();">
<input id="image6" type="file" name="file6" onchange="InputImage6();">
<input id="image7" type="file" name="file7" onchange="InputImage7();">
<input id="image8" type="file" name="file8" onchange="InputImage8();">

<div id="imagePreview1" onclick="imgdelselect(1)"></div>
<div id="imagePreview2" onclick="imgdelselect(2)"></div>
<div id="imagePreview3" onclick="imgdelselect(3)"></div>
<div id="imagePreview4" onclick="imgdelselect(4)"></div>
<div id="imagePreview5" onclick="imgdelselect(5)"></div>
<div id="imagePreview6" onclick="imgdelselect(6)"></div>
<div id="imagePreview7" onclick="imgdelselect(7)"></div>
<div id="imagePreview8" onclick="imgdelselect(8)"></div>

<!-- 이미지 미리보기 close -->

<!-- 	<label>email:</label>
	<input type="text" name="email" value="kickscar@gmail.com">
	<br><br>
	
	<label>파일1:</label>
	<input type="file" name="file1">
	<br><br>
	
	<label>파일2:</label>
	<input type="file" name="file2">
	<br><br>
	
	<label>파일3:</label>
	<input type="file" name="file3">
	<br><br> -->
	
	<br>
<!-- 	<input type="submit" value="upload"> -->
	<br>
<%-- <div class="result-images">
		<c:if test="${not empty productImageUrl1 }">
			<img src="${productImageUrl1 }" style="width:150px"><br>
		</c:if>
		
		<c:if test="${not empty productImageUrl2 }">
			<img src="${productImageUrl2 }" style="width:150px"><br>
		</c:if>
		
		<c:if test="${not empty productImageUrl3 }">
			<img src="${productImageUrl3 }" style="width:150px"><br>
		</c:if>
		
	</div> --%>
	
<!-- </form>
<form method="post" action="upload1">
 -->

<!-- <input type="button" value="파일찾기">

<input type="button" value="등록"> --><br/>
price(가격) <input type="text" name="price">원<br/>
title(제목) <input type="text" name="title"><br/>
content(내용) <textarea rows="3" cols="100" name="content"></textarea><br/>

tradeCategory(판매/구매)
<!-- <input type="text" name="tradeCategory" value="trade_category 중고 신품 "> -->
<select name="tradeCategory">
<option value="판매" selected="selected">판매</option>
<option value="구매">구매</option>
</select><br/>

itemCondition(신품/중고)
<!-- <input type="text" name="itemCondition" value="item_condition 판매 구매 "> -->
<select name="itemCondition">
<option value="중고" selected="selected">중고</option>
<option value="신품">신품</option>
</select><br/>

shipingFee(택배)
<!-- <input type="text" name="shipingFee" value="shopingFee 택배비"><br/> -->
<select name="shippingFee">
<option value="포함" selected="selected">포함</option>
<option value="미포함">미포함</option>
</select><br/>

<br/>
<input type="text" name="userNo" value="${authUser.no }"><br/>
<!-- <input type="text" name="email" value="email 히든으로 가져갈꺼임"><br/> -->
<input type="hidden" name="location" value="${latlng}">
<input type="hidden" name="address" value="${address}">
<input type="hidden" name="userName" value="${authUser.name }">
<input type="submit" value="완료">
<a href="/items"><input type="button"  value="취소"></a><br/>

</form>


	
</body>
</html>