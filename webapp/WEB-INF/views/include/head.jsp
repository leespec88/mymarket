<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>main view</title>
<meta charset="UTF-8">
</head>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

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
    	var path="http://www.mymarket.com/user/loginBySns";
    	var name = response.name;
    	var idNo = response.id;
    	var method="post";
    	post_to_url(path,name,idNo,null,null,method);
    });
  }
  
  function logout(){
	  FB.logout(function(response){});
  }
</script>
<body>
</body>
</html>

<nav class="navbar navbar-default navbar-fixed-top" >

  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/"><strong id="my">My</strong>Market</a>
    </div>

    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <form class="navbar-form navbar-left navbar-right" role="search" action="/searchMain" method="post">
        <div class="form-group">
          <input type="text" class="form-control" name="kwd" placeholder="상품검색창입니다.">
        </div>
        <button type="submit" class="btn btn-default">검색</button>
      </form>
      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">메뉴 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
           
            
            <li class="divider"></li>
            <li><a href="#">공지사항</a></li>
            <li><a href="#">이벤트</a></li>
            <li><a href="/board/1">자유게시판</a></li>
            <li><a href="#">문의 제안 신고</a></li>
            <li class="divider"></li>
            <c:if test="${not empty authUser }">
           		<li><a href="/user/modifyform">개인정보수정</a></li>
           		<li><a href="#">회원탈퇴</a></li>
           		<li><a href="#">알림</a></li>
           		 <li><a href="#">찜상품</a></li>
            </c:if>
            <li class="divider"></li>
            <li><a href="#">버전정보</a></li>
            <li><a href="#">약관 및 개인정보 취급방침</a></li>
          </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <c:choose>
      <c:when test="${empty authUser }">
      	<li ><a href="/user/loginform">로그인 <span class="sr-only">(current)</span></a></li>
      	<li><a href="/face.jsp">SNS 로그인 <span class="sr-only">(current)</span></a></li>
      	<li><a href="/user/joinform">회원가입 <span class="sr-only">(current)</span></a></li>
      </c:when>
      <c:otherwise>
        <li><a href="/user/logout" onclick="logout();" id="revokeSession">
        	로그아웃
       		<iframe id="logoutframe" src="https://accounts.google.com/logout" style="display: none"></iframe>
         <span class="sr-only">(current)</span></a></li>
      </c:otherwise>
       </c:choose>
        <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
        <li><a href="/items/itemsinsert">상품등록</a></li>
     
      </ul>
    </div>
  </div>
</nav>

