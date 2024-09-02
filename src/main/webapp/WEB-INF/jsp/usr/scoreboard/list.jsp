<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="점수기록"></c:set>
<%@ include file="../common/head.jspf"%>


<!-- p2 홈페이지 배경 -->
<img class="bg_img"
	src="https://github.com/user-attachments/assets/57d5f274-24c1-486b-9679-7aa7b6fa9017"
	alt="" />

<div class="scoreboard_bg absolute">
	<!-- p2 나무판 -->
	<img class="scoreboard_bg"
		src="https://github.com/user-attachments/assets/2ad87f22-47df-4929-9e1d-10b172cb3aa7"
		alt="" />

	<table class="scoreboard_table absolute">
		<caption style="padding-bottom: 7vh;">SCORE</caption>
		<tbody>
			<c:forEach var="scoreboard" items="${scoreboards}">
				<tr>
					<td style="text-align: center; padding: 0;">${scoreboard.extra__user}</td>
					<td
						style="text-align: center; padding-left: 1vh; padding-right: 1vh; padding-top: 0; padding-bottom: 0;">
						:</td>
					<td
						style="text-align: center; padding-left: 0; padding-right: 0.5vh; padding-top: 0; padding-bottom: 0;">${scoreboard.floor}층</td>
					<td style="text-align: center; padding: 0;">${scoreboard.room}번방</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a class="pagination_left absolute" href="list?&page=${lpage}"><i class="fa-solid fa-caret-left" style="font-size: 10vh;"></i></a>
	<a class="pagination_right absolute" href="list?page=${rpage}"><i class="fa-solid fa-caret-right" style="font-size: 10vh;"></i></a>
	<a class="scoreboard_exit_bt absolute" href="../home/main">나가기</a>

	<div class="pagination flex justify-center absolute">
		<c:set var="paginationLen" value="3" />
		<c:set var="startPage"
			value="${page -  paginationLen  >= 1 ? page - paginationLen : 1}" />
		<c:set var="endPage"
			value="${page +  paginationLen  <= totalPage ? page + paginationLen : totalPage}" />
		<c:if test="${startPage > 1 }">
			<a href="?page=1&${baseUri}">1</a>
		</c:if>
		<c:if test="${startPage > 2 }">
			<button>...</button>
		</c:if>
		<c:forEach begin="${startPage }" end="${endPage }" var="i">
			<a class="${page == i ? 'text-red-500' : '' }" href="list?page=${i }">${i }</a>
		</c:forEach>
		<c:if test="${endPage < totalPage - 1 }">
			<button>...</button>
		</c:if>
		<c:if test="${endPage < totalPage }">
			<a href="list?page=${totalPage }">${totalPage }</a>
		</c:if>
	</div>


</div>

<%@ include file="../common/foot.jspf"%>