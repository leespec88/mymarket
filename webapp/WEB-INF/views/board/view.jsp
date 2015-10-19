<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>자유게시판</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="/assets/js/bootstrap-3.3.5-dist/css/bootstrap.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="<c:url value="/assets/js/common.js"/>" charset="utf-8"></script>
<style type="text/css">
.board_view {
	margin-top: 60px;
}

.contentfile {
	width: 500px;
}

pre {
	width: 723px;
}

.commentTextDesc {
	width: 723px;
}

.answerArea {
	width: 723px;
}
</style>
</head>
<body>
	<div id="boardVo" class="container board_view well">
		<table class="table">
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
					<td colspan="4" scope="row" height="20%"><div>
							<c:forEach var="file" items="${fileList }">
								<p style="text-align: center;">
									<img class="img-responsive contentfile" src="${file.IMAGE}">
								</p>
							</c:forEach>
						</div>${vo.content }</td>
				</tr>
				<tr>
					<th scope="row">첨부파일</th>
					<th scope="row"><c:forEach var="file" items="${fileList}">
							<img class="img-responsive img-thumbnail" src="${file.IMAGE}"
								class="img-thumbnail" width="15%" height="auto">
						</c:forEach></th>
				</tr>
			</tbody>
		</table>
		<br />
		<div>
			<h5>총 ${vo.replyCnt}개</h5>
			<c:forEach var="reply" items="${replyList}">
				<table class="tb-reply">
					<tr>
						<td style="padding-left:${reply.depth*30}px"><input
							type="hidden" name="articleNo" value="">
						<td><img src="/assets/css/images/gc_img.gif">
							${reply.userName}
						<td>${reply.regDate}</td>
						<td><a href="javascript:testOne(${reply.no})"
							class="subreply" data-toggle="tooltip" data-placement=""
							title="답장하기"><span class="glyphicon glyphicon-share-alt"></span></a>
						</td>
						<td><c:if
								test="${not empty authUser && reply.userNo == authUser.no }">
								<a
									href="/board/deletereply/${reply.no}?articleNo=${reply.boardNo}"
									data-toggle="tooltip" data-placement="bottom" title="삭제하기"><span
									class="glyphicon glyphicon-trash"></span></a>
							</c:if></td>
					</tr>
				</table>
				<script>
					function testOne(reply) {
						$("#" + reply).toggle();
					}
				</script>
				<div id="junki" style="padding-left:${reply.depth*30}px">
					<pre class="">${reply.content}</pre>
					<div class="rereply" id="${reply.no}" style="display: none">
						<form class="answerArea" action="/board/replyreply" method="post">
							<input type="hidden" name="replyNo" value="${reply.no}">
							<input type="hidden" name="parentGroupNo"
								value="${reply.groupNo}">
							<textarea class="form-control commentTextDesc"
								placeholder="댓글을 입력해주세요." class="commnetTextArea"
								name="replyContent" id="commnetTextArea" maxlength="500"></textarea>
							<input class="commentBtn" id="commentBtn" type="image"
								src="/assets/images/btn_input_comment_normal.png"
								alt="Submit Form" />
						</form>
					</div>
				</div>
				<div class="form-group" style="display: none;">
					<form action="/board/replyreply" method="post">
						<input type="hidden" name="replyNo" value="${reply.no}">
						<textarea class="form-control" id="commentParentText" cols="85"
							name="replyContent" placeholder="댓글을 입력해주세요." maxlength="500"></textarea>
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
					<td><textarea class="form-control" placeholder="댓글을 입력해주세요."
							style="width: 723px;" rows="5" maxlength="500" name="content"></textarea></td>
				</tr>
				<tr>
					<td align="right"><input type="submit" class="btn btn-default"
						value="답글"></td>
				</tr>
			</table>
		</form>
		<a href="/board/1" class="btn btn-default" id="list">목록으로</a>

		<c:if test="${authUser.no==vo.userNo }">
		</c:if>
		<a href="/board/modifyform/${vo.no}" class="btn btn-default"
			id="update">수정하기</a> <a href="/board/delete/${vo.no}"
			onclick="fn_checkEvent('재등록 하시겠습니까?');" class="btn btn-default"
			id="delete">삭제하기</a>
	</div>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<script src="/assets/js/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
	<script type="text/javascript">
		function fn_checkEvent(obj) {
			if (confirm(obj) == true) { //확인
				if (obj.match('삭제') == '삭제') {
					location.href = "/items/itemDelete/" + $
					{
						itemVo.no
					}
					;
				}
				if (obj.match('재등록') == '재등록') {
					location.href = "/items/updateRegDate/" + $
					{
						itemVo.no
					}
					;
				}
			} else {
				return;
			}
		}
	</script>
</body>
</html>