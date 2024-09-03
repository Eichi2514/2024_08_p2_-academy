<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="스테이지 : ${param.stage}"></c:set>

<%@ include file="../common/ingame_head.jspf"%>

<%
Map<String, Integer> codesMap = (Map<String, Integer>) request.getAttribute("codes");

// codesMap.get("Code") : 자바에서 랜덤으로 생성한 좌표
// *
// 2 : 한칸의 넓이
// +
// 8 : 벽의 넓이
// +
// vh : 화면 높이 단위

String mob2X = (codesMap.get("mob2XCode") * 2) + 8 + "vh";
String mob2Y = (codesMap.get("mob2YCode") * 2) + 8 + "vh";

String mob3X = (codesMap.get("mob3XCode") * 2) + 8 + "vh";
String mob3Y = (codesMap.get("mob3YCode") * 2) + 8 + "vh";

String mob4X = (codesMap.get("mob4XCode") * 2) + 8 + "vh";
String mob4Y = (codesMap.get("mob4YCode") * 2) + 8 + "vh";

String mob5X = (codesMap.get("mob5XCode") * 2) + 8 + "vh";
String mob5Y = (codesMap.get("mob5YCode") * 2) + 8 + "vh";

String mob6X = (codesMap.get("mob6XCode") * 2) + 8 + "vh";
String mob6Y = (codesMap.get("mob6YCode") * 2) + 8 + "vh";
%>

<style type="text/css">
.mob2 {
	top: <%=mob2X%>;
	left: <%=mob2Y%>;
}

.mob3 {
	top: <%=mob3X%>;
	left: <%=mob3Y%>;
}

.mob4 {
	top: <%=mob4X%>;
	left: <%=mob4Y%>;
}

.mob5 {
	top: <%=mob5X%>;
	left: <%=mob5Y%>;
}

.mob6 {
	top: <%=mob6X%>;
	left: <%=mob6Y%>;
}
</style>

<script type="text/javascript">
	function stageUp() {
		var stage = "${param.stage+1}";
		if (LR > 79 && 38 < UD && UD < 52) {
			location.href = '../map/front?stage=' + stage;
		}
	}
</script>

<script src="/resource/common_front.js" defer="defer"></script>

<img class="bg_img"
	src="https://github.com/user-attachments/assets/04fa2504-f697-4a59-8626-89551e8611da"
	alt="" />

<img class="door_right absolute"
	src="https://github.com/user-attachments/assets/5234ea4f-b28d-4528-87d7-44ead643cc33"
	alt="" />

<c:if test="${param.stage == 5}">
	<div class="guide1 bg-white text-center absolute">A W D S : 공격</div>
	<div class="guide2 bg-white text-center absolute">← ↑ → ↓ : 이동</div>
</c:if>

<c:if test="${room > 0 && room < 5}">
	<div class="front_mob mob2 absolute">
		<img class="front_mob_img" src="${mob}" alt="" />
	</div>
</c:if>

<c:if test="${room > 1 && room < 5}">
	<div class="front_mob mob3 absolute">
		<img class="front_mob_img" src="${mob}" alt="" />
	</div>
</c:if>

<c:if test="${room > 2 && room < 5}">
	<div class="front_mob mob4 absolute">
		<img class="front_mob_img" src="${mob}" alt="" />
	</div>
</c:if>

<c:if test="${room > 3 && room < 5}">
	<div class="front_mob mob5 absolute">
		<img class="front_mob_img" src="${mob}" alt="" />
	</div>
</c:if>

<c:if test="${floor > 1 && room == 0}">
	<div class="front_bossMob mob6 absolute">
		<img class="front_mob_img" src="${mob}" alt="" />
	</div>
</c:if>


<div class="front_charac charac absolute">
	<img class="front_attack Aattack hidden rounded-full absolute"
		src="${charac.extra__weapon}" alt="" />
	<img class="front_attack Wattack hidden rounded-full absolute"
		src="${charac.extra__weapon}" alt="" />
	<img class="front_attack Dattack hidden rounded-full absolute"
		src="${charac.extra__weapon}" alt="" />
	<img class="front_attack Sattack hidden rounded-full absolute"
		src="${charac.extra__weapon}" alt="" />
	<img class="front_charac_img rounded-full"
		src="https://github.com/user-attachments/assets/aaa05c2c-d55a-4111-b367-9231727e7050"
		alt="" />
</div>








<%@ include file="../common/foot.jspf"%>