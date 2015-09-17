<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Facebook Login JavaScript Example</title>
<meta charset="UTF-8">
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/assets/css/main.css" type="text/css">
<script src="/assets/js/jquery-1.11.3.js"></script>
<script>
  // This is called with the results from from FB.getLoginStatus().
  
  function statusChangeCallback(response) {
    console.log('statusChangeCallback');
    console.log(response);
    if (response.status === 'connected') {
      
    } else if (response.status === 'not_authorized') {
      
    } else {
      
    }
  }
  function checkLoginState() {
    FB.getLoginStatus(function(response) {
    	  loginSuccess();
    	  statusChangeCallback(response);
    });
  }
 
  window.fbAsyncInit = function() {
  FB.init({
    appId      :'986739934701573',
    cookie     : true,  // 쿠키가 세션을 참조할 수 있도록 허용
    xfbml      : true,  // 소셜 플러그인이 있으면 처리
    version    : 'v2.1' // 버전 2.1 사용
  });
    FB.getLoginStatus(function(response) {
      statusChangeCallback(response);
    });
 
  };
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  function loginSuccess() {
    FB.api('/me', function(response) {
    	var path="http://www.mysungmin.com/user/loginBySns";
    	var name = response.name;
    	var idNo = response.id;
    	var method="post";
    	post_to_url(path,name,idNo,null,null,method);
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
		var path="http://www.mysungmin.com/user/loginBySns";
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
   
</script>
<body>

<div class="container">	
	
	
	
	<div class="col-lg-5 col-lg-offset-5">
	<h3>SNS 로그인</h3>
	<div class="table-responsive">
	<table class="table table-bordered" style="width:200px">
	<tr>
	<td>
		<div class="fb-login-button" data-size="large" data-scope="public_profile, email" onlogin="checkLoginState();">
		facebook 계정으로 로그인
		</div>
	</td>
	</tr>
	<tr>
	<td>
	
	<div id="signinButton">
		<div
			class="g-signin"
			data-callback="signinCallback"
			data-clientid="919722381404-nrcd5fqcad52k4b02p2aotu1975nba0l.apps.googleusercontent.com"
			data-theme="light"
			data-cookiepolicy="single_host_origin"
			data-requestvisibleactions="http://schemas.google.com/AddActivity"
			data-scope="https://www.googleapis.com/auth/plus.login">
		<button type="button" class="btn btn-danger" style="width:194px; height:29px">Google 계정으로 로그인</button>
		</div>
	</div>
	</td>
	</tr>
	</table>
	<div class="form-group">
	      <div class="col-lg-6 col-lg-offset-4">
	        <a href="/"><input type="button" class="btn btn-default" value="취소"/></a>
	      </div>
	</div>
	</div>
	</div>

</div>
</body>
</html>
