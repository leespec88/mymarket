<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- Latest compiled JavaScript -->
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="/assets/css/items_infoview.css" type="text/css">
<title>${itemVo.title}</title>
<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
</head>

<body>
	<div class="mainAreaCenter">
		<div class="main">
			<div class="detailBox">
				<div class="detailBoxTop">
					<div class="photoArea">
						<!-- 썸네일 -->
						<div class="largeImg" id="largeImg">
							<img src="${fileList[0].IMAGE}" id="view" class="view"
								style="opacity: 1;">
						</div>
						<div id="locationImgMap" class="locationImgMap"
							style="display: none;"></div>
						<div class="smallImg">
							<c:forEach var="file" items="${fileList}">
								<div>
									<img src="${file.IMAGE}" width="48" height="48"
										id="${file.IMAGE}"
										onmouseover="javascript:setImage('${file.IMAGE}');">
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="itemInfo">
						<div class="itemTitleArea">
							<span class="itemTag"> <c:if
									test="${itemVo.itemCondition == '중고' }">
									<img src="/assets/images/img_tag_used_type_01.png" />
								</c:if> <c:if test="${itemVo.itemCondition == '신품' }">
									<img src="/assets/images/img_tag_used_type_03.png" />
								</c:if> <c:if test="${itemVo.shippingFee == '포함' }">
									<img src="/assets/images/img_tag_option_01.png" />
								</c:if>
							</span> <span class="itemTitle" id="itemTitle">${itemVo.title }</span>
						</div>
						<div class="itemPrice">${itemVo.price}원</div>
						<div class="itemAddrArea">
							<img src="/assets/images/ico_item_details_location.png"	width="23" height="23"> <span class="itemAddrTxt">${itemVo.address}</span>
						</div>
					</div>
					<div class="itemUserInfo">
							<div class="profileImg">
								<a href=""><img width="94" height="94" src="/assets/css/images/img_itemdetail_profile_noimage.png"></a>
							</div>
						<div class="nick">
							<a href="">${userVo.name}</a>
						</div>
						<div class="itemCount">
							<a href="/items/userItemList/${userVo.no}">등록 아이템 : ${regItemCnt}</a>
						</div>
							<div class="userInfoBtn" id="sellerInfoBtn"></div>
							<div class="itemUserContacts" id="itemUserContacts">
								<div>
									<img class="phone" src="/assets/images/phone.png">${userVo.phone}
								</div>
							</div>
						</div>
				</div>
			</div>
			<div class="detailBoxBottom">
				<div class="detailComment">

					<div class="description">
						<img src="/assets/images/img_item_details_title_description.png"
							alt="상세설명">

						<div class="descriptionText">${itemVo.content}</div>
					</div>
					<div class="commentTitle" id="commentTitle">
						<img src="/assets/images/img_item_details_title_reply.png" alt="댓글달기" id="commentTitImg"> <span>(${replyCnt})</span> 
						<input type="hidden" id="commentCount" value="${replyCnt}">
					</div>
					<div>
					<script>
					function testOne(reply){
						$("#"+reply).toggle();
					}
					</script>
						<c:forEach var="reply" items="${replyList}">
							<div class="tb-reply" id="addedFormDiv">
							<table class="">
								<tr>
									<c:if test="${reply.depth != 0}">
									<td style="padding-left:${reply.depth*30}px"><input
										type="hidden" name="articleNo" value="">
									<td><img src="/assets/css/images/gc_img.gif"></td></c:if>
									<td>${reply.userName}</td>
									<td><div class="replyregdate">${reply.regDate}</div></td>
									<td>
									<a href="javascript:testOne(${reply.no})" class="subreply" data-toggle="tooltip" data-placement="" title="답장하기">
										<span  class="glyphicon glyphicon-share-alt"></span></a>
									</td>
									<td>
										<c:if test="${not empty authUser && reply.userNo == authUser.no }">
											<a href="/items/deletereply/${reply.no}?itemNo=${reply.boardNo}" title="삭제하기">
											<span class="glyphicon glyphicon-trash" ></span></a>
										</c:if>
									</td>
								</tr>
							</table>
							<div id="junki" style="padding-left:${reply.depth*30}px">
								<pre class="commentTextDesc">${reply.content}</pre>
							</div>
							
							<div class="rereply" id="${reply.no}" style="display:none">
								<form class="answerArea" action="/items/subreply/" method="post">
								<input type="hidden" name="replyNo" value="${reply.no}" >
								<input type="hidden" name="parentGroupNo" value="${reply.groupNo}" >
										<textarea class="commentTextDesc" placeholder="댓글을 입력해주세요." class="commnetTextArea" name="replyContent" id="commnetTextArea" maxlength="500"></textarea>
										<input class="commentBtn" id="commentBtn" type="image" src="/assets/images/btn_input_comment_normal.png" alt="Submit Form" />
								</form>
							</div>
							</div>
						</c:forEach>
				</div>
					<div class="commentUser">
					<form class="board-reply_form" action="/items/addreply/${itemVo.no}" method="post">
						<textarea placeholder="댓글을 입력해주세요." class="commnetTextArea" name="content"	id="commnetTextArea" maxlength="500"></textarea>
						<input class="commentBtn" id="commentBtn" type="image" src="/assets/images/btn_input_comment_normal.png" alt="Submit Form" />
						</form>
					</div>

				</div>
				<div class="detailBenner">
				   <c:if test="${authUser.no != userVo.no }">
					<div class="detailBenner1">
						<img src="/assets/images/img_side_clean_market_titletext.png">
					</div>
					<div class="detailBenner2">
						<span>사람들의 눈살을 찌푸리게 하는,거래금지 아이템은 자제해주세요!</span>
					</div>
					<div class="detailBenner3">
						<span>- 담배, 전자담배</span> <br> <span>- 술</span> <br> <span>-
							렌즈 (콘택트, 써클)</span> <br> <span>- 의약품</span> <br> <span>-
							성인용품 (콘돔 제외)</span> <br> <span>- 일부 수제식품</span> <br> <span>-
							불법 도박 관련 글 (토토 등)</span> <br> <span>- 불법시술 (타투 등)</span> <br>
						<span>- 주민등록증/운전면허증</span> <br> <span>- 불법 소프트웨어 복제품</span> <br>
					</div>
					<div class="detailLine"></div>

					<div class="detailBenner4">
						<img src="/assets/images/img_side_clean_market_titletext.png">
					</div>
					<div class="detailBenner2">
						<span>에티켓을 지키면 꼭 돌아오는 법! 비매너 행위는 자제해주세요~</span>
					</div>
					<div class="detailBenner3">
						<span>- 도배성 행위</span> <br> <span>- 욕설/비하적 행위</span> <br>
						<span>- 선정적인 사진/내용</span> <br> <span>- 스토킹 등 다른 회원을
							괴롭히는 행위</span> <br> <span>- 커뮤니티에 홍보글/아이템 등록</span> <br> <span>-
							성의 없이 무의미한 아이템 등록</span> <br> <span>- 그 외 운영측 판단에 거래를 방해하는
							행위</span> <br>
					</div>
					</c:if>
					 <c:if test="${authUser.no == userVo.no }">
					<div class="detailBenner">
							<div class="detailbtnArea">
								<img src="/assets/images/img_side_item_management_title.png" alt="아이템 판매 관리 텍스트" width="162" height="33" class="itemManagerTit">
								<img src="/assets/images/img_item_details_title_description.png" alt="아이템 판매 관리 텍스트" width="59" height="15" class="itemStatTit">
								<form action="/items/updateSellState/${itemVo.no}" method="post"><div class="itemStatArea">
									<div>
			                			<input type="radio" class="radio1" id="sellState01" name="sellState" value="판매중 " >
			                			<label class="label2" for="sellState01">판매중</label>
			                		</div>
			                		<div>
			                			<input type="radio" class="radio1" id="sellState02" name="sellState" value="예약중" >
			                			<label class="label2" for="sellState02">예약중</label>
			                		</div>
			                		<div>
			                			<input type="radio" class="radio1" id="sellState03" name="sellState" value="판매완료" >
			                			<label class="label2" for="sellState03">판매완료</label>
			                		</div>
			                		<div><button class="sellStateBtn" id="sellStateBtn" type="sumbit"></button></div>
								</div></form>
								<span class="cloneBtn" id="noCloneBtn"></span>
								<span class="sorttimeBtn" id="sorttimeBtn"></span>
								<hr color="#d0d0d0">
								<span class="itemModifybtn" id="itemModify"></span>
								<a href="/items/itemDelete/${itemVo.no}"><span class="itemDelete" id="itemDelete"></span></a>
							</div>
						</div>
						</c:if>
				</div>
			</div>
		</div>
	</div>

</body>
<script>
	function setImage(obj) {
		$(".largeImg img").attr('src', obj);
	}
	/* function checkSellState(){
		document.getElementById("sellState01").getAttribute(name)
		document.getElementById("sellState02")
		document.getElementById("sellState03")
	} */
</script>
</html>
