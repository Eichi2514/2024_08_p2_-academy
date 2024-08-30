<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="내 정보 - 비밀번호 확인"></c:set>
<%@ include file="../common/head.jspf"%>


<!-- p2 홈페이지 배경 -->
<img class="bg_img"
	src="https://github.com/user-attachments/assets/57d5f274-24c1-486b-9679-7aa7b6fa9017"
	alt="" />

<div class="myPage_bg absolute">
	<form action="../member/doCheckPw" method="POST">
		<img
			src="https://github.com/user-attachments/assets/b3351b33-5547-48b5-9108-78ef3c69c204"
			alt="" />
		<div class="myPage_title absolute text-center">내 정보</div>

		<div class="myPage_2 absolute" style="text-align: center;">
			<div class="myPage_label">아 이 디</div>
			<div class="myPage_body">${rq.loginedMember.loginId }</div>
		</div>
		<div class="myPage_4 absolute" style="text-align: center;">
			<div class="myPage_label">비 밀 번 호</div>
			<div class="myPage_body">
				<input name="loginPw" autocomplete="off" type="text"
					placeholder="비밀번호" />
			</div>
		</div>
		<button class="myPage_bt absolute text-center">로그인</button>
		<button class="myPage_exit absolute text-center" type="button"
			onclick="history.back()">취소</button>
	</form>
</div>
</div>

<%@ include file="../common/foot.jspf"%>