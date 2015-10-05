<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header -->
<nav class="navbar navbar-default navbar-fixed-top" >
	<div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="/"><strong id="my">My</strong>Market</a>
	    </div>
	    <div class="collapse navbar-collapse">
	      <form class="navbar-form navbar-right" role="search" action="/searchMain" method="post">
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
	      	<li><a href="/user/loginform"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	      	<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> SNS Login</a></li>
	      	<li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
	      </c:when>
	      <c:otherwise>
	        <li><a href="/user/logout" onclick="logout();" id="revokeSession">
	        	로그아웃
	       		<iframe id="logoutframe" src="https://accounts.google.com/logout" style="display: none"></iframe>
	         <span class="sr-only">(current)</span></a></li>
	      </c:otherwise>
	       </c:choose>
	        <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> 찜상품</a></li>
	        <li><a href="/items/itemsinsert">상품등록</a></li>
	     
	      </ul>
	    </div>
	</div>
</nav>


