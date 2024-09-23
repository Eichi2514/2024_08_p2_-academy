<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="게임 오버 : ${param.stage}"></c:set>

<%@ include file="../common/head.jspf"%>

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

<!-- p2 게임오버화면 -->
<img class="bg_img"
	src="https://github.com/user-attachments/assets/6189d3bf-ab54-4bc9-acbb-42b964b6ecb3"
	alt="" />
<div class="over absolute z-10">
	<a class="over_bt absolute" href="../home/main">GAME OVER</a>
</div>

</div>
</body>
</html>