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

	@RequestMapping("/usr/charac/update")
	@ResponseBody
	public void update(HttpServletRequest req, int hp, int stage) {

		int floor = stage / 5;
		int room = stage % 5;

		Rq rq = (Rq) req.getAttribute("rq");

		int memberId = rq.getLoginedMemberId();
		hp++;
		characService.update(hp, floor, room, memberId);
	}

	@RequestMapping("/usr/charac/weaponChange")
	@ResponseBody
	public void weaponChange(HttpServletRequest req) {
		/* System.out.println("무기 체인지 실행"); */

		Rq rq = (Rq) req.getAttribute("rq");

		int memberId = rq.getLoginedMemberId();

		int weaponId = weaponService.getRandomWeaponId();

		characService.weaponChange(memberId, weaponId);
	}

	@RequestMapping("/usr/charac/weaponMix")
	@ResponseBody
	public String weaponMix(HttpServletRequest req) {
		/* System.out.println("무기 체인지 실행"); */

		Rq rq = (Rq) req.getAttribute("rq"); // 공유정보 불러오기

		int memberId = rq.getLoginedMemberId(); // 저장돼있는 로그인 계정의 번호 불러오기

		Charac charac = characService.characChack(rq.getLoginedMemberId()); // 캐릭터 정보 가져오기
		int weaponId = charac.getWeaponId(); // 무기 번호 저장

		int weaponId2 = weaponService.getRandomWeaponId();
		// System.out.println("나누기 전 : " + weaponId2);
		weaponId2 %= 10; // 밸런스 조정을 위해 나누기
		if (weaponId2 == 0) { // 10의 배수를 10으로 나누면 0이 되기 때문에 10으로 대체
			weaponId2 = 10;
		}
		// System.out.println("나누기 후 : " + weaponId2);

		weaponId += weaponId2; // 원래 가지고 있던 무기랑 새로운 무기 더하기

		weaponId = weaponService.weaponMaxChack(weaponId);

		characService.weaponChange(memberId, weaponId); // 무기 조합

		String extra__weapon = weaponService.weaponImg(weaponId);

		return extra__weapon;
	}
}