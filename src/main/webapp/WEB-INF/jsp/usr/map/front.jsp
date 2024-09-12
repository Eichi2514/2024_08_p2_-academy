<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="/resource/common.js" defer="defer"></script>

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
    var damage = Math.floor(${charac.weaponId} / 10); // 소수점 아래 버림
    if (${charac.weaponId} % 10 != 0){
    	damage++;
    }    

    // 스테이지 이동
	function stageUp() {
		stage = "${param.stage+1}";
		var doorChack = $(".door").hasClass("hidden");
		if (LR > 79 && 38 < UD && UD < 52 && !doorChack) {
			windowChack = false;
			update(front_hp, stage);
			$(".door").fadeOut(1000).addClass('hidden');
			mobShow(2);
			mobShow(3);
			mobShow(4);
			mobShow(5);
			mobShow(6);
			setTimeout(function(){location.href = '../map/front?stage=' + stage;}, 100);			
			/* console.log("HP:", front_hp);
			console.log("Stage:", stage);
			console.log("Weapon ID:", front_weaponId); */			
		}
	}  
    
    // 캐릭터 정보 업데이트
	function update(hp, stage) {
		$.ajax({
			url : '/usr/charac/update',
			type : 'POST',
			data : {
				hp : hp,
				stage : stage
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
	if(${floor > 1 && room == 0}){mob6_hp = ${(floor-1)*10};}
	
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
			mobAttack(2);
		}
	}

	// 1초마다 랜덤 숫자를 출력하는 함수
	function move3() {
		var random;
		// 랜덤 숫자 생성
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
			mobAttack(3);
		}
	}

	// 1초마다 랜덤 숫자를 출력하는 함수
	function move4() {
		var random;
		// 랜덤 숫자 생성
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
			mobAttack(4);
		}
	}

	// 1초마다 랜덤 숫자를 출력하는 함수
	function move5() {
		var random;
		// 랜덤 숫자 생성
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
			mobAttack(5);
		}
	}

	// 1초마다 랜덤 숫자를 출력하는 함수
	function move6() {
		var random;
		// 랜덤 숫자 생성
		if (${floor < 4} || ${floor == 4 && room == 0}){random = getRandom(1, 4);}
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
			mobAttack(6);
		}
	}
	
	// 몬스터의 공격
	function mobAttack(something){
		var randomAttack = getRandom(1, 4);
		if (randomAttack == 1){
			attackA(something);
		} else if (randomAttack == 2){
			attackW(something);
		} else if (randomAttack == 3){
			attackD(something);
		} else if (randomAttack == 4){
			attackS(something);
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
						/* console.log('HP : ' + front_hp); */
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
	$('.hp_count').text(front_hp);
	if(front_hp <= 0){
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
	if(mob2_hp <= 0 && mob3_hp <= 0 && mob4_hp <= 0 && mob5_hp <= 0 && mob6_hp <= 0){
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

//몬스터 사라지게하는 함수
function mobHidden(num) {
	$(".mob"+num).fadeOut(2000, function() {
	    $(this).addClass('hidden');
	});
}		

// 몬스터 나타나게 하는 함수
function mobShow(num) {
	$(".mob"+num).fadeIn(1000).removeClass('hidden');
}

// 자동 실행 move 함수 담아놓을 변수 생성
var stop2, stop3, stop4, stop5, stop6;

//일정 시간마다 move 함수를 호출
function show(){
	if(${param.stage <= 270}){
	  if(${room > 0 && room < 5}){stop2 = setInterval(move2, 1000);}
	  if(${room > 1 && room < 5}){stop3 = setInterval(move3, 800);}
	  if(${room > 2 && room < 5}){stop4 = setInterval(move4, 500);}
	  if(${room > 3 && room < 5}){stop5 = setInterval(move5, 200);}			
	  if(${floor > 1 && room == 0}){stop6 = setInterval(move6, 100);}
     } else {
	  if(${room > 0 && room < 5}){stop2 = setInterval(move2, 300);}
	  if(${room > 1 && room < 5}){stop3 = setInterval(move3, 200);}
	  if(${room > 2 && room < 5}){stop4 = setInterval(move4, 120);}
	  if(${room > 3 && room < 5}){stop5 = setInterval(move5, 70);}			
	  if(${floor > 1 && room == 0}){stop6 = setInterval(move6, 30);}
     }
   }
   
// 아이템 안내창 공개
function showItem_text(){	
	var itemChack = $(".item").hasClass('hidden');
	// console.log("아이템 공개 여부"+itemChack);
	if(LR > 64 && LR < 76 && UD < 56 && UD > 34 && !itemChack && ${floor > 1 && room == 0}){
		$(".item_text").fadeIn(1000).removeClass('hidden');
		}
	}

//아이템 안내창 교체
function Item_change(){
  $.ajax({
      url : '/usr/charac/weaponChange',
      type : 'POST',
      dataType : 'text',
      success: function(data) {
      	var changeImg = "${weapon}";
          $('.weapon_img').attr('src', changeImg);
          $('.CharacAttack').attr('src', changeImg);
          $(".item").fadeOut(1000).addClass('hidden');
          $(".item_text").fadeOut(1000).addClass('hidden');
      },
      error : function(jqXHR, textStatus, errorThrown) {
          alert('오류 발생 : ' + textStatus);
      }
  });
}

//아이템 안내창 조합
function Item_mix(){
  $.ajax({
      url : '/usr/charac/weaponMix',
      type : 'POST',
      dataType : 'text',
      success: function(data) {
    	  console.log("무기정보 : " + data);
      	var changeImg = data;
          $('.weapon_img').attr('src', changeImg);
          $('.CharacAttack').attr('src', changeImg);
          $(".item").fadeOut(1000).addClass('hidden');
          $(".item_text").fadeOut(1000).addClass('hidden');
      },
      error : function(jqXHR, textStatus, errorThrown) {
          alert('오류 발생 : ' + textStatus);
      }
  });
}

//아이템 안내창 취소
function Item_exit(){
		$(".item_text").fadeOut(1000).addClass('hidden');
	}
    	  
// 아이템 공개
function showItem(){
	  $(".item").fadeIn(1000).removeClass('hidden');
}

// 보스 HP 감소 함수
function BossHpDown(){
	let new_width_value = ( ${50/ ((floor-1)*10) }*mob6_hp);
	$(".bossHP_bar").css('width', new_width_value+'vh');
}

// 공격 함수
		function attack_motion(something, motion) {
			$("."+motion+"attack"+something).removeClass('hidden');
			setTimeout(function() {
				$("."+motion+"attack"+something).addClass('hidden');
			}, 300)
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
						// console.log("데미지 : " + damage);
						// console.log("보스 HP : " + mob6_hp);
						if (something != 1 && data == 1) {
							hpDown();
						} else if (something == 1 && data == 2) {
							mob2_hp -= damage;
							if(mob2_hp <= 0){
								mobHidden(2);
							    clearInterval(stop2);
							    doDelete(2);
							}
						} else if (something == 1 && data == 3) {
							mob3_hp -= damage;
							if(mob3_hp <= 0){
								mobHidden(3);
								clearInterval(stop3);
								doDelete(3);
							}
						} else if (something == 1 && data == 4) {
							mob4_hp -= damage;
							if(mob4_hp <= 0){
								mobHidden(4);
								clearInterval(stop4);
								doDelete(4);
							}
						} else if (something == 1 && data == 5) {
							mob5_hp -= damage;
							if(mob5_hp <= 0){
								mobHidden(5);
								clearInterval(stop5);
								doDelete(5);
							}
						} else if (something == 1 && data == 6) {
							mob6_hp -= damage;
							if(mob6_hp <= 0){
								mobHidden(6);
								clearInterval(stop6);
								doDelete(6);
								showItem();
							}
							BossHpDown();
						} 
						// console.log("몬스터2 hp : " + mob2_hp);
						// console.log("몬스터3 hp : " + mob3_hp);
						// console.log("몬스터4 hp : " + mob4_hp);
						// console.log("몬스터5 hp : " + mob5_hp);
						// console.log("몬스터6 hp : " + mob6_hp);
						showDoor();
						attack_motion(something, "A");
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
						if (something != 1 && data == 1) {
							hpDown();
						} else if (something == 1 && data == 2) {
							mob2_hp -= damage;
							if(mob2_hp <= 0){
								mobHidden(2);
							    clearInterval(stop2);
							    doDelete(2);
							}
						} else if (something == 1 && data == 3) {
							mob3_hp -= damage;
							if(mob3_hp <= 0){
								mobHidden(3);
								clearInterval(stop3);
								doDelete(3);
							}
						} else if (something == 1 && data == 4) {
							mob4_hp -= damage;
							if(mob4_hp <= 0){
								mobHidden(4);
								clearInterval(stop4);
								doDelete(4);
							}
						} else if (something == 1 && data == 5) {
							mob5_hp -= damage;
							if(mob5_hp <= 0){
								mobHidden(5);
								clearInterval(stop5);
								doDelete(5);
							}
						} else if (something == 1 && data == 6) {
							mob6_hp -= damage;
							if(mob6_hp <= 0){
								mobHidden(6);
								clearInterval(stop6);
								doDelete(6);
								showItem();
							}
							BossHpDown();
						} 
						// console.log("몬스터2 hp : " + mob2_hp);
						// console.log("몬스터3 hp : " + mob3_hp);
						// console.log("몬스터4 hp : " + mob4_hp);
						// console.log("몬스터5 hp : " + mob5_hp);
						// console.log("몬스터6 hp : " + mob6_hp);
						showDoor();
						attack_motion(something, "W");
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
						// console.log("데미지 : " + damage);
						// console.log("보스 HP : " + mob6_hp);
						if (something != 1 && data == 1) {
							hpDown();
						} else if (something == 1 && data == 2) {
							mob2_hp -= damage;
							if(mob2_hp <= 0){
								mobHidden(2);
							    clearInterval(stop2);
							    doDelete(2);
							}
						} else if (something == 1 && data == 3) {
							mob3_hp -= damage;
							if(mob3_hp <= 0){
								mobHidden(3);
								clearInterval(stop3);
								doDelete(3);
							}
						} else if (something == 1 && data == 4) {
							mob4_hp -= damage;
							if(mob4_hp <= 0){
								mobHidden(4);
								clearInterval(stop4);
								doDelete(4);
							}
						} else if (something == 1 && data == 5) {
							mob5_hp -= damage;
							if(mob5_hp <= 0){
								mobHidden(5);
								clearInterval(stop5);
								doDelete(5);
							}
						} else if (something == 1 && data == 6) {
							mob6_hp -= damage;
							if(mob6_hp <= 0){
								mobHidden(6);
								clearInterval(stop6);
								doDelete(6);
								showItem();
							}
							BossHpDown();
						} 
						// console.log("몬스터2 hp : " + mob2_hp);
						// console.log("몬스터3 hp : " + mob3_hp);
						// console.log("몬스터4 hp : " + mob4_hp);
						// console.log("몬스터5 hp : " + mob5_hp);
						// console.log("몬스터6 hp : " + mob6_hp);
						showDoor();
						attack_motion(something, "D");
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
						if (something != 1 && data == 1) {
							hpDown();
						} else if (something == 1 && data == 2) {
							mob2_hp -= damage;
							if(mob2_hp <= 0){
								mobHidden(2);
							    clearInterval(stop2);
							    doDelete(2);
							}
						} else if (something == 1 && data == 3) {
							mob3_hp -= damage;
							if(mob3_hp <= 0){
								mobHidden(3);
								clearInterval(stop3);
								doDelete(3);
							}
						} else if (something == 1 && data == 4) {
							mob4_hp -= damage;
							if(mob4_hp <= 0){
								mobHidden(4);
								clearInterval(stop4);
								doDelete(4);
							}
						} else if (something == 1 && data == 5) {
							mob5_hp -= damage;
							if(mob5_hp <= 0){
								mobHidden(5);
								clearInterval(stop5);
								doDelete(5);
							}
						} else if (something == 1 && data == 6) {
							mob6_hp -= damage;
							if(mob6_hp <= 0){
								mobHidden(6);
								clearInterval(stop6);
								doDelete(6);
								showItem();
							}
							BossHpDown();
						} 
						// console.log("몬스터2 hp : " + mob2_hp);
						// console.log("몬스터3 hp : " + mob3_hp);
						// console.log("몬스터4 hp : " + mob4_hp);
						// console.log("몬스터5 hp : " + mob5_hp);
						// console.log("몬스터6 hp : " + mob6_hp);
						showDoor();
						attack_motion(something, "S");
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert('오류 발생 : ' + textStatus);
					}
				});
			}
	       
	       window.onload = show();
		
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
	<div class="guide1 bg-white text-center absolute">A W D X : 공격</div>
	<div class="guide2 bg-white text-center absolute">← ↑ → ↓ : 이동</div>
</c:if>

<!-- 첫번째 몬스터 -->
<c:if test="${room > 0 && room < 5}">
	<div class="front_mob mob2 absolute">
		<!-- 왼쪽 공격 -->
		<img class="mobAttack Aattack2 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<!-- 위쪽 공격 -->
		<img class="mobAttack Wattack2 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<!-- 오른쪽 공격 -->
		<img class="mobAttack Dattack2 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<!-- 아래쪽 공격 -->
		<img class="mobAttack Sattack2 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<img class="front_mob_img" src="${mob}" alt="" />
	</div>
</c:if>
<!-- 두번째 몬스터 -->
<c:if test="${room > 1 && room < 5}">
	<div class="front_mob mob3 absolute">
		<!-- 왼쪽 공격 -->
		<img class="mobAttack Aattack3 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<!-- 위쪽 공격 -->
		<img class="mobAttack Wattack3 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<!-- 오른쪽 공격 -->
		<img class="mobAttack Dattack3 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<!-- 아래쪽 공격 -->
		<img class="mobAttack Sattack3 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<img class="front_mob_img" src="${mob}" alt="" />
	</div>
</c:if>
<!-- 세번째 몬스터 -->
<c:if test="${room > 2 && room < 5}">
	<div class="front_mob mob4 absolute">
		<!-- 왼쪽 공격 -->
		<img class="mobAttack Aattack4 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<!-- 위쪽 공격 -->
		<img class="mobAttack Wattack4 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<!-- 오른쪽 공격 -->
		<img class="mobAttack Dattack4 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<!-- 아래쪽 공격 -->
		<img class="mobAttack Sattack4 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<img class="front_mob_img" src="${mob}" alt="" />
	</div>
</c:if>
<!-- 네번째 몬스터 -->
<c:if test="${room > 3 && room < 5}">
	<div class="front_mob mob5 absolute">
		<!-- 왼쪽 공격 -->
		<img class="mobAttack Aattack5 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<!-- 위쪽 공격 -->
		<img class="mobAttack Wattack5 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<!-- 오른쪽 공격 -->
		<img class="mobAttack Dattack5 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<!-- 아래쪽 공격 -->
		<img class="mobAttack Sattack5 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<img class="front_mob_img" src="${mob}" alt="" />
	</div>
</c:if>
<!-- 보스 몬스터 -->
<c:if test="${floor > 1 && room == 0}">
	<div class="bossHP absolute">
		<div class="bossHP_title">BOSS :</div>
		<div class="bossHP_bar"></div>
	</div>

	<div class="front_bossMob mob6 absolute">
		<!-- 왼쪽 공격 -->
		<img class="mobAttack Aattack6 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<!-- 위쪽 공격 -->
		<img class="mobAttack Wattack6 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<!-- 오른쪽 공격 -->
		<img class="mobAttack Dattack6 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<!-- 아래쪽 공격 -->
		<img class="mobAttack Sattack6 attackSize hidden absolute"
			src="${charac.extra__weapon}" alt="" />
		<img class="front_bossMob_img" src="${mob}" alt="" />
	</div>

	<img class="item hidden absolute" src="${weapon}" alt="" />
</c:if>


<div class="item_text absolute z-20 hidden">
	<!-- p2 나무판 -->
	<img class="item_img absolute z-20"
		src="https://github.com/user-attachments/assets/b3351b33-5547-48b5-9108-78ef3c69c204"
		alt="" />

	<div class="item_title absolute">새로운 무기를 발견하였습니다.</div>
	<button class="item_change absolute" onclick="Item_change()">교체</button>
	<button class="item_mix absolute" onclick="Item_mix()">합성</button>
	<button class="item_exit absolute" onclick="Item_exit()">취소</button>
</div>


<!-- 캐릭터 -->
<div class="front_charac charac absolute">
	<!-- 왼쪽 공격 -->
	<img
		class="Aattack1_${charac.weaponId} attackSize Aattack1 CharacAttack hidden absolute"
		src="${charac.extra__weapon}" alt="" />
	<!-- 위쪽 공격 -->
	<img
		class="Wattack1_${charac.weaponId} attackSize Wattack1 CharacAttack hidden absolute"
		src="${charac.extra__weapon}" alt="" />
	<!-- 오른쪽 공격 -->
	<img
		class="Dattack1_${charac.weaponId} attackSize Dattack1 CharacAttack hidden absolute"
		src="${charac.extra__weapon}" alt="" />
	<!-- 아래쪽 공격 -->
	<img
		class="Sattack1_${charac.weaponId} attackSize Sattack1 CharacAttack hidden absolute"
		src="${charac.extra__weapon}" alt="" />
	<!-- 캐릭터 이미지 -->
	<img class="front_charac_img rounded-full"
		src="https://github.com/user-attachments/assets/aaa05c2c-d55a-4111-b367-9231727e7050"
		alt="" />
</div>

<!--  배경음악 관련 -->
<c:if
	test="${floor % 40 >= 1 && floor % 40 <= 10 && room != 0 || (floor-1) % 40 >= 0 && (floor-1) % 40 <= 10 && room == 0}">
	<audio id="audioPlayer" class="audioPlayer hidden absolute" controls
		autoplay loop preload="auto">
		<source src="${pageContext.request.contextPath}/audio/bg1.mp3"
			type="audio/mpeg">
	</audio>
</c:if>
<c:if
	test="${floor % 40 >= 11 && floor % 40 <= 20 && room != 0 || (floor-1) % 40 >= 11 && (floor-1) % 40 <= 20 && room == 0}">
	<audio id="audioPlayer" class="audioPlayer hidden absolute" controls
		autoplay loop preload="auto">
		<source src="${pageContext.request.contextPath}/audio/bg2.mp3"
			type="audio/mpeg">
	</audio>
</c:if>
<c:if
	test="${floor % 40 >= 21 && floor % 40 <= 30 && room != 0 || (floor-1) % 40 >= 21 && (floor-1) % 40 <= 30 && room == 0}">
	<audio id="audioPlayer" class="audioPlayer hidden absolute" controls
		autoplay loop preload="auto">
		<source src="${pageContext.request.contextPath}/audio/bg3.mp3"
			type="audio/mpeg">
	</audio>
</c:if>
<c:if
	test="${floor % 40 >= 31 && floor % 40 <= 40 && room != 0 || (floor-1) % 40 >= 31 && (floor-1) % 40 <= 40 && room == 0}">
	<audio id="audioPlayer" class="audioPlayer hidden absolute" controls
		autoplay loop preload="auto">
		<source src="${pageContext.request.contextPath}/audio/bg4.mp3"
			type="audio/mpeg">
	</audio>
</c:if>

<button id="toggleAutoplayButton" class="audio_bt absolute">소리</button>


<script>
// 페이지를 떠나기 전, 현재 오디오의 재생 위치와 상태를 저장
window.addEventListener('beforeunload', function() {
    // 오디오 요소를 가져옴
    var audio = document.getElementById('audioPlayer');
    // 재생 위치를 저장할 키 설정
    var storageKey = 'audioPlaybackPosition';
    // 현재 재생 위치를 localStorage에 저장
    localStorage.setItem(storageKey, audio.currentTime);
    // 오디오 재생 상태도 저장 (재생 중이면 true, 멈춤이면 false)
    localStorage.setItem('audioPlayingState', !audio.paused);
});

// 문서가 로드된 후 실행
document.addEventListener('DOMContentLoaded', function() {
    // 오디오 요소를 가져옴
    var audio = document.getElementById('audioPlayer');
    // 투글 버튼 요소를 가져옴
    var toggleButton = document.getElementById('toggleAutoplayButton');
    // 저장된 재생 위치를 가져올 키 설정
    var storageKey = 'audioPlaybackPosition';
    // 저장된 재생 위치를 가져옴
    var savedPosition = localStorage.getItem(storageKey);

    // 저장된 재생 위치가 있으면 해당 위치로 이동
    if (savedPosition) {
        audio.currentTime = parseFloat(savedPosition);
    }

    // 저장된 재생 상태를 localStorage에서 가져옴
    var audioPlayingState = localStorage.getItem('audioPlayingState');

    // 재생 상태가 true였으면 오디오를 재생하고 버튼 문구를 소리 : 꺼짐으로 변경
    if (audioPlayingState === 'true') {
        audio.play();
        toggleButton.classList.remove('play');
        toggleButton.classList.add('pause');
    } else {
        // 멈춤 상태였으면 오디오를 멈추고 버튼 문구를 소리 : 켜짐으로 변경
        audio.pause();
        toggleButton.classList.remove('pause');
        toggleButton.classList.add('play');
    }
});

// 오디오 재생/멈춤을 토글하는 버튼 클릭 이벤트
document.getElementById('toggleAutoplayButton').addEventListener('click', function() {
    // 오디오 요소를 가져옴
    var audio = document.getElementById('audioPlayer');

    // 오디오가 재생 중이면 멈추고, 버튼 상태 변경
    if (!audio.paused) {
        audio.pause();
        // 재생 상태를 멈춤으로 저장
        localStorage.setItem('audioPlayingState', false);
        this.classList.remove('pause');
        this.classList.add('play');
    } else {
        // 오디오가 멈췄으면 재생하고, 버튼 상태 변경
        audio.play();
        // 재생 상태를 재생 중으로 저장
        localStorage.setItem('audioPlayingState', true);
        this.classList.remove('play');
        this.classList.add('pause');
    }
});
</script>

<%@ include file="../common/foot.jspf"%>