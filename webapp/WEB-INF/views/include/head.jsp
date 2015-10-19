<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>newIndex view</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
  .modal-header, h4, .close {
      background-color: #f9f9f9;
      color:black !important;
      text-align: center;
      font-size: 30px;
  }
  .modal-footer {
      background-color: #f9f9f9;
  }
  
  /* Google 계정으로 로그인 */
  .google{
  		background-color: #DD4B39;
  		border-color: #A42E2E;
  		color: #fff; 
  		width:49%;
  		height:46px;
  }
  .google:hover{
  		color : #fff;
  		background-color: #c9302c;
  		border-color: #c9302c;
  }
  .google:focus{
 		color : #fff;
  		background-color: #c9302c;
  		border-color: #c9302c;
  }
  .google:active:focus{
  		color : #fff;
  		background-color: #c9302c;
  		border-color: #c9302c;
  }
  
  /* Facebook 계정으로 로그인 */
  .facebook{
  		background-color: #3a5795;
	    width:49%; 
	    height:46px;
  }
  
  .modal-header{
  	padding:35px 50px;
  }
  
  .modal-body{
  	padding:40px 74px;
  }
  
  #logoutframe{
  	display: none;
  }
					
  @media(max-width:767px){
  	#myModal{
  	padding right:0;
  	}
  	.modal-content{
  	max-width: none;
    height: 100%;
  	}
  	.modal-dialog{
  	max-width: none;
    height: 100%;
    border-radius: 0;
    overflow: auto;
  	margin:0;
  	}
  	.modal{
  	right: -16px;
  	}
  }
  
  @media(max-width:600px){
	  .google{
	  		width:100%;
	  		margin-top: 5px;
	  }
	  .facebook{
		    width:100%; 
	  }
	  .modal-body{
	  	align: center;
	  }
  }  
  
  .glyphicon-envelope{
  	font-size:20px;
  	color:yellow;
  }
  
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>
  window.fbAsyncInit = function() {  
	    FB.init({appId: "986739934701573", status: true, cookie: true, xfbml: true});      
	};  

	(function(d){  
	   var js, id = "facebook-jssdk", ref = d.getElementsByTagName("script")[0];  
	   if (d.getElementById(id)) {return;}  
	   js = d.createElement("script"); js.id = id; js.async = true;  
	   js.src = "//connect.facebook.net/en_US/all.js";  
	   ref.parentNode.insertBefore(js, ref);  
	 }(document));     

	function facebooklogin() {  
		 
	    //페이스북 로그인 버튼을 눌렀을 때의 루틴.  
	  FB.login(function(response) {  
	    var fbname;  
	    var accessToken = response.authResponse.accessToken;  
	    FB.api('/me', function(response) {
	    	var path="http://www.mymarket.com/user/loginBySns";
	    	var name = response.name;
	    	var idNo = response.id;
	    	var imageURL = "http://graph.facebook.com/"+response.id+"/picture?type=large";
	    	var method="post";
	    	post_to_url(path,name,idNo,null,null,method,imageURL);
	    });   
	  });  
	}  
  
  
  //구글 연동
  
  (function() {
	    var po = document.createElement('script'); 
	    po.type = 'text/javascript'; 
	    po.async = true;
	    po.src = 'https://apis.google.com/js/client:plusone.js';
	    var s = document.getElementsByTagName('script')[0]; 
	    s.parentNode.insertBefore(po, s);
  	})();
   function signinCallback(authResult) {
	   if (authResult['access_token']) {
	     // 승인 성공
	     // 사용자가 승인되었으므로 로그인 버튼 숨김. 예:
	    	 console.log("error");
	    	 getEmail();
	    	 
	   } else if (authResult['error']) {
	     // 오류가 발생했습니다.
	     // 가능한 오류 코드:
	     //   "access_denied" - 사용자가 앱에 대한 액세스 거부
	     //   "immediate_failed" - 사용자가 자동으로 로그인할 수 없음
	     console.log('오류 발생: ' + authResult['error']);
	   }
	 } 
   function getEmail(){
	    // userinfo 메소드를 사용할 수 있도록 oauth2 라이브러리를 로드합니다.
	    gapi.client.load('oauth2', 'v2', function() {
	          var request = gapi.client.oauth2.userinfo.get();
	          request.execute(getEmailCallback);
	        });
	  }
   function getEmailCallback(obj){
		console.log(obj);
		var path="http://www.mymarket.com/user/loginBySns";
	  	var name = obj.name;
	  	var idNo = obj.id;
	  	var gender = obj.gender;
	  	var email = obj.email;
	  	var method="post";
	  	post_to_url(path, name, idNo, email, gender, method, null);
	  }  
   function post_to_url(path, name,idNo,email,gender,method,imageURL) {
	    method = method || "post";
	    var form = document.createElement("form");
	    form.setAttribute("method", method);
	    form.setAttribute("action", path);
		
	    var hiddenField1 = document.createElement("input");
		hiddenField1.setAttribute("type", "hidden");
		hiddenField1.setAttribute("name", "name");
		hiddenField1.setAttribute("value", name);
		
	    var hiddenField2 = document.createElement("input");
		hiddenField2.setAttribute("type", "hidden");
		hiddenField2.setAttribute("name", "idNo");
		hiddenField2.setAttribute("value", idNo);
		
	    var hiddenField3 = document.createElement("input");
		hiddenField3.setAttribute("type", "hidden");
		hiddenField3.setAttribute("name", "email");
		hiddenField3.setAttribute("value", email);
		
	    var hiddenField4 = document.createElement("input");
		hiddenField4.setAttribute("type", "hidden");
		hiddenField4.setAttribute("name", "gender");
		hiddenField4.setAttribute("value", gender);
		
		var hiddenField5 = document.createElement("input");
		hiddenField4.setAttribute("type", "hidden");
		hiddenField4.setAttribute("name", "imageURL");
		hiddenField4.setAttribute("value", imageURL);
		
		form.appendChild(hiddenField1);
		form.appendChild(hiddenField2);
		form.appendChild(hiddenField3);
		form.appendChild(hiddenField4);
		form.appendChild(hiddenField5);
		
		document.body.appendChild(form);
	   
	    form.submit();
	}
   function logout(){
		  FB.logout(function(response){});
   }
   
   $(document).ready(function(){
       $("#myBtn").click(function(){
    	   $("#myModal").modal();
       });
       
       $('#myItems').click(function(){
    	   $("#myModal").modal();
       });
       
       $('.submitBtn').click(function(){
    	   var email = $('#userid').val();
    	   var password = $('#password').val();
    	   
    	   $.ajax({
    		  url:'/user/loginCheck',
    		  type:'post',
    		  data:{email:email, password:password},
    		  success:function(result){
    				if(result){
    					$('#loginSubmit').submit();
    				}else{
    					alert('로그인 정보가 잘못되었습니다.');
    					return false;
    				}
    		},error: function (xhr, txtStatus, errorThrown) {  
                alert("error" + errorThrown);  
            }  
    	   });
       }); 
   
   	
	   $('.msg-noti-a').click(function(){
			var userNo = $('#userNo').val();
			var userName = $('#userName').val();
			var output = "<li style='background-color:#edefed; text-align:center; font-size:15px;'>메 세 지</li><li class='divider'></li>";
			$.ajax({
				url:'/user/getMessage',
				type:'post',
				dataType:'json',
				data:{'userNo':userNo},
				success:function(response){
					var msgList = response.msgList;
					for(var i=0; i<msgList.length; i++){
						output+="<li style='text-align:center;'><a href='#'style='width:290px; display:inline-block;' onclick='chatRoom("+msgList[i].itemNo+");'>판매 중인 아이템(No."+msgList[i].itemNo+") 새 메세지가 도착   </a><span style='cursor:pointer;'onclick='delMessage("+msgList[i].no+");' class='glyphicon glyphicon-remove'></span></li>";
						output+="<li class='divider'></li>";
					}
					$('#msg-noti-b').html(output);
				}
			});
	   });
	   
   
   
   });
   
	function chatRoom(itemNo){
		window.open("/user/getMessageList?itemNo="+itemNo, "판매자와 대화창", "width=800, height=560s, toolbar=no, menubar=no");
	}
	
	function delMessage(msgNo){
		if(confirm('삭제하시겠습니까?')){
			$.ajax({
				url:'/user/msgDelete',
				type:'post',
				dataType:'json',
				data:{'msgNo':msgNo},
				success:function(){
					console.log('삭제완료');
				}
				
			});
		}
	}
   
</script>

</head> 
<body>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
      	<div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3>Login</h3>
        </div>
        <div class="modal-body">
            <span class="form-group">
            	<button class="btn btn-primary facebook" onclick="facebooklogin();">
					Facebook 계정으로 로그인
				</button>
            	<span
					class="g-signin"
					data-callback="signinCallback"
					data-clientid="919722381404-nrcd5fqcad52k4b02p2aotu1975nba0l.apps.googleusercontent.com"
					data-theme="light"
					data-cookiepolicy="single_host_origin"
					data-requestvisibleactions="http://schemas.google.com/AddActivity"
					data-scope="https://www.googleapis.com/auth/plus.login">
					<button class="btn btn-default google">
						Google 계정으로 로그인
					</button>
				</span>
       		</span>
       	  </div>
       	  <div class="modal-body">
          <form id="loginSubmit" role="form" action="/user/login">
            <div class="form-group">
              <label for="usrname"><span class="glyphicon glyphicon-user"></span> Email</label>
              <input type="text" class="form-control" id="userid" name="email" placeholder="Email Address">            
            </div>
            <div class="form-group">
              <label for="psw"><span class="glyphicon glyphicon-eye-open"></span> Password</label>
              <input type="password" class="form-control" id="password" name="password"placeholder="Password">
            </div>
            <div class="checkbox">
              <label><input type="checkbox" value="" checked>Remember me</label>
            </div>
              <button type="button" class="btn btn-danger btn-block submitBtn"></span>Login</button>
          </form>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-default btn-default pull-left" data-dismiss="modal"></span>Cancel</button>
          <p>회원이 아니신가요? <a href="/user/joinform">회원가입</a></p>
        </div>
      </div>
      
    </div>
  </div> 

<!-- header -->
<nav class="navbar navbar-default navbar-fixed-top" >
	<div class="container-fluid">
	    <div class="navbar-header">
		    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        	<span class="icon-bar"></span>
	        	<span class="icon-bar"></span>
	        	<span class="icon-bar"></span> 
	      	</button>
	      <a class="navbar-brand" href="/"><strong id="my">My</strong>Market</a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav navbar-right">
	      <c:choose>
		      <c:when test="${empty authUser }">
		      	<li><a type="button" class="btn" id="myBtn"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
		      	<li><a href="/user/joinform"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
		      </c:when>
		      <c:otherwise>
		        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
					<c:choose>
							<c:when test="${not empty authUser.imageURL }">
								<img src="${authUser.imageURL }" class="img-circle" alt="Cinque Terre" width="25" height="25">
							</c:when>
							<c:otherwise>
								<img src="/assets/images/person.png" class="img-circle" alt="Cinque Terre" width="25" height="25">
							</c:otherwise>
					</c:choose>
								
					</a>
					<ul class="dropdown-menu" role="menu">
						<li class="divider"></li>
						<li><a href="#">알림</a></li>
						<li><a href="/jjim/jjimlist/${authUser.no}">내 찜상품</a></li>
						<li class="divider"></li>
						<li><a href="/user/modifyform">개인정보수정</a></li>
						<li><a href="#">회원탈퇴</a></li>
						<li class="divider"></li>
						<li><a href="/user/logout" onclick="logout();" id="revokeSession"><span class="glyphicon glyphicon-log-out"></span>
						로그아웃 <iframe id="logoutframe" src="https://accounts.google.com/logout" style="display: none"></iframe>
						<span class="sr-only">(current)</span></a></li>
					</ul>
				</li>
				<input type="hidden" id="userNo" value="${authUser.no }"/>
				<input type="hidden" id="userName" value="${authUser.name }"/>
				
				<li class="dropdown">
					<a href="#" class="dropdown-toggle msg-noti-a" data-toggle="dropdown" role="button" aria-expanded="false">
					<span class="glyphicon glyphicon-envelope"></span>1</a>
					<ul id="msg-noti-b" class="dropdown-menu" role="menu" style="width:350px;">
						
						
						
					</ul>
				</li>
	      	</c:otherwise>
	       	</c:choose>
	       		
	        <c:choose>
	        	<c:when test="${not empty authUser }">
	        		<li><a href="/items/itemsinsert">상품등록</a></li>
	        	</c:when>
	        	<c:otherwise>
	        		<li><a type="button" class="btn" id="myItems">상품등록</a></li>
	        	</c:otherwise>
	        </c:choose>
	      </ul>
	    </div>
	</div>
</nav>

</body>
</html>

