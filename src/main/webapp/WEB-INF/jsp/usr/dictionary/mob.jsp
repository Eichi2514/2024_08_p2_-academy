<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="몬스터 도감"></c:set>
<%@ include file="../common/ingame_head.jspf"%>


<!-- p2 맵 배경 -->
<img class="bg_img"
	src="https://github.com/user-attachments/assets/04fa2504-f697-4a59-8626-89551e8611da"
	alt="" />
<div class="mob__dictionary_title absolute">몬스터 도감</div>
<div class="mob__dictionary2 absolute">
	<div class="mob__dictionary_inner2">
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 0? mobImgs.get(0):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">1층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 1? mobImgs.get(1):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">2층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 2? mobImgs.get(2):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">3층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 3? mobImgs.get(3):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">4층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 4? mobImgs.get(4):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">5층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 5? mobImgs.get(5):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">6층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 6? mobImgs.get(6):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">7층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 7? mobImgs.get(7):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">8층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 8? mobImgs.get(8):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">9층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 9? mobImgs.get(9):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">10층 몬스터</div>
		</div>
	</div>
	<div class="mob__dictionary_inner2">
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 10? mobImgs.get(10):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">11층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 11? mobImgs.get(11):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">12층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 12? mobImgs.get(12):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">13층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 13? mobImgs.get(13):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">14층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 14? mobImgs.get(14):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">15층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 15? mobImgs.get(15):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">16층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 16? mobImgs.get(16):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">17층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 17? mobImgs.get(17):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">18층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 18? mobImgs.get(18):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">19층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 19? mobImgs.get(19):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">20층 몬스터</div>
		</div>
	</div>
	<div class="mob__dictionary_inner2">
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 20? mobImgs.get(20):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">21층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 21? mobImgs.get(21):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">22층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 22? mobImgs.get(22):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">23층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 23? mobImgs.get(23):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">24층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 24? mobImgs.get(24):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">25층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 25? mobImgs.get(25):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">26층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 26? mobImgs.get(26):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">27층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 27? mobImgs.get(27):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">28층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 28? mobImgs.get(28):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">29층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 29? mobImgs.get(29):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">30층 몬스터</div>
		</div>
	</div>
	<div class="mob__dictionary_inner2">
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 30? mobImgs.get(30):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">31층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 31? mobImgs.get(31):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">32층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 32? mobImgs.get(32):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">33층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 33? mobImgs.get(33):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">34층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 34? mobImgs.get(34):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">35층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 35? mobImgs.get(35):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">36층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 36? mobImgs.get(36):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">37층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 37? mobImgs.get(37):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">38층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 38? mobImgs.get(38):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">39층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 39? mobImgs.get(39):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">40층 몬스터</div>
		</div>
	</div>
	<div class="mob__dictionary_inner2">
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 40? mobImgs.get(40):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">41층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 41? mobImgs.get(41):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">42층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 42? mobImgs.get(42):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">43층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 43? mobImgs.get(43):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">44층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 44? mobImgs.get(44):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">45층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 45? mobImgs.get(45):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">46층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 46? mobImgs.get(46):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">47층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 47? mobImgs.get(47):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">48층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 48? mobImgs.get(48):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">49층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 49? mobImgs.get(49):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">50층 몬스터</div>
		</div>
	</div>
	<div class="mob__dictionary_inner2">
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 50? mobImgs.get(50):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">51층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 51? mobImgs.get(51):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">52층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2">
			<img src="${mobImgs.size() > 52? mobImgs.get(52):''}"
				alt="https://github.com/user-attachments/assets/34628dee-0e58-4d89-a510-13ebb9a2dcae"
				class="mob__dictionary_title2"
				onerror="this.onerror=null; this.src=this.alt;">
			<div class="mob__dictionary_body2">53층 몬스터</div>
		</div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
	</div>
	<div class="mob__dictionary_inner2">
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
	</div>
	<div class="mob__dictionary_inner2">
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
		<div class="mob__dictionary_card2"></div>
	</div>
</div>

<a class="dictionary_exit_bt absolute cursor-pointer" href="../map/front?stage=${(charac.floor * 5) + charac.room}">나가기</a>

<%@ include file="../common/foot.jspf"%>