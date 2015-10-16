<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link href="/assets/js/bootstrap-3.3.5-dist/css/bootstrap.css"
	rel="stylesheet">
<script src="/assets/js/bootstrap-3.3.5-dist/js/bootstrap.js"></script>
<%@ include file="/WEB-INF/views/include/include-header.jspf"%>
<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
<style type="text/css">
#frm {
	padding-top: 20px;
}
</style>
</head>

<body>
	<form id="frm" name="frm" enctype="multipart/form-data">
		<input type="hidden" name="userNo" value="${authUser.no }"> 
		<input type="hidden" name="userName" value="${authUser.name }">
		<table class="board_view">
			<colgroup>
				<col width="15%">
				<col width="*" />
			</colgroup>
			<caption>게시글 작성</caption>
			<tbody>
				<tr>
					<th scope="row">제목</th>
					<td><input type="text" id="title" class="form-control" name="title" class="wdp_90"></input>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="view_text"><textarea rows="20"
							class="form-control" cols="100" title="내용" id="content"
							name="content"></textarea></td>
				</tr>
			</tbody>
		</table>
		<div id="fileDiv">
			<input type="file" id="files" name="file[]" multiple="multiple">
			<output id="list"></output>
		</div>
		<a href="#this" class="btn btn-default" id="write">작성하기</a> 
		<a href="#this" class="btn btn-default" id="list">목록으로</a>
	</form>
	<script>
		function handleFileSelect(evt) {
			$('span').remove();
			//$('.thumb').remove();
			var files = evt.target.files; // FileList object
			// Loop through the FileList and render image files as thumbnails.
			var count = 0;
			for (var i = 0, f; f = files[i]; i++) {

				// Only process image files.
				if (!f.type.match('image.*')) {
					continue;
				}

				var reader = new FileReader();

				// Closure to capture the file information.
				reader.onload = (function(theFile) {
					return function(e) {
						// Render thumbnail.
						var span = document.createElement('span');
						count++;
						span.innerHTML = [
								'<img class="thumb" id="image' + count
										+ '" src="', e.target.result,
								'" title="', escape(theFile.name), '"/>' ]
								.join('');
						document.getElementById('list')
								.insertBefore(span, null);
					};
				})(f);

				// Read in the image file as a data URL.
				reader.readAsDataURL(f);
			}
		}
		document.getElementById('files').addEventListener('change',
				handleFileSelect, false);
	</script>
	<%@ include file="/WEB-INF/views/include/include-body.jspf"%>
	<script type="text/javascript">
		var gfv_count = 1;

		$(document).ready(function() {
			$("#list").on("click", function(e) { //목록으로 버튼
				e.preventDefault();
				fn_openBoardList();
			});

			$("#write").on("click", function(e) { //작성하기 버튼
				e.preventDefault();
				fn_insertBoard();
			});

			$("#addFile").on("click", function(e) { //파일 추가 버튼
				e.preventDefault();
				fn_addFile();
			});
		});

		function fn_openBoardList() {
			var comSubmit = new ComSubmit();
			comSubmit.setUrl("<c:url value='/board/view/1'/>");
			comSubmit.submit();
		}
		function fn_insertBoard() {
			var comSubmit = new ComSubmit("frm");
			comSubmit.setUrl("<c:url value='/board/write/' />");
			comSubmit.submit();
		}
		function fn_deleteFile(obj) {
			obj.parent().remove();
		}
	</script>
</body>
</html>