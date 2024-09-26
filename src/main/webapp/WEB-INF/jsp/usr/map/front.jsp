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
    var moveSpeed = ${charac.speed}; // 이동 속도 조절 (ms)
    var damage = ((Math.floor(${charac.weaponId} / 10))*10) + ${charac.power}; // 소수점 아래 버림
    if (${charac.weaponId} % 10 != 0){
    	damage+=10;
    } 
    var mobDamage = ${floor};
    if (${room == 0}){
    	mobDamage--;
    }    

    // 스테이지 이동
	function stageUp() {
		stage = "${param.stage+1}";
		var doorChack = $(".door").hasClass("hidden");
		if (LR > 79 && 38 < UD && UD < 52 && !doorChack) {
			windowChack = false;
			update(front_hp, stage, seconds);						
			setTimeout(function(){location.href = '../map/front?stage=' + stage;}, 100);			
			/* console.log("HP:", front_hp);
			console.log("Stage:", stage);
			console.log("Weapon ID:", front_weaponId); */			
		}
	}  
    
    // 캐릭터 정보 업데이트
	function update(hp, stage, seconds) {
		$.ajax({
			url : '/usr/charac/update',
			type : 'POST',
			data : {
				hp : hp,
				stage : stage,
				clearTime : seconds
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
    
	// 몬스터의 체력 부여
	if(${room > 0 && room < 5}){mob2_hp = ${floor*10};}
	if(${room > 1 && room < 5}){mob3_hp = ${floor*10};}
	if(${room > 2 && room < 5}){mob4_hp = ${floor*10};}
	if(${room > 3 && room < 5}){mob5_hp = ${floor*10};}
	if(${floor > 1 && room == 0}){mob6_hp = ${(floor-1)*100};}
	
	// 랜덤 숫자 생성
    function getRandom(min, max) {
    	return Math.floor(Math.random() * (max - min + 1)) + min;
		}

	// 랜덤 행동을 사용하는 함수
	function move2() {
		var random;
		// 1에서 5까지의 랜덤 숫자 생성
		if (${floor < 4}){random = getRandom(1, 4);}
		else {random = getRandom(1, 5);}

		if (random == 1 && windowChack) {
			Left2(2);
		} else if (random == 2&& windowChack) {
			Up2(2);
		} else if (random == 3&& windowChack) {
			Right2(2);
		} else if (random == 4&& windowChack) {
			Down2(2);
		} else if (random == 5&& windowChack) {
			mobAttack(2);
		}
	}

	// 랜덤 행동을 사용하는 함수
	function move3() {
		var random;
		// 랜덤 숫자 생성
		if (${floor < 4}){random = getRandom(1, 4);}
		else {random = getRandom(1, 5);}

		if (random == 1&& windowChack) {
			Left2(3);
		} else if (random == 2&& windowChack) {
			Up2(3);
		} else if (random == 3&& windowChack) {
			Right2(3);
		} else if (random == 4&& windowChack) {
			Down2(3);
		} else if (random == 5&& windowChack) {
			mobAttack(3);
		}
	}

	// 랜덤 행동을 사용하는 함수
	function move4() {
		var random;
		// 랜덤 숫자 생성
		if (${floor < 4}){random = getRandom(1, 4);}
		else {random = getRandom(1, 5);}

		if (random == 1) {
			Left2(4);
		} else if (random == 2&& windowChack) {
			Up2(4);
		} else if (random == 3&& windowChack) {
			Right2(4);
		} else if (random == 4&& windowChack) {
			Down2(4);
		} else if (random == 5&& windowChack) {
			mobAttack(4);
		}
	}

	// 랜덤 행동을 사용하는 함수
	function move5() {
		var random;
		// 랜덤 숫자 생성
		if (${floor < 4}){random = getRandom(1, 4);}
		else {random = getRandom(1, 5);}

		if (random == 1) {
			Left2(5);
		} else if (random == 2&& windowChack) {
			Up2(5);
		} else if (random == 3&& windowChack) {
			Right2(5);
		} else if (random == 4&& windowChack) {
			Down2(5);
		} else if (random == 5&& windowChack) {
			mobAttack(5);
		}
	}

	// 랜덤 행동을 사용하는 함수
	function move6() {
		var random;
		// 랜덤 숫자 생성
		if (${floor < 4} || ${floor == 4 && room == 0}){random = getRandom(1, 4);}
		else {random = getRandom(1, 5);}

		if (random == 1&& windowChack) {
			Left2(6);
		} else if (random == 2&& windowChack) {
			Up2(6);
		} else if (random == 3&& windowChack) {
			Right2(6);
		} else if (random == 4&& windowChack) {
			Down2(6);
		} else if (random == 5&& windowChack) {
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
						if (something < 6){
							hpDown(mobDamage);
							damage__motion('1', mobDamage);
							} else{
							hpDown(mobDamage*2);
							damage__motion('1', mobDamage*2);	
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
					} else if (data == 'charac') {
						if (something < 6){
							hpDown(mobDamage);
							damage__motion('1', mobDamage);
							} else{
							hpDown(mobDamage*2);
							damage__motion('1', mobDamage*2);	
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
						if (something < 6){
							hpDown(mobDamage);
							damage__motion('1', mobDamage);
							} else{
							hpDown(mobDamage*2);
							damage__motion('1', mobDamage*2);	
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
					} else if (data == 'charac') {
						if (something < 6){
						hpDown(mobDamage);
						damage__motion('1', mobDamage);
						} else{
						hpDown(mobDamage*2);
						damage__motion('1', mobDamage*2);	
						}
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					alert('오류 발생 : ' + textStatus);
				}
			});
		}
		
// hp 감소
function hpDown(mobDamage){
	front_hp -= mobDamage;
	$('.hp_count').text(front_hp);
	if(front_hp <= 0){
		scoreboardLog();
		location.href = '../map/over';
		}
	characHpDown();
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
	// console.log("페이지가 모두 로드된 후 실행됩니다.");	
	// console.log(((8 / 100) * front_hp));
	
	setTimeout(characHpDown, 1000);
	setTimeout(() => mobHpDown(2), 1000);
	setTimeout(() => mobHpDown(3), 1000);
	setTimeout(() => mobHpDown(4), 1000);
	setTimeout(() => mobHpDown(5), 1000);
		
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

//아이템 안내창 교체 버튼 눌렀을 떄
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

//아이템 안내창 조합 버튼 눌렀을 떄
function Item_mix(){
  $.ajax({
      url : '/usr/charac/weaponMix',
      type : 'POST',
      dataType : 'text',
      success: function(data) {
    	  // console.log("무기정보 : " + data);
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

//아이템 안내창 취소 버튼 눌렀을 떄
function Item_exit(){
		$(".item_text").fadeOut(1000).addClass('hidden');
		$(".random_item_text").fadeOut(1000).addClass('hidden');
	}
    	  
// 아이템 공개
function showItem(){
	  $(".item").fadeIn(1000).removeClass('hidden');
}


// 랜덤아이템 안내창 공개
function showRandomItem_text(){	
	var randomItemChack = $(".random_item").hasClass('hidden');
	// console.log("아이템 공개 여부"+itemChack);
	if(UD > 64 && UD < 76 && LR < 56 && LR > 34 && !randomItemChack){
		$(".random_item_text").fadeIn(1000).removeClass('hidden');
		}
	}
	
//랜덤아이템 안내창 먹는다 버튼 눌렀을 떄
function Item_get(){
  $.ajax({
      url : '/usr/charac/itemGet',
      type : 'GET',
      success: function(data) {
    	  // console.log(data);
    	  $('.power_count').text(data[0]);
    	  $('.speed_count').text(50 - data[1]);
    	  alert(data[2]);
    	  $(".random_item").fadeOut(1000).addClass('hidden');
          $(".random_item_text").fadeOut(1000).addClass('hidden');
          
      },
      error : function(jqXHR, textStatus, errorThrown) {
          alert('오류 발생 : ' + textStatus);
      }
  });
}
	
// 랜덤아이템 공개
function showRandomItem(){
	if(mob2_hp <= 0 && mob3_hp <= 0 && mob4_hp <= 0 && mob5_hp <= 0 && mob6_hp <= 0){
	  $(".random_item").fadeIn(1000).removeClass('hidden');
	}
}

// 보스 체력바 변화 함수
function BossHpDown(){
	let new_bossHp_width = ( ${50/ ((floor-1)*100) }*mob6_hp);
	$(".bossHP_bar").css('width', new_bossHp_width+'vh');
}

// 몬스터 체력바 변화 함수
function mobHpDown(something){
	let mob_hp = 0;
	if(something == 2){
		mob_hp = mob2_hp;
	}else if(something == 3){
		mob_hp = mob3_hp;
	}else if(something == 4){
		mob_hp = mob4_hp;
	}else if(something == 5){
		mob_hp = mob5_hp;
	}
	let new_mobHp_width = ( ${8/ (floor * 10) } * mob_hp);
	// console.log(".mob"+something+"HP_bar : " + new_mobHp_width+'vh');
	$(".mob"+something+"HP_bar").css('width', new_mobHp_width+'vh');
}

// 캐릭 체력바 변화 함수
function characHpDown(){
	let new_characHp_width = (8 / 10) * (front_hp%10);
	// console.log(new_characHp_width);
	let characHp_number = Math.floor(front_hp/10);
	if(front_hp%10 == 0){
		new_characHp_width = 8;
		characHp_number--;
	}
	// console.log("체력 넓이 : " + new_characHp_width + ", 줄 수 : " + characHp_number);
	for(var i = characHp_number-1; i >= 0; i--){
	$(".characHP_bar"+i).css('width', '8vh');
	}
	for(var i = characHp_number+1; i < 11; i++){
	$(".characHP_bar"+i).css('width', '0vh');
	}
	
	// console.log(".characHP_bar"+(characHp_number-1));
	$(".characHP_bar"+characHp_number).css('width', new_characHp_width+'vh');
	$(".characHP_bar_text").text('x'+(characHp_number+1));
}

// 공격 함수
function attack_motion(something, motion) {
	var Distance = 0;
	
	if(something == 1){
		Distance = ${charac.weaponId} % 10; // 소수점 아래 버림
		    if (${charac.weaponId} % 10 == 0){
		    	Distance = 10;
		    }
	} else {
		Distance = ${charac.floor-3};
			if (Distance > 10){
	    		Distance = 10;
	    	}
	}
	
    const $attackElement = $("." + motion + "attack" + something);
    
    // hidden 클래스를 제거해서 모습을 드러냄
    $attackElement.removeClass('hidden');
    
    // 약간의 딜레이 후에 css를 변경해 이동하는 모습을 표현
    setTimeout(function() {
        if (motion == 'A') {
            $attackElement.css('left', (-4 - (Distance * 2)) + "vh");
        } else if (motion == 'W') {
            	$attackElement.css('top', (-4 - (Distance * 2)) + "vh");
        } else if (motion == 'D') {
        		if(something < 6) {
    	        $attackElement.css('left', (12 + (Distance * 2)) + "vh");
   	     		} else if(something == 6){
                 	$attackElement.css('left', (22 + (Distance * 2)) + "vh");	
                }
            /* console.log((14 + (Distance * 2)));
            console.log("weaponId : " + ${charac.weaponId});
            console.log("Distance*2 : " + Distance*2);
            console.log("사거리 : " + (12 + (Distance * 2))); */
        } else if (motion == 'S') {
        		if(something < 6) {
    	        $attackElement.css('top', (12 + (Distance * 2)) + "vh");
	        	} else if(something == 6){
                 	$attackElement.css('top', (22 + (Distance * 2)) + "vh");	
                }
        }
    }, 10);  // 10ms 정도의 짧은 딜레이를 줘서 CSS 변경을 애니메이션으로 적용

    // 0.5초 뒤에 애니메이션이 끝나고, 모습을 없애고 원래 자리로
    setTimeout(function() {
        $attackElement.addClass('hidden'); // 다시 hidden 추가
        if(something < 6){
        	$attackElement.css({top: "4vh", left: "4vh"}); // 원래 위치로 복귀
        } else if(something == 6){
        	$attackElement.css({top: "9vh", left: "9vh"}); // 원래 위치로 복귀
        }
    }, 500);  // 애니메이션 시간 500ms 이후
}

// 데미지 화면에 보여주기
function damage__motion(data, damage){
	// console.log(data, damage)
	mobHpDown(data);
	$(".damage"+data).text(damage);
	setTimeout(function() {
		$(".damage"+data).text('');	
	}, 1000);
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
							if (something < 6){
								hpDown(mobDamage);
								damage__motion('1', mobDamage);
								} else{
								hpDown(mobDamage*2);
								damage__motion('1', mobDamage*2);	
								}
						} else if (something == 1 && data == 2) {
							mob2_hp -= damage;
							damage__motion(data, damage);
							if(mob2_hp <= 0){
								mobHidden(2);
							    clearInterval(stop2);
							    doDelete(2);
							}
						} else if (something == 1 && data == 3) {
							mob3_hp -= damage;
							damage__motion(data, damage);
							if(mob3_hp <= 0){
								mobHidden(3);
								clearInterval(stop3);
								doDelete(3);
							}
						} else if (something == 1 && data == 4) {
							mob4_hp -= damage;
							damage__motion(data, damage);
							if(mob4_hp <= 0){
								mobHidden(4);
								clearInterval(stop4);
								doDelete(4);
							}
						} else if (something == 1 && data == 5) {
							mob5_hp -= damage;
							damage__motion(data, damage);
							if(mob5_hp <= 0){
								mobHidden(5);
								clearInterval(stop5);
								doDelete(5);
							}
						} else if (something == 1 && data == 6) {
							mob6_hp -= damage;
							damage__motion(data, damage);
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
						showRandomItem();
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
							if (something < 6){
								hpDown(mobDamage);
								damage__motion('1', mobDamage);
								} else{
								hpDown(mobDamage*2);
								damage__motion('1', mobDamage*2);	
								}
						} else if (something == 1 && data == 2) {
							mob2_hp -= damage;			
							damage__motion(data, damage);
							if(mob2_hp <= 0){
								mobHidden(2);
							    clearInterval(stop2);
							    doDelete(2);
							}
						} else if (something == 1 && data == 3) {
							mob3_hp -= damage;
							damage__motion(data, damage);
							if(mob3_hp <= 0){
								mobHidden(3);
								clearInterval(stop3);
								doDelete(3);
							}
						} else if (something == 1 && data == 4) {
							mob4_hp -= damage;
							damage__motion(data, damage);
							if(mob4_hp <= 0){
								mobHidden(4);
								clearInterval(stop4);
								doDelete(4);
							}
						} else if (something == 1 && data == 5) {
							mob5_hp -= damage;
							damage__motion(data, damage);
							if(mob5_hp <= 0){
								mobHidden(5);
								clearInterval(stop5);
								doDelete(5);
							}
						} else if (something == 1 && data == 6) {
							mob6_hp -= damage;
							damage__motion(data, damage);
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
						showRandomItem();
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
							if (something < 6){
								hpDown(mobDamage);
								damage__motion('1', mobDamage);
								} else{
								hpDown(mobDamage*2);
								damage__motion('1', mobDamage*2);	
								}
						} else if (something == 1 && data == 2) {
							mob2_hp -= damage;			
							damage__motion(data, damage);
							if(mob2_hp <= 0){
								mobHidden(2);
							    clearInterval(stop2);
							    doDelete(2);
							}
						} else if (something == 1 && data == 3) {
							mob3_hp -= damage;
							damage__motion(data, damage);
							if(mob3_hp <= 0){
								mobHidden(3);
								clearInterval(stop3);
								doDelete(3);
							}
						} else if (something == 1 && data == 4) {
							mob4_hp -= damage;
							damage__motion(data, damage);
							if(mob4_hp <= 0){
								mobHidden(4);
								clearInterval(stop4);
								doDelete(4);
							}
						} else if (something == 1 && data == 5) {
							mob5_hp -= damage;
							damage__motion(data, damage);
							if(mob5_hp <= 0){
								mobHidden(5);
								clearInterval(stop5);
								doDelete(5);
							}
						} else if (something == 1 && data == 6) {
							mob6_hp -= damage;
							damage__motion(data, damage);
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
						showRandomItem();
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
							if (something < 6){
								hpDown(mobDamage);
								damage__motion('1', mobDamage);
								} else{
								hpDown(mobDamage*2);
								damage__motion('1', mobDamage*2);	
								}
						} else if (something == 1 && data == 2) {
							mob2_hp -= damage;			
							damage__motion(data, damage);
							if(mob2_hp <= 0){
								mobHidden(2);
							    clearInterval(stop2);
							    doDelete(2);
							}
						} else if (something == 1 && data == 3) {
							mob3_hp -= damage;
							damage__motion(data, damage);
							if(mob3_hp <= 0){
								mobHidden(3);
								clearInterval(stop3);
								doDelete(3);
							}
						} else if (something == 1 && data == 4) {
							mob4_hp -= damage;
							damage__motion(data, damage);
							if(mob4_hp <= 0){
								mobHidden(4);
								clearInterval(stop4);
								doDelete(4);
							}
						} else if (something == 1 && data == 5) {
							mob5_hp -= damage;
							damage__motion(data, damage);
							if(mob5_hp <= 0){
								mobHidden(5);
								clearInterval(stop5);
								doDelete(5);
							}
						} else if (something == 1 && data == 6) {
							mob6_hp -= damage;
							damage__motion(data, damage);
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
						showRandomItem();
						attack_motion(something, "S");
					},
					error : function(jqXHR, textStatus, errorThrown) {
						alert('오류 발생 : ' + textStatus);
					}
				});
			}
	       
	       let seconds = ${charac.clearTime};

	       function updateTime() {
	           const hrs = Math.floor(seconds / 3600);
	           const mins = Math.floor((seconds % 3600) / 60);
	           const secs = seconds % 60;

	           // 1초 단위로 형식화
	           $(".time").text(
	               hrs.toString().padStart(2, '0') + ":" + 
	               mins.toString().padStart(2, '0') + ":" + 
	               secs.toString().padStart(2, '0')
	           );
	       }

	       function startTimer() {
	           setInterval(() => {
	               seconds++;
	               updateTime();
	           }, 1000);
	       }
	       
	   	show();
		
</script>
<!-- p2 맵 배경 -->
<img class="bg_img"
	src="https://github.com/user-attachments/assets/e92471f8-4b53-4df2-9b42-e4fe0abe9d5e"
	alt="" />

<!-- p2 문 -->
<img class="door_right door hidden absolute"
	src="https://github.com/user-attachments/assets/5234ea4f-b28d-4528-87d7-44ead643cc33"
	alt="" />

<!-- 튜토리얼 알림창 -->
<c:if test="${param.stage == 5}">
	<div class="guide1 bg-black text-gray-400 text-center absolute">A
		W D S : 공격</div>
	<div class="guide2 bg-black text-gray-400 text-center absolute">←
		↑ → ↓ : 이동</div>
</c:if>

<!-- 타이머 -->
<div class="timer absolute">
    <div class="time">00:00:00</div>
</div>

<!-- 첫번째 몬스터 -->
<c:if test="${room > 0 && room < 5}">
	<div class="front_mob mob2 absolute">
		<c:if test="${floor%10 != 0}">
			<div class="mob2HP_bar absolute bg-red-500"></div>
		</c:if>
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
		<!-- 몬스터 데미지 -->
		<div class="damage2 absolute z-20"></div>
	</div>
</c:if>
<!-- 두번째 몬스터 -->
<c:if test="${room > 1 && room < 5}">
	<div class="front_mob mob3 absolute">
		<c:if test="${floor%10 != 0}">
			<div class="mob3HP_bar absolute bg-red-500"></div>
		</c:if>
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
		<!-- 몬스터 데미지 -->
		<div class="damage3 absolute z-20"></div>
	</div>
</c:if>
<!-- 세번째 몬스터 -->
<c:if test="${room > 2 && room < 5}">
	<div class="front_mob mob4 absolute">
		<c:if test="${floor%10 != 0}">
			<div class="mob4HP_bar absolute bg-red-500"></div>
		</c:if>
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
		<!-- 몬스터 데미지 -->
		<div class="damage4 absolute z-20"></div>
	</div>
</c:if>
<!-- 네번째 몬스터 -->
<c:if test="${room > 3 && room < 5}">
	<div class="front_mob mob5 absolute">
		<c:if test="${floor%10 != 0}">
			<div class="mob5HP_bar absolute bg-red-500"></div>
		</c:if>
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
		<!-- 몬스터 데미지 -->
		<div class="damage5 absolute z-20"></div>
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
		<!-- 보스 데미지 -->
		<div class="damage6 absolute z-20"></div>
	</div>

	<img class="item hidden absolute" src="${weapon}" alt="" />
</c:if>


<div class="item_text absolute z-20 hidden">
	<!-- p2 나무판 -->
	<!-- 
	<img class="item_img absolute z-20"
		src="https://github.com/user-attachments/assets/b3351b33-5547-48b5-9108-78ef3c69c204"
		alt="" />
	-->

	<div class="item_title absolute">새로운 무기를 발견하였습니다.</div>
	<button class="item_change absolute" onclick="Item_change()">교체</button>
	<button class="item_mix absolute" onclick="Item_mix()">합성</button>
	<button class="item_exit absolute" onclick="Item_exit()">취소</button>
</div>

<c:if test="${random_item_probability == 1 && param.stage > 5}">

	<div class="random_item_text absolute z-20 hidden">
		<!-- p2 나무판 -->
		<!-- 
	<img class="item_img absolute z-20"
		src="https://github.com/user-attachments/assets/b3351b33-5547-48b5-9108-78ef3c69c204"
		alt="" />
	-->

		<div class="item_title absolute z-20">수상한 알약을 발견하였습니다.</div>
		<button class="item_get absolute z-20" onclick="Item_get()">먹는다</button>
		<button class="item_exit absolute z-20" onclick="Item_exit()">취소</button>
	</div>


	<img class="random_item hidden absolute"
		src="https://github.com/user-attachments/assets/64a8dc0c-b9bc-41a7-a500-8a9466c0dd04"
		alt="" />
</c:if>

<!-- 캐릭터 -->
<div class="front_charac charac absolute">
	<div class="characHP_bar_text absolute"></div>
	<div class="characHP_bar0 absolute bg-red-300"></div>
	<div class="characHP_bar1 absolute bg-red-500"></div>
	<div class="characHP_bar2 absolute bg-yellow-500"></div>
	<div class="characHP_bar3 absolute bg-yellow-300"></div>
	<div class="characHP_bar4 absolute bg-green-300"></div>
	<div class="characHP_bar5 absolute bg-green-500"></div>
	<div class="characHP_bar6 absolute bg-blue-300"></div>
	<div class="characHP_bar7 absolute bg-blue-500"></div>
	<div class="characHP_bar8 absolute bg-purple-300"></div>
	<div class="characHP_bar9 absolute bg-purple-500"></div>

	<!-- 왼쪽 공격 -->
	<img class="attackSize Aattack1 CharacAttack hidden absolute"
		src="${charac.extra__weapon}" alt="" />
	<!-- 위쪽 공격 -->
	<img class="attackSize Wattack1 CharacAttack hidden absolute"
		src="${charac.extra__weapon}" alt="" />
	<!-- 오른쪽 공격 -->
	<img class="attackSize Dattack1 CharacAttack hidden absolute"
		src="${charac.extra__weapon}" alt="" />
	<!-- 아래쪽 공격 -->
	<img class="attackSize Sattack1 CharacAttack hidden absolute"
		src="${charac.extra__weapon}" alt="" />
	<!-- 캐릭터 이미지 -->
	<img class="front_charac_img rounded-full"
		src="https://github.com/user-attachments/assets/aaa05c2c-d55a-4111-b367-9231727e7050"
		alt="" />
	<!-- 캐릭터 데미지 -->
	<div class="damage1 absolute z-20"></div>
</div>

<%@ include file="../common/foot.jspf"%>