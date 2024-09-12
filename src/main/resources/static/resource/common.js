// 프론트 js
// 캐릭터 위치 변수
let LR = 10;
let UD = 44; // 44.1

// 윈도우 로딩 체크
var windowChack = false;

window.onload = function() {
	windowChack = true;
}

var moveInterval; // 캐릭터 이동을 위한 interval
var moveSpeed = 50; // 이동 속도 조절 (ms)
var moveActionChack = null; // 현재 움직이고 있는 방향 추적

function startMoving(moveAction) {
	// 이미 해당 방향으로 움직이고 있으면 중복 방지
	if (moveActionChack === moveAction) return;

	// 새로운 방향으로 이동 시작
	stopMoving(); // 이전 움직임을 중지하고 새로운 움직임 시작
	moveActionChack = moveAction;

	moveInterval = setInterval(function() {
		if (moveAction === 'left') {
			Left(1);
		} else if (moveAction === 'up') {
			Up(1);
		} else if (moveAction === 'right') {
			Right(1);
		} else if (moveAction === 'down') {
			Down(1);
		}
	}, moveSpeed);
}

function stopMoving() {
	if (moveInterval) {
		clearInterval(moveInterval); // 이전 움직임 중지
		moveInterval = null; // interval 초기화
	}
	moveActionChack = null; // 현재 방향 초기화
}

// 캐릭터 이동
$(window).keydown(function(e) {

	// 이미 눌린 키가 아닐 때만 동작
	if (e.keyCode === 37 && moveActionChack !== 'left') {
		startMoving('left');
	} else if (e.keyCode === 38 && moveActionChack !== 'up') {
		startMoving('up');
	} else if (e.keyCode === 39 && moveActionChack !== 'right') {
		startMoving('right');
	} else if (e.keyCode === 40 && moveActionChack !== 'down') {
		startMoving('down');
	}

});

// 키에서 손을 뗄 때 움직임 멈춤
$(window).keyup(function(e) {

	// 눌렀던 방향키에서 손을 뗐을 때 이동 중지
	if ((e.keyCode === 37 && moveActionChack === 'left') ||
		(e.keyCode === 38 && moveActionChack === 'up') ||
		(e.keyCode === 39 && moveActionChack === 'right') ||
		(e.keyCode === 40 && moveActionChack === 'down')) {
		stopMoving();
	}

});



$(window).keyup(function(e) {
	if (e.keyCode === 65) {
		// console.log('A키 눌림')
		attackA(1);
	} else if (e.keyCode === 87) {
		// console.log('W키 눌림')
		attackW(1);
	} else if (e.keyCode === 68) {
		// console.log('D키 눌림')
		attackD(1);
	} else if (e.keyCode === 83) {
		// console.log('S키 눌림')
		attackS(1);
	}
});

function Up(something) {
	if (windowChack) {
		$.ajax({
			url: '/usr/map/keyUp',
			type: 'POST',
			data: {
				something: something
			},
			dataType: 'text',
			success: function(data) {
				if (data == 'success') {
					UD -= 2;
					$(".charac").css("top", UD + "vh");
					stageUp();
					showItem_text();
		//			console.log('LR : ' + LR + ', UD : ' + UD);
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert('오류 발생 : ' + textStatus);
			}
		});
	}
}
function Down(something) {
	if (windowChack) {
		$.ajax({
			url: '/usr/map/keyDown',
			type: 'POST',
			data: {
				something: something
			},
			dataType: 'text',
			success: function(data) {
				if (data == 'success') {
					UD += 2;
					$(".charac").css("top", UD + "vh");
					stageUp();
					showItem_text();
	//				console.log('LR : ' + LR + ', UD : ' + UD);
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert('오류 발생 : ' + textStatus);
			}
		});
	}
}
function Left(something) {
	if (windowChack) {
		$.ajax({
			url: '/usr/map/keyLeft',
			type: 'POST',
			data: {
				something: something
			},
			dataType: 'text',
			success: function(data) {
				if (data == 'success') {
					LR -= 2;
					$(".charac").css("left", LR + "vh");
					stageUp();
					showItem_text();
//					console.log('LR : ' + LR + ', UD : ' + UD);
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert('오류 발생 : ' + textStatus);
			}
		});
	}
}
function Right(something) {
	if (windowChack) {
		$.ajax({
			url: '/usr/map/keyRight',
			type: 'POST',
			data: {
				something: something
			},
			dataType: 'text',
			success: function(data) {
				if (data == 'success') {
					LR += 2;
					$(".charac").css("left", LR + "vh");
					stageUp();
					showItem_text();
//					console.log('LR : ' + LR + ', UD : ' + UD);
				}
			},
			error: function(jqXHR, textStatus, errorThrown) {
				alert('오류 발생 : ' + textStatus);
			}
		});
	}
}

// 인게임 헤드 js
var itemsPerPage = 4; // 한번에 보여줄 카드 개수
var currentIndex = 0; // 현재 첫 번째로 보여지는 카드의 인덱스
var totalItems = $('.mob__dictionary_card').length;
var dictionaryWidth = $('.mob__dictionary').width(); // 한 번에 보여줄 전체 너비
var cardWidth = $('.mob__dictionary_card').outerWidth(true); // 카드의 너비(마진 포함)

function updateSlide() {
    // 이동할 위치 계산 (현재 인덱스에 맞게 이동)
    var translateX = -currentIndex * cardWidth;
    $('.mob__dictionary_inner').css('transform', 'translateX(' + translateX + 'px)');
}

function mob__next() {
    if (currentIndex + itemsPerPage < totalItems) {
        currentIndex++;
    } else {
        currentIndex = 0; // 마지막 카드에 도달하면 처음으로 돌아가기
    }
    updateSlide();
}

function mob__prev() {
    if (currentIndex > 0) {
        currentIndex--;
    } else {
        currentIndex = totalItems - itemsPerPage; // 처음으로 돌아가면 마지막 페이지로 이동
    }
    updateSlide();
}

$(document).ready(function () {
    updateSlide(); // 페이지 로딩 시 첫 페이지를 보여줌
});

function showMob__dictionary(){
	$('.mob__dictionary').toggleClass('hidden');
	$('.mob__prev_bt').toggleClass('hidden');
	$('.mob__list_bt').toggleClass('hidden');
	$('.mob__next_bt').toggleClass('hidden');	
}
