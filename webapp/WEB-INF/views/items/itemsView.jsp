<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- bootstrap -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<style>
#itemview {
	padding-top: 100px;
}

.reply {
	padding-top: 20px;
}

textarea {
	resize: none;
}

#itemviewTitle {
	padding-left: 37px;
}
</style>
<title>Insert title here</title>
</head>
<body>

	<div class="container" id="itemview">
		<div class="row">
			<div class="col-sm-5 largeImg">
				<img class="img-thumbnail" id="" src="${fileList[0].IMAGE}"
					alt="Chania" width="500" height="400">
			</div>
			<div class="col-sm-1" id="smallimage">
				<c:forEach var="file" items="${fileList}">
					<div class=row>
						<img class="img-thumbnail" id="${file.IMAGE}" src="${file.IMAGE}"
							alt="Chania" width="52" height="40"
							onmouseover="javascript:setImage('${file.IMAGE}');">
					</div>
				</c:forEach>
			</div>
			<div class="col-sm-6">
				<div class="well" id="itemviewTitle">
					<div class="row">
						<c:if test="${itemVo.itemCondition == '중고' }">
							<span class="label label-primary">중고</span>
						</c:if>
						<c:if test="${itemVo.itemCondition == '신품' }">
							<span class="label label-success">신품</span>
						</c:if>
						<c:if test="${itemVo.shippingFee == '포함' }">
							<img src="/assets/images/img_tag_option_01.png" />
						</c:if>
						<h2>${itemVo.title }</h2>
						<h1>
							<span id="price"></span>
						</h1>
						<h3>
							<a href="#"><span class="glyphicon glyphicon-map-marker"></span></a>
							<span>판매처</span>
						</h3>
					</div>
				</div>
				<div class="well">
					<div class="row">
						<div class="col-sm-4">
							<a href=""><img width="94" height="94"
								src="/assets/css/images/img_itemdetail_profile_noimage.png"></a>
						</div>
						<div class="col-sm-8">
							<p>
								<a href="">${userVo.name}</a>
							</p>
							<p>
								<a href="/items/userItemList/${userVo.no}">등록 아이템 :
									${regItemCnt}</a>
							</p>
							<p>
								<a href="#"><span class="glyphicon glyphicon-phone-alt"></span>
									${userVo.phone}</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="well">
			<div class="row">
				<div class="col-sm-6">
					<h5>
						<strong>상세설명</strong>
					</h5>
					<textarea readonly="readonly" class="form-control" rows="5"
						id="comment">${itemVo.content}</textarea>
					<script>
						function testOne(reply) {
							$("#" + reply).toggle();
						}
					</script>
					<c:if test="${replyList[1] != null}">
						<label class="reply" for="comment">댓글</label>
						<c:forEach var="reply" items="${replyList}">
							<div class="tb-reply" id="addedFormDiv">
								<table class="">
									<tr>
										<c:if test="${reply.depth != 0}">
											<td style="padding-left:${reply.depth*30}px"><input
												type="hidden" name="articleNo" value="">
											<td><img src="/assets/css/images/gc_img.gif"></td>
										</c:if>
										<td><a class="userName" href=>${reply.userName}</a></td>
										<td><div class="replyregdate">${reply.regDate}</div></td>
										<td><a href="javascript:testOne(${reply.no})"
											class="subreply" data-toggle="tooltip" data-placement=""
											title="답장하기"> <span class="glyphicon glyphicon-share-alt"></span></a>
										</td>
										<td><c:if
												test="${not empty authUser && reply.userNo == authUser.no }">
												<a
													href="/items/deletereply/${reply.no}?itemNo=${reply.boardNo}"
													title="삭제하기"> <span class="glyphicon glyphicon-trash"></span></a>
											</c:if></td>
									</tr>
								</table>
								<div id="junki" style="padding-left:${reply.depth*30}px">
									<pre class="commentTextDesc">${reply.content}</pre>
								</div>

								<div class="rereply" id="${reply.no}" style="display: none">
									<form class="answerArea" action="/items/subreply/"
										method="post">
										<input type="hidden" name="replyNo" value="${reply.no}">
										<input type="hidden" name="parentGroupNo"
											value="${reply.groupNo}">
										<textarea class="commentTextDesc" placeholder="댓글을 입력해주세요."
											class="commnetTextArea" name="replyContent"
											id="commnetTextArea" maxlength="500"></textarea>
										<input class="commentBtn" id="commentBtn" type="image"
											src="/assets/images/btn_input_comment_normal.png"
											alt="Submit Form" />
									</form>
								</div>
							</div>
						</c:forEach>
					</c:if>
					<form role="form" action="/items/addreply/${itemVo.no}"
						method="post">
						<div class="form-group reply">
							<label for="comment">댓글입력</label>
							<textarea name="content" class="form-control" id="usr" rows="5"></textarea>
						</div>
						<button type="submit" class="btn btn-default">입력</button>
					</form>
				</div>
				<div class="col-sm-6">
					<c:if test="${authUser.no != userVo.no }">
						<p>
							<img src="/assets/images/img_side_clean_market_titletext.png">
						</p>
						<div class="well">
							<h5>
								<strong>사람들의 눈살을 찌푸리게 하는,거래금지 아이템은 자제해주세요!</strong>
							</h5>
							<span>- 담배, 전자담배</span> <br> <span>- 술</span> <br> <span>-
								렌즈 (콘택트, 써클)</span> <br> <span>- 의약품</span> <br> <span>-
								성인용품 (콘돔 제외)</span> <br> <span>- 일부 수제식품</span> <br> <span>-
								불법 도박 관련 글 (토토 등)</span> <br> <span>- 불법시술 (타투 등)</span> <br>
							<span>- 주민등록증/운전면허증</span> <br> <span>- 불법 소프트웨어 복제품</span>
							<br>
						</div>
						<div class="well">
							<h5>
								<strong>에티켓을 지키면 꼭 돌아오는 법! 비매너 행위는 자제해주세요~</strong>
							</h5>
							<span>- 도배성 행위</span> <br> <span>- 욕설/비하적 행위</span> <br>
							<span>- 선정적인 사진/내용</span> <br> <span>- 스토킹 등 다른 회원을
								괴롭히는 행위</span> <br> <span>- 커뮤니티에 홍보글/아이템 등록</span> <br> <span>-
								성의 없이 무의미한 아이템 등록</span> <br> <span>- 그 외 운영측 판단에 거래를 방해하는
								행위</span> <br>
						</div>
					</c:if>
					<c:if test="${authUser.no == userVo.no }">
						<p>
							<img src="/assets/images/img_side_item_management_title.png"
								alt="아이템 판매 관리 텍스트" width="162" height="33"
								class="itemManagerTit">
						</p>
						<p>
							<img src="/assets/images/img_item_details_title_description.png"
								alt="아이템 판매 관리 텍스트" width="59" height="15" class="itemStatTit">
						</p>
						<div class="well">
							<form action="/items/updateSellState/${itemVo.no}" method="post">
								<label class="radio-inline"> <input type="radio"
									name="sellState" value="판매중">판매중
								</label> <label class="radio-inline"> <input type="radio"
									name="sellState" value="예약중">예약중
								</label> <label class="radio-inline"> <input type="radio"
									name="sellState" value="판매완료">판매완료
								</label> <input type="hidden" name="itemNo" value="${itemVo.no}">
								<button type="submit" class="btn btn-default">적용</button>
							</form>
						</div>
						<p>
							<a href="#"><button type="button" class="btn btn-primary">
									재등록</button></a> <a href="#"><button type="button"
									class="btn btn-success">상단노출</button></a> <a
								href="/items/updateItem/${itemVo.no}"><button type="button"
									class="btn btn-warning">아이템수정</button></a> <a href="#" onclick="del_event();"><button
									type="button" class="btn btn-danger" >아이템삭제</button></a>
						</p>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
<script type="text/javascript">
	$(document).ready(
			function() {
				$(
						'input:radio[name=sellState]:input[value='
								+ "${itemVo.sellState}" + ']').attr("checked",
						true);
				/* $('#price').val().replace(/,/g, ''); */

				/* var splitCode = $("#splitCode").val().split(","); */
				/* var price = $("#price").val(); */
				var price = ${itemVo.price};
				price = Number(price).toLocaleString('en');
				console.log(price);
				$("#price").after(price + "원");

			});
</script>


<script>
	function del_event() {
		if (confirm("정말 삭제하시겠습니까??") == true) { //확인
			location.href="/items/itemDelete/" + ${itemVo.no};
		} else { 
			return;
		}
	}
	function setImage(obj) {
		$(".largeImg img").attr('src', obj);
	}
</script>

</html>