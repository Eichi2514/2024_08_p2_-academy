package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.CharacService;
import com.example.demo.service.ScoreboardService;
import com.example.demo.vo.Charac;
import com.example.demo.vo.Rq;
import com.example.demo.vo.Scoreboard;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrHomeController {

	@Autowired
	CharacService characService;

	@Autowired
	ScoreboardService scoreboardService;

	// 메인 페이지
	@RequestMapping("/usr/home/main")
	public String showMain(Model model, HttpServletRequest req) {

		// 점수기록판 TOP3 불러와서 리스트에 저장
		List<Scoreboard> scoreboards = scoreboardService.scoreboardTop3();

		// Rq에 저장돼 있는 정보 가져오기
		Rq rq = (Rq) req.getAttribute("rq");

		// 로그인 돼있으면 캐릭터 있는지 체크하고 넘기기
		if (rq.getLoginedMemberId() != 0) {
			Charac charac = characService.characChack(rq.getLoginedMemberId());
			model.addAttribute("charac", charac);
		}

		// 점수기록판 TOP3 불러온 리스트를 넘기기
		model.addAttribute("scoreboards", scoreboards);

		return "/usr/home/main";
	}

	// 추가URL 없어도 메인 페이지로 넘기기 
	@RequestMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
}