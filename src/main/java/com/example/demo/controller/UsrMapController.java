package com.example.demo.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.CharacService;
import com.example.demo.service.MapService;
import com.example.demo.service.MobService;
import com.example.demo.service.WeaponService;
import com.example.demo.vo.Charac;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrMapController {

	@Autowired
	private CharacService characService;

	@Autowired
	private MapService mapService;

	@Autowired
	private MobService mobService;

	@Autowired
	private WeaponService weaponService;

	// 게임 화면
	@RequestMapping("/usr/map/front")
	public String showFront(HttpServletRequest req, Model model, int stage) {
		/* System.out.println("스테이지 : "+stage); */

		// 받은 스테이지 정보로 층과 방 구분
		int floor = stage / 5;
		int room = stage % 5;

		// 방의 높이, 방의 넓이, 캐릭터 X축, 캐릭터 Y축, 층과 방 정보 서비스에 전달해서
		// 캐릭터랑 몬스터 좌표 생성
		Map<String, Integer> codes = mapService.mapCreation(42, 42, 18, 1, floor, room);

		// 층과 방의 정보로 해당 스테이지에 맞는 몬스터 이미지 불러오기
		String mob = mobService.mobData(floor, room);

		// Rq에 저장돼 있는 정보 가져오기
		Rq rq = (Rq) req.getAttribute("rq");

		// 로그인한 아이디의 고유번호로 캐릭터 있는지 확인해서 가져오기
		Charac charac = characService.characChack(rq.getLoginedMemberId());

		// 층과 방의 정보로 보스방이면 랜덤무기 이미지 가져와서 넘기기
		if (floor > 1 && room == 0) {
			String weapon = weaponService.randomWeapon(charac.getFloor());
			model.addAttribute("weapon", weapon);
		}

		// 로그인 유저의 floor 기록 만큼 몬스터들 이미지 가져오기
		int memberFloor = rq.getLoginedMember().getFloor();
		ArrayList<String> mobImgs = mobService.mobImgs(memberFloor);
		
		/*
		 * for(int i = 0; i < mobImgs.size(); i++) {
		 * System.out.println(i+"번방 : "+mobImgs.get(i)); }
		 */
		
		// 캐릭터 정보 넘기기
		model.addAttribute("charac", charac);
		// 몬스터도감 정보 넘기기
		model.addAttribute("mobImgs", mobImgs);
		// 몬스터 정보 넘기기
		model.addAttribute("mob", mob);
		// 몬스터 위치정보 넘기기
		model.addAttribute("codes", codes);
		// 현재 층 정보 넘기기
		model.addAttribute("floor", floor);
		// 현재 방 정보 넘기기
		model.addAttribute("room", room);

		// 현재 캐릭터의 위치정보 변수에 저장
		int originallyStage = (charac.getFloor() * 5) + charac.getRoom();
		/* System.out.println("로그인계정 권한 레벨 : "+rq.getLoginedMember().getAuthLevel()); */

		// 현재 캐릭터의 위치정보가 이동하려는 스테이지보다 작거나 크고
		// 튜토리얼이 아니면 메인페이지로 이동
		if (((originallyStage < stage || originallyStage > stage) && stage != 5)
				&& rq.getLoginedMember().getAuthLevel() != 7) {
			return "/usr/home/main";
		}

		return "/usr/map/front";
	}

	// 누구의 위쪽 이동 이벤트인지 서비스에 전달
	@RequestMapping("/usr/map/keyUp")
	@ResponseBody
	public String keyUp(int something) {
		return mapService.keyUp(something);
	}

	// 누구의 아래쪽 이동 이벤트인지 서비스에 전달
	@RequestMapping("/usr/map/keyDown")
	@ResponseBody
	public String keyDown(int something) {
		return mapService.keyDown(something);
	}

	// 누구의 왼쪽 이동 이벤트인지 서비스에 전달
	@RequestMapping("/usr/map/keyLeft")
	@ResponseBody
	public String keyLeft(int something) {
		return mapService.keyLeft(something);
	}

	// 누구의 오른쪽 이동 이벤트인지 서비스에 전달
	@RequestMapping("/usr/map/keyRight")
	@ResponseBody
	public String keyRight(int something) {
		return mapService.keyRight(something);
	}

	// 누구의 왼쪽 공격 이벤트인지 서비스에 전달
	@RequestMapping("/usr/map/Aattack")
	@ResponseBody
	public int Aattack(HttpServletRequest req, int something) {
		// Rq에 저장돼 있는 정보 가져오기
		Rq rq = (Rq) req.getAttribute("rq");

		// 로그인 유저의 캐릭터 정보 가져오기
		Charac charac = characService.characChack(rq.getLoginedMemberId());

		return mapService.Aattack(something, charac.getWeaponId());
	}

	// 누구의 위쪽 공격 이벤트인지 서비스에 전달
	@RequestMapping("/usr/map/Wattack")
	@ResponseBody
	public int Wattack(HttpServletRequest req, int something) {
		// Rq에 저장돼 있는 정보 가져오기
		Rq rq = (Rq) req.getAttribute("rq");

		// 로그인 유저의 캐릭터 정보 가져오기
		Charac charac = characService.characChack(rq.getLoginedMemberId());

		return mapService.Wattack(something, charac.getWeaponId());
	}

	// 누구의 오른쪽 공격 이벤트인지 서비스에 전달
	@RequestMapping("/usr/map/Dattack")
	@ResponseBody
	public int Dattack(HttpServletRequest req, int something) {
		// Rq에 저장돼 있는 정보 가져오기
		Rq rq = (Rq) req.getAttribute("rq");

		// 로그인 유저의 캐릭터 정보 가져오기
		Charac charac = characService.characChack(rq.getLoginedMemberId());

		return mapService.Dattack(something, charac.getWeaponId());
	}

	// 누구의 아래쪽 공격 이벤트인지 서비스에 전달
	@RequestMapping("/usr/map/Sattack")
	@ResponseBody
	public int Sattack(HttpServletRequest req, int something) {
		// Rq에 저장돼 있는 정보 가져오기
		Rq rq = (Rq) req.getAttribute("rq");

		// 로그인 유저의 캐릭터 정보 가져오기
		Charac charac = characService.characChack(rq.getLoginedMemberId());

		return mapService.Sattack(something, charac.getWeaponId());
	}

	// 누가 죽었는지 서비스에 전달
	@RequestMapping("/usr/map/delete")
	@ResponseBody
	public void doDelete(int something) {
		mapService.doDelete(something);
	}

	// 게임 오버 페이지
	@RequestMapping("/usr/map/over")
	public String showOver(HttpServletRequest req, Model model) {
		// Rq에 저장돼 있는 정보 가져오기
		Rq rq = (Rq) req.getAttribute("rq");

		// 로그인 유저의 캐릭터 정보 가져오기
		Charac charac = characService.characChack(rq.getLoginedMemberId());

		// 캐릭터의 현재 층 정보 변수에 저장
		int floor = charac.getFloor();

		// 캐릭터의 현재 방 정보 변수에 저장
		int room = charac.getRoom();

		// 캐릭터 정보 넘기기
		model.addAttribute("charac", charac);
		// 현재 층 정보 넘기기
		model.addAttribute("floor", floor);
		// 현재 방 정보 넘기기
		model.addAttribute("room", room);

		// 캐릭터 삭제
		characService.reset(rq.getLoginedMemberId());

		return "/usr/map/over";
	}
}