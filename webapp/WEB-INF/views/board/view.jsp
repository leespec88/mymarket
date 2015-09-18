<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/include/include-header.jspf"%>
</head>
<body>
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
					
					${vo.content }
					
				</td>
			</tr>
			<tr>
				<th scope="row">첨부파일</th>
				<td colspan="3">
					<c:forEach var="file" items="${fileList }">
						<input type="hidden" id="no" value="${file.no }">
						<img src="/images/${file.STORED_FILE_NAME}" width="100px"
							height="100px">
					</c:forEach>
				
				</td>
			</tr>
		</tbody>
	</table>
	<br />
	<div>
		<h3>총 ${replyCnt}개 댓글───────────────────────</h3>
		<c:forEach var="reply" items="${replyList}">
			<table class="tb-reply">
				<tr>
					<td style="padding-left:${reply.depth*30}px"><input
						type="hidden" name="articleNo" value="">
					<td><img src="/assets/css/images/gc_img.gif">
						${reply.userName}
					<td>${reply.regDate}</td>
					<td><a href="/board/replyreplyform?replyNo=${reply.no}&articleNo=${reply.boardNo}">답글</a></td>
					<td><c:if test="${reply.userNo == authUser.no }">
							<a
								href="/board/deletereply/${reply.no}?articleNo=${reply.boardNo}"><img
								src="/assets/images/recycle.png"></a>
						</c:if> <c:if test="${not empty authUser}">
							
						</c:if>
				</tr>
			</table>
			<div id="junki" style="padding-left:${reply.depth*30}px">${reply.content}
			</div>


		</c:forEach>
	</div>
	<form class="board-reply_form" action="/board/addreply/${vo.no}"
		method="post">
		<table>
			<tr>
				<td><textarea cols="75" rows="10" maxlength="1000"
						name="content"></textarea></td>
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


</body>
</html>