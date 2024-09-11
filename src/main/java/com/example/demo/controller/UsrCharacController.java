package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.CharacService;
import com.example.demo.service.ScoreboardService;
import com.example.demo.service.WeaponService;
import com.example.demo.vo.Charac;
import com.example.demo.vo.Rq;
import com.example.demo.vo.Scoreboard;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrCharacController {

	@Autowired
	CharacService characService;

	@Autowired
	private WeaponService weaponService;

	// 캐릭터 정보 업데이트
	@RequestMapping("/usr/charac/update")
	@ResponseBody
	public void update(HttpServletRequest req, int hp, int stage) {

		// 받은 스테이지 정보로 층과 방 구분
		int floor = stage / 5;
		int room = stage % 5;

		// Rq에 저장돼 있는 정보 가져오기
		Rq rq = (Rq) req.getAttribute("rq");

		// 로그인한 아이디의 고유번호 변수에 저장
		int memberId = rq.getLoginedMemberId();
		
		// 보스방 통과시에만 체력 증가
		if (floor != 1 && room == 1) {
			hp++;
		}
		characService.update(hp, floor, room, memberId);
	}

	// 캐릭터 무기 교체
	@RequestMapping("/usr/charac/weaponChange")
	@ResponseBody
	public void weaponChange(HttpServletRequest req) {
		/* System.out.println("무기 체인지 실행"); */

		// Rq에 저장돼 있는 정보 가져오기
		Rq rq = (Rq) req.getAttribute("rq");

		// 로그인한 아이디의 고유번호 변수에 저장
		int memberId = rq.getLoginedMemberId();

		// 랜덤 무기 고유번호 변수에 저장
		int weaponId = weaponService.getRandomWeaponId();
		
		// 가져온 랜덤무기의 고유번호로 무기 정보 업데이트
		characService.weaponChange(memberId, weaponId);
	}

	// 캐릭터 무기 조합
	@RequestMapping("/usr/charac/weaponMix")
	@ResponseBody
	public String weaponMix(HttpServletRequest req) {
		/* System.out.println("무기 조합 실행"); */

		// Rq에 저장돼 있는 정보 가져오기
		Rq rq = (Rq) req.getAttribute("rq");

		// 로그인한 아이디의 고유번호 변수에 저장
		int memberId = rq.getLoginedMemberId();
		
		// 로그인 유저의 캐릭터 정보 가져오기
		Charac charac = characService.characChack(rq.getLoginedMemberId());
		 // 현재 무기 번호 변수에 저장
		int weaponId = charac.getWeaponId();

		// 웨폰서비스에 저장돼 있는 랜덤 무기 고유번호 변수에 저장
		int weaponId2 = weaponService.getRandomWeaponId();
		// System.out.println("나누기 전 : " + weaponId2);
		
		// 밸런스 조정을 위해 나누기
		weaponId2 %= 10;
		
		// 10의 배수를 10으로 나누면 0이 되기 때문에 0이면 10으로 대체
		if (weaponId2 == 0) {
			weaponId2 = 10;
		}
		// System.out.println("나누기 후 : " + weaponId2);

		// 원래 가지고 있던 무기랑 새로운 무기 더하기
		weaponId += weaponId2;

		// 조합된 무기가 무기 조합식을 벗어나는지 체크
		weaponId = weaponService.weaponMaxChack(weaponId);

		// 조합된 무기로 무기 정보 업데이트
		characService.weaponChange(memberId, weaponId); // 무기 조합

		// 조합된 무기의 고유번호로 이미지 불러오기
		String extra__weapon = weaponService.weaponImg(weaponId);

		return extra__weapon;
	}
}