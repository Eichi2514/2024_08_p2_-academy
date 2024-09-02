<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="튜토리얼"></c:set>
<%@ include file="../common/ingame_head.jspf"%>
<script src="/resource/common_front.js" defer="defer"></script>

<img class="bg_img"
	src="https://github.com/user-attachments/assets/04fa2504-f697-4a59-8626-89551e8611da"
	alt="" />

<img class="door_right absolute"
	src="https://github.com/user-attachments/assets/5234ea4f-b28d-4528-87d7-44ead643cc33"
	alt="" />

<div class="guide1 bg-white text-center absolute">A W D S : 공격</div>
<div class="guide2 bg-white text-center absolute">← ↑ → ↓ : 이동</div>


<div class="front_charac charac absolute">
<img class="front_attack attack hidden rounded-full absolute"
	src="${charac.extra__weapon}"
	alt="" />
<img class="front_charac_img rounded-full" src="https://github.com/user-attachments/assets/aaa05c2c-d55a-4111-b367-9231727e7050"
	alt="" />
</div>








<%@ include file="../common/foot.jspf"%>