<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>자유게시판</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/assets/css/board.css"/>" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="<c:url value="/assets/js/common.js"/>" charset="utf-8"></script>
<%@ include file="/WEB-INF/views/include/include-header.jspf"%>
</head>
<body>
	<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
	<div id="boardVo">
		<table class="board_view">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<caption>게시글 상세</caption>
			<tbody>
				<tr>
					<th scope="row">글 번호</th>
					<td>${vo.no }</td>
					<th scope="row">조회수</th>
					<td>${vo.viewCnt }</td>
				</tr>
				<tr>
					<th scope="row">작성자</th>
					<td>${vo.userName }</td>
					<th scope="row">작성시간</th>
					<td>${vo.regDate }</td>
				</tr>
				<tr>
					<th scope="row">제목</th>
					<td colspan="3">${vo.title }</td>
				</tr>
				<tr>
					<td colspan="4" scope="row" height="20%">
						<div class="boardContent">
							<c:forEach var="file" items="${fileList }">
								<p style="text-align: center;">
									<img src="/product-images/${file.STORED_FILE_NAME}">
								</p>
							</c:forEach>
						</div>${vo.content }
						</td>
				</tr>
				<tr>
					<th scope="row">첨부파일</th>
					<td colspan="3"><c:forEach var="file" items="${fileList}">
							<input type="hidden" id="no" value="${file.no }">
							<img id="mini_img" src="/product-images/${file.STORED_FILE_NAME}"
								class="img-thumbnail" width="15%" height="auto">

						</c:forEach></td>
				</tr>
			</tbody>
		</table>
		<br />
		<div>
			<h4>총 ${replyCnt}개
				댓글───────────────────────────────────────────────────────</h4>
			<c:forEach var="reply" items="${replyList}">
				<table class="tb-reply">
					<tr>
						<td style="padding-left:${reply.depth*30}px"><input
							type="hidden" name="articleNo" value="">
						<td><img src="/assets/css/images/gc_img.gif">
							${reply.userName}
						<td>${reply.regDate}</td>
						<td><a
							href="/board/replyreplyform?replyNo=${reply.no}&articleNo=${reply.boardNo}"
							data-toggle="tooltip" data-placement="bottom" title="답장하기"><span
								class="glyphicon glyphicon-share-alt"></span></a></td>
						<td><c:if
								test="${not empty authUser && reply.userNo == authUser.no }">
								<a
									href="/board/deletereply/${reply.no}?articleNo=${reply.boardNo}"
									data-toggle="tooltip" data-placement="bottom" title="삭제하기"><span
									class="glyphicon glyphicon-trash"></span></a>
							</c:if>
					</tr>
				</table>
				<div id="junki" style="padding-left:${reply.depth*30}px">
					<pre>${reply.content}</pre>
				</div>
				<div style="display: none;">
					<form action="/board/replyreply" method="post">
						<input type="hidden" name="replyNo" value="${reply.no}">
						<textarea id="commentParentText" cols="85" name="replyContent"
							placeholder="댓글을 입력해주세요." maxlength="500"></textarea>
						<input type="submit" class="btn" id="commentParentSubmit"
							value="답글">
					</form>
				</div>
			</c:forEach>
		</div>
		<form class="board-reply_form" action="/board/addreply/${vo.no}"
			method="post">
			<table>
				<tr>
					<td><textarea placeholder="댓글을 입력해주세요." cols="100" rows="5"
							maxlength="500" name="content"></textarea></td>
				</tr>
				<tr>
					<td align="right"><input type="submit" class="btn" value="답글"></td>
				</tr>
			</table>
		</form>
		<a href="/board/1" class="btn" id="list">목록으로</a>

		<c:if test="${authUser.no==vo.userNo }">
		</c:if>
		<a href="/board/modifyform/${vo.no}" class="btn" id="update">수정하기</a>
		<a href="/board/delete/${vo.no}" class="btn" id="delete">삭제하기</a>
		<%@ include file="/WEB-INF/views/include/include-body.jspf"%>
	</div>
</body>
</html>