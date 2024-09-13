package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.CharacService;
import com.example.demo.service.FindService;
import com.example.demo.service.MobService;
import com.example.demo.service.ScoreboardService;
import com.example.demo.vo.Charac;
import com.example.demo.vo.Rq;
import com.example.demo.vo.Scoreboard;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrDictionaryController {

	@Autowired
	private MobService mobService;

	@Autowired
	private CharacService characService;

	@Autowired
	private FindService findService;

	@RequestMapping("/usr/dictionary/mob")
	public String showMobList(HttpServletRequest req, Model model) {
		// Rq에 저장돼 있는 정보 가져오기
		Rq rq = (Rq) req.getAttribute("rq");
		
		// 로그인 유저의 floor 기록 만큼 몬스터들 이미지 가져오기
		int memberFloor = rq.getLoginedMember().getFloor();
		ArrayList<String> mobImgs = mobService.mobImgs(memberFloor);

		// 로그인 유저의 무기를 발견한 기록 만큼 무기들 이미지 가져오기
		Map<Integer, String> weaponImgs = findService.weaponImgs(rq.getLoginedMemberId());

		// 로그인한 아이디의 고유번호로 캐릭터 있는지 확인해서 가져오기
		Charac charac = characService.characChack(rq.getLoginedMemberId());
		
		// 몬스터도감 정보 넘기기
		model.addAttribute("mobImgs", mobImgs);
		// 무기도감 정보 넘기기
		model.addAttribute("weaponImgs", weaponImgs);
		// 캐릭터 정보 넘기기
		model.addAttribute("charac", charac);

		return "/usr/dictionary/mob";
	}

	@RequestMapping("/usr/dictionary/weapon")
	public String showWeaponList(HttpServletRequest req, Model model) {
		// Rq에 저장돼 있는 정보 가져오기
		Rq rq = (Rq) req.getAttribute("rq");
		
		// 로그인 유저의 floor 기록 만큼 몬스터들 이미지 가져오기
		int memberFloor = rq.getLoginedMember().getFloor();
		ArrayList<String> mobImgs = mobService.mobImgs(memberFloor);

		// 로그인 유저의 무기를 발견한 기록 만큼 무기들 이미지 가져오기
		Map<Integer, String> weaponImgs = findService.weaponImgs(rq.getLoginedMemberId());

		// 로그인한 아이디의 고유번호로 캐릭터 있는지 확인해서 가져오기
		Charac charac = characService.characChack(rq.getLoginedMemberId());
		
		// 몬스터도감 정보 넘기기
		model.addAttribute("mobImgs", mobImgs);
		// 무기도감 정보 넘기기
		model.addAttribute("weaponImgs", weaponImgs);
		// 캐릭터 정보 넘기기
		model.addAttribute("charac", charac);

		return "/usr/dictionary/weapon";
	}
}