// 캐릭터 이동

let LR = 10;
let UD = 44; // 44.1
window.onload = function() {
	$(window).keydown(function(e) {
		if (e.keyCode === 37) {
			Left(1);
		} else if (e.keyCode === 38) {
			Up(1);
		} else if (e.keyCode === 39) {
			Right(1);
		} else if (e.keyCode === 40) {
			Down(1);
		}
	});
}

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

/* let isMoveKeyDown = false;
let moveInterval = null;

window.onload = function() {
	window.addEventListener("keydown", function(e) {
		// 이동 키가 눌렸을 때만 동작, 동시에 다른 키 입력 방지
		if (!isMoveKeyDown) {
			isMoveKeyDown = true;

			// 각 키에 따라 동작을 반복 실행
			if (e.keyCode === 37) { // Left
				moveInterval = setInterval(function() {
					Left(1);
				}, 50); // 정해진 시간 간격으로 반복
			} else if (e.keyCode === 38) { // Up
				moveInterval = setInterval(function() {
					Up(1);
				}, 50);
			} else if (e.keyCode === 39) { // Right
				moveInterval = setInterval(function() {
					Right(1);
				}, 50);
			} else if (e.keyCode === 40) { // Down
				moveInterval = setInterval(function() {
					Down(1);
				}, 50);
			}
		}
	});
};

// keyup 발생 시 동작 중지
$(window).keyup(function(e) {
	// 이동 키에서 손을 뗐을 때만 반복 중지
	if (e.keyCode >= 37 && e.keyCode <= 40) {
		isMoveKeyDown = false;

		// 반복 동작 중지
		if (moveInterval) {
			clearInterval(moveInterval);
			moveInterval = null;
		}
	}
});


let isAttackKeyDown = false;

$(window).keydown(function(e) {
	if (!isAttackKeyDown) {
		isAttackKeyDown = true; // 키가 눌려졌을 때 플래그 설정
		if (e.keyCode === 65) {
			// console.log('A키 눌림');
			attackA(1);
		} else if (e.keyCode === 87) {
			// console.log('W키 눌림');
			attackW(1);
		} else if (e.keyCode === 68) {
			// console.log('D키 눌림');
			attackD(1);
		} else if (e.keyCode === 83) {
			// console.log('S키 눌림');
			attackS(1);
		}
	}
});

$(window).keyup(function(e) {
	if (e.keyCode >= 65 && e.keyCode <= 87) {
		isAttackKeyDown = false; // 키가 올라갔을 때 플래그 해제
	}
}); */

function Up(something) {
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
				/*console.log('LR : ' + LR + ', UD : ' + UD);*/
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert('오류 발생 : ' + textStatus);
		}
	});
}
function Down(something) {
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
				/*console.log('LR : ' + LR + ', UD : ' + UD);*/
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert('오류 발생 : ' + textStatus);
		}
	});
}
function Left(something) {
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
				/*console.log('LR : ' + LR + ', UD : ' + UD);*/
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert('오류 발생 : ' + textStatus);
		}
	});
}

function Right(something) {
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
				/*console.log('LR : ' + LR + ', UD : ' + UD);*/
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert('오류 발생 : ' + textStatus);
		}
	});
}