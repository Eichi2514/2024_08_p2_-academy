<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/resource/common_front.js" defer="defer"></script>

<c:set var="pageTitle" value="스테이지 : ${param.stage}"></c:set>

<%@ include file="../common/ingame_head.jspf"%>

<%
Map<String, Integer> codesMap = (Map<String, Integer>) request.getAttribute("codes");

// codesMap.get("Code") : 자바에서 랜덤으로 생성한 좌표
// *
// 2 : 한칸의 넓이
// +
// 10 : 벽의 넓이
// -
// 2 : 인트배열에서 벽으로 주어진 넓이
// +
// vh : 화면 높이 단위

String mob2X = (codesMap.get("mob2XCode") * 2) + (10 - 2) + "vh";
String mob2Y = (codesMap.get("mob2YCode") * 2) + (10 - 2) + "vh";

String mob3X = (codesMap.get("mob3XCode") * 2) + (10 - 2) + "vh";
String mob3Y = (codesMap.get("mob3YCode") * 2) + (10 - 2) + "vh";

String mob4X = (codesMap.get("mob4XCode") * 2) + (10 - 2) + "vh";
String mob4Y = (codesMap.get("mob4YCode") * 2) + (10 - 2) + "vh";

String mob5X = (codesMap.get("mob5XCode") * 2) + (10 - 2) + "vh";
String mob5Y = (codesMap.get("mob5YCode") * 2) + (10 - 2) + "vh";

String mob6X = (codesMap.get("mob6XCode") * 2) + (10 - 2) + "vh";
String mob6Y = (codesMap.get("mob6YCode") * 2) + (10 - 2) + "vh";
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
	
	var UD2 = ${codes.get('mob2XCode') * 2 + (10 - 2)};
    var LR2 = ${codes.get('mob2YCode') * 2 + (10 - 2)};
    
    var UD3 = ${codes.get('mob3XCode') * 2 + (10 - 2)};
    var LR3 = ${codes.get('mob3YCode') * 2 + (10 - 2)};
    
    var UD4 = ${codes.get('mob4XCode') * 2 + (10 - 2)};
    var LR4 = ${codes.get('mob4YCode') * 2 + (10 - 2)};
    
    var UD5 = ${codes.get('mob5XCode') * 2 + (10 - 2)};
    var LR5 = ${codes.get('mob5YCode') * 2 + (10 - 2)};
    
    var UD6 = ${codes.get('mob6XCode') * 2 + (10 - 2)};
    var LR6 = ${codes.get('mob6YCode') * 2 + (10 - 2)};
	
    function getRandom(min, max) {
    	return Math.floor(Math.random() * (max - min + 1)) + min;
		}

	// 1초마다 랜덤 숫자를 출력하는 함수
	function move2() {
		// 1에서 5까지의 랜덤 숫자 생성
		const random = getRandom(1, 5);

		if (random == 1) {
			Left2(2);
		} else if (random == 2) {
			Up2(2);
		} else if (random == 3) {
			Right2(2);
		} else if (random == 4) {
			Down2(2);
		} else if (random == 5) {

		}
	}

	// 1초마다 랜덤 숫자를 출력하는 함수
	function move3() {
		// 1에서 5까지의 랜덤 숫자 생성
		const random = getRandom(1, 5);

		if (random == 1) {
			Left2(3);
		} else if (random == 2) {
			Up2(3);
		} else if (random == 3) {
			Right2(3);
		} else if (random == 4) {
			Down2(3);
		} else if (random == 5) {

		}
	}

	// 1초마다 랜덤 숫자를 출력하는 함수
	function move4() {
		// 1에서 5까지의 랜덤 숫자 생성
		const random = getRandom(1, 5);

		if (random == 1) {
			Left2(4);
		} else if (random == 2) {
			Up2(4);
		} else if (random == 3) {
			Right2(4);
		} else if (random == 4) {
			Down2(4);
		} else if (random == 5) {

		}
	}

	// 1초마다 랜덤 숫자를 출력하는 함수
	function move5() {
		// 1에서 5까지의 랜덤 숫자 생성
		const random = getRandom(1, 5);

		if (random == 1) {
			Left2(5);
		} else if (random == 2) {
			Up2(5);
		} else if (random == 3) {
			Right2(5);
		} else if (random == 4) {
			Down2(5);
		} else if (random == 5) {

		}
	}

	// 1초마다 랜덤 숫자를 출력하는 함수
	function move6() {
		// 1에서 5까지의 랜덤 숫자 생성
		const random = getRandom(1, 5);

		if (random == 1) {
			Left2(6);
		} else if (random == 2) {
			Up2(6);
		} else if (random == 3) {
			Right2(6);
		} else if (random == 4) {
			Down2(6);
		} else if (random == 5) {

		}
	}

		// 일정 시간마다 move 함수를 호출
		if(${room > 0 && room < 5}){setInterval(move2, 1000);}
		if(${room > 1 && room < 5}){setInterval(move3, 800);}
		if(${room > 2 && room < 5}){setInterval(move4, 600);}
		if(${room > 3 && room < 5}){setInterval(move5, 400);}
		if(${floor > 1 && room == 0}){setInterval(move6, 200);}

		function Up2(something) {
			$.ajax({
				url : '/usr/map/keyUp',
				type : 'POST',
				data : {
					something : something
				},
				dataType : 'text',
				success : function(data) {
					if (data == 'success') {
						if(something == 2){
							UD2 -= 2;
							$(".mob2").css("top", UD2 + "vh");
						}else if(something == 3){
							UD3 -= 2;
							$(".mob3").css("top", UD3 + "vh");
						}else if(something == 4){
							UD4 -= 2;
							$(".mob4").css("top", UD4 + "vh");
						}else if(something == 5){
							UD5 -= 2;
							$(".mob5").css("top", UD5 + "vh");
						}else if(something == 6){
							UD6 -= 2;
							$(".mob6").css("top", UD6 + "vh");
						}
						
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert('오류 발생 : ' + textStatus);
				}
			});
		}
		function Down2(something) {
			$.ajax({
				url : '/usr/map/keyDown',
				type : 'POST',
				data : {
					something : something
				},
				dataType : 'text',
				success : function(data) {
					if (data == 'success') {
						if(something == 2){
							UD2 += 2;
							$(".mob2").css("top", UD2 + "vh");
						}else if(something == 3){
							UD3 += 2;
							$(".mob3").css("top", UD3 + "vh");
						}else if(something == 4){
							UD4 += 2;
							$(".mob4").css("top", UD4 + "vh");
						}else if(something == 5){
							UD5 += 2;
							$(".mob5").css("top", UD5 + "vh");
						}else if(something == 6){
							UD6 += 2;
							$(".mob6").css("top", UD6 + "vh");
						}
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert('오류 발생 : ' + textStatus);
				}
			});
		}
		function Left2(something) {
			$.ajax({
				url : '/usr/map/keyLeft',
				type : 'POST',
				data : {
					something : something
				},
				dataType : 'text',
				success : function(data) {
					if (data == 'success') {
						if(something == 2){
							LR2 -= 2;
							$(".mob2").css("left", LR2 + "vh");
						}else if(something == 3){
							LR3 -= 2;
							$(".mob3").css("left", LR3 + "vh");
						}else if(something == 4){
							LR4 -= 2;
							$(".mob4").css("left", LR4 + "vh");
						}else if(something == 5){
							LR5 -= 2;
							$(".mob5").css("left", LR5 + "vh");
						}else if(something == 6){
							LR6 -= 2;
							$(".mob6").css("left", LR6 + "vh");
						}
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert('오류 발생 : ' + textStatus);
				}
			});
		}

		function Right2(something) {
			$.ajax({
				url : '/usr/map/keyRight',
				type : 'POST',
				data : {
					something : something
				},
				dataType : 'text',
				success : function(data) {
					if (data == 'success') {
						if(something == 2){
							LR2 += 2;
							$(".mob2").css("left", LR2 + "vh");
						}else if(something == 3){
							LR3 += 2;
							$(".mob3").css("left", LR3 + "vh");
						}else if(something == 4){
							LR4 += 2;
							$(".mob4").css("left", LR4 + "vh");
						}else if(something == 5){
							LR5 += 2;
							$(".mob5").css("left", LR5 + "vh");
						}else if(something == 6){
							LR6 += 2;
							$(".mob6").css("left", LR6 + "vh");
						}
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert('오류 발생 : ' + textStatus);
				}
			});
		}
</script>

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