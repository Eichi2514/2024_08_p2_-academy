package com.example.demo.controller;

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

	@RequestMapping("/usr/map/front")
	public String showFront(HttpServletRequest req, Model model, int stage) {

		System.out.println(stage);

		int floor = stage / 5;
		int room = stage % 5;
		// xcode = 23
		Map<String, Integer> codes = mapService.mapCreation(42, 42, 18, 1, floor, room); // 높이와 넓이를 전달해서 맵 생성

		String mob = mobService.mobData(floor, room);

		Rq rq = (Rq) req.getAttribute("rq"); // HttpServletRequest에 저장돼 있는 정보 가져오기

		Charac charac = characService.characChack(rq.getLoginedMemberId()); // 캐릭터 가져오기
		
		if (floor > 1 && room == 0) {
			String weapon = weaponService.randomWeapon();
			model.addAttribute("weapon", weapon); // 랜덤 무기 정보
		}

		model.addAttribute("charac", charac); // 캐릭터 정보
		model.addAttribute("mob", mob); // 몬스터 정보
		model.addAttribute("codes", codes); // 몬스터 위치정보
		model.addAttribute("floor", floor); // 현재 층 정보
		model.addAttribute("room", room); // 현재 방 정보

		int originallyStage = (charac.getFloor() * 5) + charac.getRoom();
		
		System.out.println(rq.getLoginedMember().getAuthLevel());

		if (((originallyStage < stage || originallyStage > stage) && stage != 5) && rq.getLoginedMember().getAuthLevel() != 7){
			return "/usr/home/main";
		}

		return "/usr/map/front";
	}

	@RequestMapping("/usr/map/keyUp")
	@ResponseBody
	public String keyUp(int something) {
		return mapService.keyUp(something);
	}

	@RequestMapping("/usr/map/keyDown")
	@ResponseBody
	public String keyDown(int something) {
		return mapService.keyDown(something);
	}

	@RequestMapping("/usr/map/keyLeft")
	@ResponseBody
	public String keyLeft(int something) {
		return mapService.keyLeft(something);
	}

	@RequestMapping("/usr/map/keyRight")
	@ResponseBody
	public String keyRight(int something) {
		return mapService.keyRight(something);
	}

	@RequestMapping("/usr/map/Aattack")
	@ResponseBody
	public int Aattack(HttpServletRequest req, int something) {
		Rq rq = (Rq) req.getAttribute("rq"); // HttpServletRequest에 저장돼 있는 정보 가져오기
		Charac charac = characService.characChack(rq.getLoginedMemberId()); // 캐릭터 가져오기
		return mapService.Aattack(something, charac.getWeaponId());
	}

	@RequestMapping("/usr/map/Wattack")
	@ResponseBody
	public int Wattack(HttpServletRequest req, int something) {
		Rq rq = (Rq) req.getAttribute("rq"); // HttpServletRequest에 저장돼 있는 정보 가져오기
		Charac charac = characService.characChack(rq.getLoginedMemberId()); // 캐릭터 가져오기
		return mapService.Wattack(something, charac.getWeaponId());
	}

	@RequestMapping("/usr/map/Dattack")
	@ResponseBody
	public int Dattack(HttpServletRequest req, int something) {
		Rq rq = (Rq) req.getAttribute("rq"); // HttpServletRequest에 저장돼 있는 정보 가져오기
		Charac charac = characService.characChack(rq.getLoginedMemberId()); // 캐릭터 가져오기
		return mapService.Dattack(something, charac.getWeaponId());
	}

	@RequestMapping("/usr/map/Sattack")
	@ResponseBody
	public int Sattack(HttpServletRequest req, int something) {
		Rq rq = (Rq) req.getAttribute("rq"); // HttpServletRequest에 저장돼 있는 정보 가져오기
		Charac charac = characService.characChack(rq.getLoginedMemberId()); // 캐릭터 가져오기
		return mapService.Sattack(something, charac.getWeaponId());
	}

	@RequestMapping("/usr/map/delete")
	@ResponseBody
	public void doDelete(int something) {
		mapService.doDelete(something);
	}

	@RequestMapping("/usr/map/over")
	public String showOver(HttpServletRequest req, Model model) {
		Rq rq = (Rq) req.getAttribute("rq"); // HttpServletRequest에 저장돼 있는 정보 가져오기

		Charac charac = characService.characChack(rq.getLoginedMemberId()); // 캐릭터 가져오기

		int floor = charac.getFloor();
		int room = charac.getRoom();

		model.addAttribute("charac", charac); // 캐릭터 정보
		model.addAttribute("floor", floor); // 현재 층 정보
		model.addAttribute("room", room); // 현재 방 정보

		characService.delete(rq.getLoginedMemberId()); // 캐릭터 삭제 후

		characService.characCreation(rq.getLoginedMemberId()); // 새로 생성		

		return "/usr/map/over";
	}
}