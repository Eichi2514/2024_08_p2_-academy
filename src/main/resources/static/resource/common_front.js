let LR = 42.55;
let UD = 80;

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
		console.log('A키 눌림')
		attackA();
	} else if (e.keyCode === 87) {
		console.log('W키 눌림')
		attackW();
	} else if (e.keyCode === 68) {
		console.log('D키 눌림')
		attackD();
	} else if (e.keyCode === 83) {
		console.log('S키 눌림')
		attackS();
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
				UD -= 1.55;
				$(".charac").css("top", UD + "vh");
				stageUp();
				console.log('LR : ' + LR + ', UD : ' + UD);
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
				UD += 1.55;
				$(".charac").css("top", UD + "vh");
				stageUp();
				console.log('LR : ' + LR + ', UD : ' + UD);
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
				LR -= 1.55;
				$(".charac").css("left", LR + "vh");
				stageUp();
				console.log('LR : ' + LR + ', UD : ' + UD);
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
				LR += 1.55;
				$(".charac").css("left", LR + "vh");
				stageUp();
				console.log('LR : ' + LR + ', UD : ' + UD);
			}
		},
		error: function(jqXHR, textStatus, errorThrown) {
			alert('오류 발생 : ' + textStatus);
		}
	});
}

function stageUp() {
	if (LR > 79 && 38 < UD && UD < 52){
		location.href='../map/front?stage='+'${stage }';
	};
}

function attackA() {
	$(".attack").removeClass('hidden');
	$(".attack").css("left", "-6vh");
	setTimeout(function() {
		$(".attack").addClass('hidden');
		$(".attack").css("left", "4vh");
	}, 100)
}

function attackW() {
	$(".attack").removeClass('hidden');
	$(".attack").css("top", "-6vh");
	setTimeout(function() {
		$(".attack").addClass('hidden');
		$(".attack").css("top", "4vh");
	}, 100)
}

function attackD() {
	$(".attack").removeClass('hidden');
	$(".attack").css("left", "14vh");
	setTimeout(function() {
		$(".attack").addClass('hidden');
		$(".attack").css("left", "4vh");
	}, 100)
}

function attackS() {
	$(".attack").removeClass('hidden');
	$(".attack").css("top", "14vh");
	setTimeout(function() {
		$(".attack").addClass('hidden');
		$(".attack").css("top", "4vh");
	}, 100)
}	