<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/WEB-INF/views/include/include-header.jspf"%>

</head>
<body>
	<form id="frm" name="frm" enctype="multipart/form-data">
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
					<td>${vo.no }<input type="hidden" id="no" value="${vo.no }"
						name="no"> <input name="vo" value="${vo}" type="hidden" />
					</td>
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
					<td colspan="3"><input type="text" id="title" name="title"
						class="wdp_90" value="${vo.title }" /></td>
				</tr>
				<tr>
					<td colspan="4" class="view_text"><textarea rows="20"
							cols="100" title="내용" id="content" name="content">${vo.content }</textarea>
					</td>
				</tr>
				<tr>
					<th scope="row">첨부파일</th>
					<td colspan="3">
						<div id="fileDiv">
							<c:forEach var="file" items="${fileList }" varStatus="var">
								<p>
									<input type="hidden" class="fileNo" value="${file.NO }">
									<img src="/images/${file.STORED_FILE_NAME}" width="100px"
										height="100px" > <a href="#this">${file.ORIGINAL_FILE_NAME }</a>
									(${file.FILE_SIZE }kb) <a href="#this" class="delFile"
										name="delete_${var.index }">삭제 ${file.BOARD_NO}</a>
								</p>
							</c:forEach>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	<a href="#this" class="btn" id="list">목록으로</a>
	<a href="#this" class="btn" id="addFile">파일 추가</a>
	<a href="#this" class="btn" id="update">저장하기</a>
	<a href="#this" class="btn" id="delete">삭제하기</a>

	<%@ include file="/WEB-INF/views/include/include-body.jspf"%>
	<script type="text/javascript">
		var gfv_count = '${fn:length(fileList)+1}';
		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});
			$("#update").on("click", function(e) { //저장하기 버튼
				e.preventDefault();
				fn_updateBoard();
			});
			$("#delete").on("click", function(e) { //삭제하기 버튼
				e.preventDefault();
				fn_deleteBoard();
			});
			$("#addFile").on("click", function(e) { //파일 추가 버튼
				e.preventDefault();
				fn_addFile();
			});
			$(".delFile").on("click", function(e) {
				e.preventDefault();
				fn_deleteFile();
			});
			$("a[name^='delete']").on("click", function(e) { //삭제 버튼
				e.preventDefault();
				fn_emdeleteFile($(this));
			});
		});
		function fn_openBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/1' />");
			comSubmit.submit();
		}

		function fn_updateBoard() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/board/updateBoard' />");
			comSubmit.submit();
		}
		function fn_deleteBoard() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/deleteBoard' />");
			comSubmit.addParam("no", $("#no").val());
			comSubmit.submit();
		}
		function fn_deleteFile() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/deleteFile' />");
			comSubmit.addParam("fileNo", $(".fileNo").val());
			comSubmit.addParam("no", $("#no").val());
			comSubmit.submit();
		}

		function fn_addFile() {
			var str = "<p><input type='file' name='file_" + (gfv_count++)
					+ "'><a href='#this' class='btn' id='delete_" + (gfv_count)
					+ "' name='delete_" + (gfv_count) + "'>삭제</a></p>";
			$("#fileDiv").append(str);
			$("#delete_" + (gfv_count++)).on("click", function(e) { //삭제 버튼
				e.preventDefault();
				fn_emdeleteFile($(this));
			});
		}
		function fn_emdeleteFile(obj) {
			obj.parent().remove();
		}
	</script>
</body>
</html>