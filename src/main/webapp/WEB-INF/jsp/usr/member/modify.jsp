<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="회원가입"></c:set>
<%@ include file="../common/head.jspf"%>

<script type="text/javascript">
	function MemberModify__submit(form) {
		form.loginPw.value = form.loginPw.value.trim();
		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();

		if (form.loginPwConfirm.value != form.loginPw.value) {
			alert('비번 불일치');
			return;
		}

		form.submit();
	}
</script>


<!-- p2 홈페이지 배경 -->
<img class="bg"
	src="https://github.com/user-attachments/assets/57d5f274-24c1-486b-9679-7aa7b6fa9017"
	alt="" />
<form onsubmit="MemberModify__submit(this); return false;"
	action="../member/doModify" method="POST">
	<div class="myPage_bg absolute">
		<img
			src="https://github.com/user-attachments/assets/b3351b33-5547-48b5-9108-78ef3c69c204"
			alt="" />
		<div class="myPage_title absolute text-center">내 정보</div>

		<div class="myPage_1 absolute" style="text-align: center;">
			<div class="myPage_label">아 이 디</div>
			<div class="myPage_body">${rq.loginedMember.loginId }</div>
		</div>
		<div class="myPage_2 absolute" style="text-align: center;">
			<div class="myPage_label">이 름</div>
			<div class="myPage_body">
				<input name="name" autocomplete="off" type="text" placeholder="이름"
					value="${rq.loginedMember.name }" style="text-align: center;" />
			</div>

		</div>
		<div class="myPage_3 absolute" style="text-align: center;">
			<div class="myPage_label">닉 네 임</div>
			<div class="myPage_body">
				<input name="nickname" autocomplete="off" type="text"
					placeholder="이름" value="${rq.loginedMember.nickname }"
					style="text-align: center;" />
			</div>
		</div>
		<div class="myPage_4 absolute" style="text-align: center;">
			<div class="myPage_label">새 비밀번호</div>
			<div class="myPage_body">
				<input name="loginPw" autocomplete="off" type="text"
					placeholder="새 비밀번호" style="text-align: center;" />
			</div>
		</div>
		<div class="myPage_5 absolute" style="text-align: center;">
			<div class="myPage_label">비밀번호 확인</div>
			<div class="myPage_body">
				<input name="loginPwConfirm" autocomplete="off" type="text"
					placeholder="비밀번호 확인" style="text-align: center;" />
			</div>
		</div>
		<button class="myPage_bt absolute text-center">수정</button>
		<button class="myPage_exit absolute text-center" type="button"
			onclick="history.back()">취소</button>
	</div>
</form>
</div>

<%@ include file="../common/foot.jspf"%>