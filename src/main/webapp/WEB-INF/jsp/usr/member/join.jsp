<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="회원가입"></c:set>
<%@ include file="../common/head.jspf"%>


<!-- p2 홈페이지 배경 -->
<img class="bg_img"
	src="https://github.com/user-attachments/assets/57d5f274-24c1-486b-9679-7aa7b6fa9017"
	alt="" />

<div class="doJoin_bg absolute">
<!-- p2 나무판 -->
<img class="doJoin_bg" src="https://github.com/user-attachments/assets/b3351b33-5547-48b5-9108-78ef3c69c204"
	alt="" />
	<div class="doJoin_title absolute text-center">회 원 가 입</div>

	<form method="POST" action="doJoin">
		<div class="doJoin_id absolute">
			<div class="label">아 이 디</div>
			<input type="text" placeholder="아이디 입력" name="loginId" />
		</div>
		<div class="doJoin_pw absolute">
			<div class="label">비밀번호</div>
			<input type="password" placeholder="비밀번호 입력" name="loginPw" />
		</div>
		<div class="doJoin_pw2 absolute">
			<div class="label">비밀번호 확인</div>
			<input type="password" placeholder="비밀번호 입력" name="loginPw2" />
		</div>
		<div class="doJoin_name absolute">
			<div class="label">이 름</div>
			<input type="text" placeholder="이름 입력" name="name" />
		</div>
		<div class="doJoin_nickname absolute">
			<div class="label">닉 네 임</div>
			<input type="text" placeholder="닉네임 입력" name="nickname" />
		</div>
		<div class="doJoin_gender absolute">
		<div class="label">성 별</div>
			<select class="doJoin_gender" name="gender">
				<option value="" selected disabled>선택</option>
				<option value="1">남자</option>
				<option value="0">여자</option>
			</select>
		</div>
		<button class="doJoin_bt absolute text-center" type="submit">회원가입</button>
		<a class="doJoin_exit absolute text-center" href="/">취소</a>

	</form>
</div>

<%@ include file="../common/foot.jspf"%>