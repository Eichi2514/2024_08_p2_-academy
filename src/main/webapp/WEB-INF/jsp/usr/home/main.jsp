<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="메인"></c:set>
<%@ include file="../common/head.jspf"%>
<!-- p2 홈페이지 배경 -->
<img class="bg_img"
	src="https://github.com/user-attachments/assets/57d5f274-24c1-486b-9679-7aa7b6fa9017"
	alt="" />
	
<!-- p2 두루마리 -->
<div class="TOP3 absolute">
	<img class="TOP3_img absolute"
		src="https://github.com/user-attachments/assets/2ad87f22-47df-4929-9e1d-10b172cb3aa7"
		alt="" />

	<table class="TOP3_table absolute">
		<caption style="padding-bottom: 1vh;">TOP 3</caption>
		<tbody>
			<c:forEach var="scoreboard" items="${scoreboards}">
				<tr>
					<td style="text-align: center; padding: 0;">${scoreboard.extra__user}</td>
					<td
						style="text-align: center; padding-left: 1vh; padding-right: 1vh; padding-top: 0; padding-bottom: 1vh;">:</td>
					<td
						style="text-align: center; padding-left: 0; padding-right: 0.5vh; padding-top: 0; padding-bottom: 0;">
						${scoreboard.room == 0 ? scoreboard.floor-1 : scoreboard.floor}층</td>

					<td style="text-align: center; padding: 0;">${scoreboard.room == 0 ? '보스' : scoreboard.room}${scoreboard.room == 0 ? '방' : '번방'}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>

	<a class="TOP3_list_bt absolute z-30" href="../scoreboard/list">리스트</a>
</div>

<form method="POST" action="../member/doLogin">
	<c:if test="${!rq.isLogined() }">

		<div class="id absolute">
			I D : <input type="text" placeholder="아이디 입력" name="loginId" />
		</div>

		<div class="pw absolute">
			PW : <input type="password" placeholder="비밀번호 입력" name="loginPw" />
		</div>

		<a class="join_bt text-center absolute" href="../member/join">회 원
			가 입</a>


		<button class="login_out_bt absolute text-center" type="submit">로
			그 인</button>
	</c:if>
	<c:if test="${rq.isLogined() }">

		<a class="join_bt text-center absolute" href="../member/myPage">내
			정 보</a>

		<div class="member_name1 absolute text-center">${rq.loginedMember.nickname }님</div>
		<div class="member_name2 absolute text-center">환영합니다</div>
		<div class="start absolute cursor-pointer">
			<a class="start-text absolute"
				href="../map/front?stage=${(charac.floor * 5) + charac.room}">게임시작</a>
			<!-- p2 게임시작 호버 전 -->
			<img class="start-1"
				src="https://github.com/user-attachments/assets/dddce550-c44d-45df-adfb-479191d45307"
				alt="" />
			<!-- p2 게임시작 호버 후 -->
			<img class="start-2"
				src="https://github.com/user-attachments/assets/7afa0678-efe6-4107-ab0f-a154bd841994"
				alt="" />
		</div>
		<div>
			<a class="login_out_bt absolute text-center"
				href="../member/doLogout">로그아웃</a>
		</div>
	</c:if>
</form>
</div>
</body>
</html>