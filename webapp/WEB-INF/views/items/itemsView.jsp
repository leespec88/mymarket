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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<title>${itemVo.title}</title>
<c:import url="/WEB-INF/views/include/head.jsp"></c:import>
</head>
<style>
textArea {
    resize: none;
}
.commentUser {
    margin: 0 41px 15px 41px;
    display: inline-block;
}
.listCommentLine {
    padding: 10px;
}
.commentTitle {
    margin: 0 41px;
    padding: 20px 0;
}
.commnetTextArea {
    width: 541px;
}
.commnetTextArea {
    height: 64px;
    overflow-y: hidden;
    font-size: 12px;
    float: left;
}
.detailBenner2 {
	margin: 0 20px 16px 20px;
}

.detailBenner {
	width: 353px;
	min-height: 452px;
	float: left;
}

.descriptionText {
	font-size: 12px;
	color: #666;
	padding: 23px 0 20px 10px;
	line-height: 18px;
}

.description {
	border-bottom: 1px solid #999;
	margin: 41px 41px 0 41px;
}

.detailBoxBottom {
	width: 978px;
	margin-top: 20px;
	border: 1px solid #ddd;
	min-height: 300px;
	overflow: hidden;
	margin-left: 10px;
	margin-bottom: 30px;
}

.descriptionText {
	font-size: 12px;
	color: #666;
	padding: 23px 0 20px 10px;
	line-height: 18px;
}

.detailComment {
	width: 623px;
	background-color: #fff;
	float: left;
	border-right: 1px solid #ddd;
	min-height: 615px;
}

.detailBoxBottom {
	width: 978px;
	margin-top: 20px;
	border: 1px solid #ddd;
	min-height: 300px;
	overflow: hidden;
	margin-left: 10px;
	margin-bottom: 30px;
}

.smallImg {
	float: left;
	width: 48px;
	height: 408px;
}

.mainArea {
	clear: both;
	height: 100%;
	margin: 0 auto;
	display: table;
}

.detailBoxTop {
	height: 408px;
	width: 990px;
	z-index: 500;
}

.itemInfo {
	width: 478px;
	min-height: 240px;
	float: left;
	border: 1px solid #ddd;
	background-color: #fff;
	margin-bottom: 20px;
}

.largeImg .view {
	width: 408px;
	height: 408px;
	float: left;
}

.itemImg {
	
}

.mainAreaCenter {
	margin-left: 20%;
	margin-top: 5%;
}

.phone {
	width: 23px;
	height: 23px;
}

.itemInfo .itemPrice {
	height: 35px;
	font-size: 26px;
	font-weight: bold;
	color: #00aeff;
	margin-left: 21px;
	margin-top: 5px;
}

.itemInfo .itemTitleArea {
	margin: 21px 21px 0 21px;
	display: block;
}

.itemUserInfo {
	height: 144px;
	width: 478px;
	border: 1px solid #ddd;
	background-color: #fff;
	float: left;
	z-index: 500;
}

.itemInfo {
	width: 478px;
	min-height: 240px;
	float: left;
	border: 1px solid #ddd;
	background-color: #fff;
	margin-bottom: 20px;
}

.photoArea {
	width: 466px;
	float: left;
	margin-right: 34px;
}
</style>

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
							<img src="/assets/images/ico_item_details_location.png"
								width="23" height="23"> <span class="itemAddrTxt">${itemVo.address}</span>
						</div>



						<div class="itemUserInfo">
							<!-- <div class="profileImg">
							<a href=""><img width="94" height="94" src=""></a>
						</div> -->
							<div class="nick">
								<a href="">${userVo.name}</a>
							</div>
							<!-- <div class="itemCount">
							<a href="">등록 아이템 : 17</a>
						</div> -->
							<div class="userInfoBtn" id="sellerInfoBtn"></div>
							<div class="itemUserContacts" id="itemUserContacts">
								<div>
									<img class="phone" src="/assets/images/phone.png">${userVo.phone}
								</div>
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
						<img src="/assets/images/img_item_details_title_reply.png" alt="댓글달기" id="commentTitImg"> <span>(6)</span> <input
							type="hidden" id="commentCount" value="6">
					</div>
					<div id="commentArea" class="comment">
						<div class="commentBody">
							<span class="commentBodyContent"> <span
								class="commentTextName"></span> <span class="commentTextTime"></span>
							</span>
							<p class="commentTextDesc"></p>
						</div>
						<div class="listComment" id="answer_text_7166226">
							<div class="commentAnswerArea">
								
							</div>
						</div>
					</div>
					<div class="commentUser">
						<textarea placeholder="댓글을 입력해주세요." class="commnetTextArea"
							id="commnetTextArea" maxlength="500"></textarea>
					</div>

				</div>
				<div class="detailBenner">
					<div class="detailBenner1">
						<img src="/assets/images/img_side_clean_market_titletext.png"">
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
						<a href="/terms.hm"><span>- 모든 금지 아이템 보기</span></a> <br>
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
				</div>
			</div>
		</div>
	</div>

</body>
<script>
	function setImage(obj) {
		$(".largeImg img").attr('src', obj);
	}
</script>
</html>
