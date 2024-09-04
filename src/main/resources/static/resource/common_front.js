// 캐릭터 이동

let LR = 10;
let UD = 44; // 44.1

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