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
    // 캐릭터 정보
    var front_hp = "${charac.hp}";
    var stage;
    var front_weaponId = "${charac.weaponId}";

    // 스테이지 이동
	function stageUp() {
		stage = "${param.stage+1}";
		var doorChack = $(".door").hasClass("hidden");
		if (LR > 79 && 38 < UD && UD < 52 && !doorChack) {
			$(".door").fadeOut(1000).addClass('hidden');
			$(".mob2").fadeIn(1000).removeClass('hidden');
			$(".mob3").fadeIn(1000).removeClass('hidden');
			$(".mob4").fadeIn(1000).removeClass('hidden');
			$(".mob5").fadeIn(1000).removeClass('hidden');
			$(".mob6").fadeIn(1000).removeClass('hidden');
			location.href = '../map/front?stage=' + stage;
			console.log("HP:", front_hp);
			console.log("Stage:", stage);
			console.log("Weapon ID:", front_weaponId);
			update(front_hp, stage, front_weaponId);
		}
	}  
    
    // 캐릭터 정보 업데이트
	function update(hp, stage, weaponId) {
		$.ajax({
			url : '/usr/charac/update',
			type : 'POST',
			data : {
				hp : hp,
				stage : stage,
				weaponId : weaponId
			},
			dataType : 'text',
			success : function(data) {
			},
			error : function(jqXHR, textStatus, errorThrown) {
				alert('오류 발생 : ' + textStatus);
			}
		});
	}
	
    // 몬스터 좌표 셋팅
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

    // 몬스터 hp 셋팅
    var mob2_hp = 0;
    var mob3_hp = 0;
    var mob4_hp = 0;
    var mob5_hp = 0;
    var mob6_hp = 0;
    
	// 일정 시간마다 move 함수를 호출
	if(${room > 0 && room < 5}){mob2_hp = ${floor};}
	if(${room > 1 && room < 5}){mob3_hp = ${floor};}
	if(${room > 2 && room < 5}){mob4_hp = ${floor};}
	if(${room > 3 && room < 5}){mob5_hp = ${floor};}
	if(${floor > 1 && room == 0}){mob6_hp = ${floor*10};}
	
	// 랜덤 숫자 생성
    function getRandom(min, max) {
    	return Math.floor(Math.random() * (max - min + 1)) + min;
		}

	// 1초마다 랜덤 숫자를 출력하는 함수
	function move2() {
		var random;
		// 1에서 5까지의 랜덤 숫자 생성
		if (${floor < 4}){random = getRandom(1, 4);}
		else {random = getRandom(1, 5);}

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
		var random;
		// 1에서 5까지의 랜덤 숫자 생성
		if (${floor < 4}){random = getRandom(1, 4);}
		else {random = getRandom(1, 5);}

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
		var random;
		// 1에서 5까지의 랜덤 숫자 생성
		if (${floor < 4}){random = getRandom(1, 4);}
		else {random = getRandom(1, 5);}

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
		var random;
		// 1에서 5까지의 랜덤 숫자 생성
		if (${floor < 4}){random = getRandom(1, 4);}
		else {random = getRandom(1, 5);}

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
		var random;
		// 1에서 5까지의 랜덤 숫자 생성
		if (${floor < 4}){random = getRandom(1, 4);}
		else {random = getRandom(1, 5);}

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
        
		// 이동 메소드 실행
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
					} else if (data == 'charac') {
						hpDown();
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
					} else if (data == 'charac') {
						hpDown();
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
						console.log('HP : ' + front_hp);
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
					} else if (data == 'charac') {
						hpDown();						
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
					} else if (data == 'charac') {
						hpDown();
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert('오류 발생 : ' + textStatus);
				}
			});
		}
		
// hp 감소
function hpDown(){
	front_hp -= 1;
	$('.hp_bar').text(front_hp);
	if(front_hp == 0){
		scoreboardLog();
		location.href = '../map/over';
		}
}

// 죽었을 시 기록 남기기
function scoreboardLog() {
    $.ajax({
        url : '/usr/scoreboard/log',
        type : 'POST',
        dataType : 'text',
        error : function(jqXHR, textStatus, errorThrown) {
            alert('오류 발생 : ' + textStatus);
        }
    });
}

		
// 문 개방
function showDoor(){
	if(mob2_hp+mob3_hp+mob4_hp+mob5_hp+mob6_hp == 0){
		$(".door").fadeIn(1000).removeClass('hidden');
	}
}

// 몬스터 처치 시 자바 맵에서도 삭제
function doDelete(something) {
	$.ajax({
		url : '/usr/map/delete',
		type : 'POST',
		data : {
			something : something
		},
		dataType : 'text',
		success : function(data) {
		},
		error : function(jqXHR, textStatus, errorThrown) {
			alert('오류 발생 : ' + textStatus);
		}
	});
}	

// 자동 실행 move 함수 담아놓을 변수 생성
var stop2, stop3, stop4, stop5, stop6;

//일정 시간마다 move 함수를 호출
function show(){
	if(${room > 0 && room < 5}){stop2 = setInterval(move2, 1000);}
	if(${room > 1 && room < 5}){stop3 = setInterval(move3, 800);}
	if(${room > 2 && room < 5}){stop4 = setInterval(move4, 500);}
	if(${room > 3 && room < 5}){stop5 = setInterval(move5, 200);}			
	if(${floor > 1 && room == 0}){stop6 = setInterval(move6, 100);}			
   }

// 캐릭터 공격
       function attackA_motion() {
		    $(".Aattack").removeClass('hidden');
		 	setTimeout(function() {
		 		$(".Aattack").addClass('hidden');
		 	}, 100)
		 }

		function attackW_motion() {
			$(".Wattack").removeClass('hidden');
			setTimeout(function() {
				$(".Wattack").addClass('hidden');
			}, 100)
		}

		function attackD_motion() {
			$(".Dattack").removeClass('hidden');
			setTimeout(function() {
				$(".Dattack").addClass('hidden');
			}, 100)
		}

		function attackS_motion() {
			$(".Sattack").removeClass('hidden');
			setTimeout(function() {
				$(".Sattack").addClass('hidden');
			}, 100)
		}	

	       function attackA(something) {
				$.ajax({
					url : '/usr/map/Aattack',
					type : 'POST',
					data : {
						something : something
					},
					dataType : 'text',
					success : function(data) {
						// console.log("몬스터"+data+"Attack");						 
						if (data == 2) {
							mob2_hp -= 1;
							if(mob2_hp == 0){
								$(".mob2").fadeOut(10000).addClass('hidden');
							    clearInterval(stop2);
							    doDelete(2);
							}
						} else if (data == 3) {
							mob3_hp -= 1;
							if(mob3_hp == 0){
								$(".mob3").fadeOut(10000).addClass('hidden');
								clearInterval(stop3);
								doDelete(3);
							}
						} else if (data == 4) {
							mob4_hp -= 1;
							if(mob4_hp == 0){
								$(".mob4").fadeOut(10000).addClass('hidden');
								clearInterval(stop4);
								doDelete(4);
							}
						} else if (data == 5) {
							mob5_hp -= 1;
							if(mob5_hp == 0){
								$(".mob5").fadeOut(10000).addClass('hidden');
								clearInterval(stop5);
								doDelete(5);
							}
						} else if (data == 6) {
							mob6_hp -= 1;
							if(mob6_hp == 0){
								$(".mob6").fadeOut(10000).addClass('hidden');
								clearInterval(stop6);
								doDelete(6);
							}
						} 
						// console.log("몬스터2 hp : " + mob2_hp);
						// console.log("몬스터3 hp : " + mob3_hp);
						// console.log("몬스터4 hp : " + mob4_hp);
						// console.log("몬스터5 hp : " + mob5_hp);
						// console.log("몬스터6 hp : " + mob6_hp);
						showDoor();
						attackA_motion();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert('오류 발생 : ' + textStatus);
					}
				});
			}	

	       function attackW(something) {
				$.ajax({
					url : '/usr/map/Wattack',
					type : 'POST',
					data : {
						something : something
					},
					dataType : 'text',
					success : function(data) {
						// console.log("몬스터"+data+"Attack");						 
						if (data == 2) {
							mob2_hp -= 1;
							if(mob2_hp == 0){
								$(".mob2").fadeOut(10000).addClass('hidden');
							    clearInterval(stop2);
							    doDelete(2);
							}
						} else if (data == 3) {
							mob3_hp -= 1;
							if(mob3_hp == 0){
								$(".mob3").fadeOut(10000).addClass('hidden');
								clearInterval(stop3);
								doDelete(3);
							}
						} else if (data == 4) {
							mob4_hp -= 1;
							if(mob4_hp == 0){
								$(".mob4").fadeOut(10000).addClass('hidden');
								clearInterval(stop4);
								doDelete(4);
							}
						} else if (data == 5) {
							mob5_hp -= 1;
							if(mob5_hp == 0){
								$(".mob5").fadeOut(10000).addClass('hidden');
								clearInterval(stop5);
								doDelete(5);
							}
						} else if (data == 6) {
							mob6_hp -= 1;
							if(mob6_hp == 0){
								$(".mob6").fadeOut(10000).addClass('hidden');
								clearInterval(stop6);
								doDelete(6);
							}
						}   
						// console.log("몬스터2 hp : " + mob2_hp);
						// console.log("몬스터3 hp : " + mob3_hp);
						// console.log("몬스터4 hp : " + mob4_hp);
						// console.log("몬스터5 hp : " + mob5_hp);
						// console.log("몬스터6 hp : " + mob6_hp);
						showDoor();
						attackW_motion();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert('오류 발생 : ' + textStatus);
					}
				});
			}	

	       function attackD(something) {
				$.ajax({
					url : '/usr/map/Dattack',
					type : 'POST',
					data : {
						something : something
					},
					dataType : 'text',
					success : function(data) {
						// console.log("몬스터"+data+"Attack");						 
						if (data == 2) {
							mob2_hp -= 1;
							if(mob2_hp == 0){
								$(".mob2").fadeOut(10000).addClass('hidden');
							    clearInterval(stop2);
							    doDelete(2);
							}
						} else if (data == 3) {
							mob3_hp -= 1;
							if(mob3_hp == 0){
								$(".mob3").fadeOut(10000).addClass('hidden');
								clearInterval(stop3);
								doDelete(3);
							}
						} else if (data == 4) {
							mob4_hp -= 1;
							if(mob4_hp == 0){
								$(".mob4").fadeOut(10000).addClass('hidden');
								clearInterval(stop4);
								doDelete(4);
							}
						} else if (data == 5) {
							mob5_hp -= 1;
							if(mob5_hp == 0){
								$(".mob5").fadeOut(10000).addClass('hidden');
								clearInterval(stop5);
								doDelete(5);
							}
						} else if (data == 6) {
							mob6_hp -= 1;
							if(mob6_hp == 0){
								$(".mob6").fadeOut(10000).addClass('hidden');
								clearInterval(stop6);
								doDelete(6);
							}
						}  
						// console.log("몬스터2 hp : " + mob2_hp);
						// console.log("몬스터3 hp : " + mob3_hp);
						// console.log("몬스터4 hp : " + mob4_hp);
						// console.log("몬스터5 hp : " + mob5_hp);
						// console.log("몬스터6 hp : " + mob6_hp);
						showDoor();
						attackD_motion();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert('오류 발생 : ' + textStatus);
					}
				});
			}	

	       function attackS(something) {
				$.ajax({
					url : '/usr/map/Sattack',
					type : 'POST',
					data : {
						something : something
					},
					dataType : 'text',
					success : function(data) {
						// console.log("몬스터"+data+"Attack");						 
						if (data == 2) {
							mob2_hp -= 1;
							if(mob2_hp == 0){
								$(".mob2").fadeOut(10000).addClass('hidden');
							    clearInterval(stop2);
							    doDelete(2);
							}
						} else if (data == 3) {
							mob3_hp -= 1;
							if(mob3_hp == 0){
								$(".mob3").fadeOut(10000).addClass('hidden');
								clearInterval(stop3);
								doDelete(3);
							}
						} else if (data == 4) {
							mob4_hp -= 1;
							if(mob4_hp == 0){
								$(".mob4").fadeOut(10000).addClass('hidden');
								clearInterval(stop4);
								doDelete(4);
							}
						} else if (data == 5) {
							mob5_hp -= 1;
							if(mob5_hp == 0){
								$(".mob5").fadeOut(10000).addClass('hidden');
								clearInterval(stop5);
								doDelete(5);
							}
						} else if (data == 6) {
							mob6_hp -= 1;
							if(mob6_hp == 0){
								$(".mob6").fadeOut(10000).addClass('hidden');
								clearInterval(stop6);
								doDelete(6);
							}
						} 
						// console.log("몬스터2 hp : " + mob2_hp);
						// console.log("몬스터3 hp : " + mob3_hp);
						// console.log("몬스터4 hp : " + mob4_hp);
						// console.log("몬스터5 hp : " + mob5_hp);
						// console.log("몬스터6 hp : " + mob6_hp);
						showDoor();
						attackS_motion();
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert('오류 발생 : ' + textStatus);
					}
				});
			}
	       
	       show();
		
</script>
<!-- p2 맵 배경 -->
<img class="bg_img"
	src="https://github.com/user-attachments/assets/04fa2504-f697-4a59-8626-89551e8611da"
	alt="" />

<!-- p2 문 -->
<img class="door_right door hidden absolute"
	src="https://github.com/user-attachments/assets/5234ea4f-b28d-4528-87d7-44ead643cc33"
	alt="" />

<!-- 튜토리얼 알림창 -->
<c:if test="${param.stage == 5}">
	<div class="guide1 bg-white text-center absolute">A W D S : 공격</div>
	<div class="guide2 bg-white text-center absolute">← ↑ → ↓ : 이동</div>
</c:if>

<!-- 첫번째 몬스터 -->
<c:if test="${room > 0 && room < 5}">
	<div class="front_mob mob2 absolute">
		<img class="front_mob_img" src="${mob}" alt="" />
	</div>
</c:if>
<!-- 두번째 몬스터 -->
<c:if test="${room > 1 && room < 5}">
	<div class="front_mob mob3 absolute">
		<img class="front_mob_img" src="${mob}" alt="" />
	</div>
</c:if>
<!-- 세번째 몬스터 -->
<c:if test="${room > 2 && room < 5}">
	<div class="front_mob mob4 absolute">
		<img class="front_mob_img" src="${mob}" alt="" />
	</div>
</c:if>
<!-- 네번째 몬스터 -->
<c:if test="${room > 3 && room < 5}">
	<div class="front_mob mob5 absolute">
		<img class="front_mob_img" src="${mob}" alt="" />
	</div>
</c:if>
<!-- 보스 몬스터 -->
<c:if test="${floor > 1 && room == 0}">
	<div class="front_bossMob mob6 absolute">
		<img class="front_bossMob_img" src="${mob}" alt="" />
	</div>
</c:if>


<!-- 캐릭터 -->
<div class="front_charac charac absolute">
	<!-- 왼쪽 공격 -->
	<img class="front_attack Aattack hidden rounded-full absolute"
		src="${charac.extra__weapon}" alt="" />
	<!-- 위쪽 공격 -->
	<img class="front_attack Wattack hidden rounded-full absolute"
		src="${charac.extra__weapon}" alt="" />
	<!-- 오른쪽 공격 -->
	<img class="front_attack Dattack hidden rounded-full absolute"
		src="${charac.extra__weapon}" alt="" />
	<!-- 아래쪽 공격 -->
	<img class="front_attack Sattack hidden rounded-full absolute"
		src="${charac.extra__weapon}" alt="" />
	<!-- 캐릭터 이미지 -->
	<img class="front_charac_img rounded-full"
		src="https://github.com/user-attachments/assets/aaa05c2c-d55a-4111-b367-9231727e7050"
		alt="" />
</div>








<%@ include file="../common/foot.jspf"%>