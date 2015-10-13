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
	    	var method="post";
	    	post_to_url(path,name,idNo,null,null,method);
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
	  	post_to_url(path, name, idNo, email, gender, method);
	  }  
   function post_to_url(path, name,idNo,email,gender,method) {
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
		
		form.appendChild(hiddenField1);
		form.appendChild(hiddenField2);
		form.appendChild(hiddenField3);
		form.appendChild(hiddenField4);
		
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
   });
   
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
	        <li><a href="/user/logout" onclick="logout();" id="revokeSession"><span class="glyphicon glyphicon-log-out"></span>
	        	Logout
	       		<iframe id="logoutframe" src="https://accounts.google.com/logout"></iframe>
	         <span class="sr-only">(current)</span></a></li>
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

