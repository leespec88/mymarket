<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="/assets/css/main.css" type="text/css">

</head>

<body>
	
	<c:import url="/WEB-INF/views/include/head.jsp"></c:import>

	<div class="container" id="boardlist">
		<table class="table table-striped">
				<thead>
        			<tr>
						<th>번호</th>
						<th>제목</th>
						<th>글쓴이</th>
						<th>조회수</th>
						<th>작성일</th>
						<th>&nbsp;</th>
					</tr>
				</thead>
				
				<c:set var="status" value="${fn:length(list)}"></c:set>
				<tbody>
					<c:forEach var="vo" items="${list }" varStatus="status">
					<tr>
						<td>${vo.no}</td>
						<td>
							<a href="/board/view/${vo.no}">${vo.title } <c:if test="${ vo.replyCnt>=1 }">[${ vo.replyCnt}]</c:if></a>
						</td>
						<td>${vo.userName }</td>
						<td>${vo.viewCnt }</td>
						<td>${vo.regDate }</td>
						<td>${authUser.name}
							<c:if test="${vo.userNo == authUser.no && authUser != null }">
								<a href="/board/delete/${vo.no}"><span class="glyphicon glyphicon-trash"></span></a>
							</c:if>
						</td>
					</tr>
					</c:forEach>
				</tbody>
		</table>

		<ul class="pagination">
			<c:if test="${s_page-10 >= 1 }">
				<li><a href="/board/${s_page-10}">이전</a></li>
			</c:if>
			<c:forEach var="i" begin="${s_page }" end="${c_m_page }">
				<c:if test="${c_page==i}">
					<li><a href="/board/${i}">${i}</a></li>
				</c:if>
				<c:if test="${c_page!=i}">
					<li><a href="/board/${i}">${i}</a></li>
				</c:if>
			</c:forEach> 
			<c:if test="${s_page+10<t_page }">
				<li><a href="/board/${s_page+10}">다음</a></li>
			</c:if>
		</ul>		
							
		<ul class="pager">
			<c:if test="${not empty authUser}">
				<li><a href="/board/writeform" id="new-book">글쓰기</a></li>
			</c:if>
			<c:if test="${not empty detail}">
				<li><a href="/board/" id="new-book">목록으로</a></li>
			</c:if>
		</ul>
		
		<form id="search_form" action="/board/1" method="post">
			<input type="text" id="kwd" name="kwd" value=""> 
			<input type="submit" value="찾기">
		</form>
		
	</div>
</body>
</html>