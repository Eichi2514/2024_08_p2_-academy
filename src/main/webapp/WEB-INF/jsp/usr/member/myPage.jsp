<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="내 정보"></c:set>
<%@ include file="../common/head.jspf"%>


<!-- p2 홈페이지 배경 -->
<img class="bg_img"
	src="https://github.com/user-attachments/assets/57d5f274-24c1-486b-9679-7aa7b6fa9017"
	alt="" />

<div class="myPage_bg absolute">
   <!-- p2 나무 판 -->
	<img class="myPage_bg"
		src="https://github.com/user-attachments/assets/b3351b33-5547-48b5-9108-78ef3c69c204"
		alt="" />
	<div class="myPage_title absolute text-center">내 정보</div>

	<div class="myPage_1 absolute" style="text-align: center;">
		<div class="myPage_label">가 입 일</div>
		<div class="myPage_body">${rq.loginedMember.regDate }</div>
	</div>
	<div class="myPage_2 absolute" style="text-align: center;">
		<div class="myPage_label">아 이 디</div>
		<div class="myPage_body">${rq.loginedMember.loginId }</div>
	</div>
	<div class="myPage_3 absolute" style="text-align: center;">
		<div class="myPage_label">이 름</div>
		<div class="myPage_body">${rq.loginedMember.name }</div>

	</div>
	<div class="myPage_4 absolute" style="text-align: center;">
		<div class="myPage_label">닉 네 임</div>
		<div class="myPage_body">${rq.loginedMember.nickname }</div>
	</div>
	<div class="myPage_5 absolute" style="text-align: center;">
		<div class="myPage_label">성 별</div>
		<c:if test="${rq.loginedMember.gender==1}">
			<div class="myPage_body">남 성</div>
		</c:if>
		<c:if test="${rq.loginedMember.gender==0}">
			<div class="myPage_body">여 성</div>
		</c:if>
	</div>
	<a class="myPage_bt absolute text-center" href="../member/checkPw">수정</a>
	<button class="myPage_exit absolute text-center" type="button" onclick="history.back()">취소</button>
</div>
</div>

<%@ include file="../common/foot.jspf"%>