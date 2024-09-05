package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.CharacService;
import com.example.demo.service.ScoreboardService;
import com.example.demo.vo.Charac;
import com.example.demo.vo.Rq;
import com.example.demo.vo.Scoreboard;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrScoreboardController {
	
	@Autowired
	ScoreboardService scoreboardService;
	
	@Autowired
	private CharacService characService;

	@RequestMapping("/usr/scoreboard/list")
	public String showList(Model model, @RequestParam(defaultValue = "1") int page) {
		
		int itemsInAPage = 10;
		int limitFrom = (page - 1) * itemsInAPage;
		
		int totalCnt = scoreboardService.totalCnt();
		int totalPage = (int) Math.ceil(totalCnt / (double) itemsInAPage);
		
		int lpage = page - 1;
		if (page - 1 <= 0) {
			lpage = 1;
		}
		int rpage = page + 1;
		if (page + 1 >= totalPage) {
			rpage = totalPage;
		}
		
		List<Scoreboard> scoreboards = scoreboardService.scoreboardList(limitFrom, itemsInAPage);
		
		model.addAttribute("scoreboards", scoreboards);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("lpage", lpage);
		model.addAttribute("rpage", rpage);
		model.addAttribute("page", page);
		
		return "/usr/scoreboard/list";
	}
	
	@RequestMapping("/usr/scoreboard/log")
	@ResponseBody
	public void log(HttpServletRequest req) {
		
		Rq rq = (Rq) req.getAttribute("rq"); // HttpServletRequest에 저장돼 있는 정보 가져오기
		
		Charac charac = characService.characChack(rq.getLoginedMemberId()); // 캐릭터 가져오기
		System.out.println(rq.getLoginedMemberId());
		System.out.println(charac.getFloor());
		System.out.println(charac.getRoom());
		scoreboardService.log(rq.getLoginedMemberId(), charac.getFloor(), charac.getRoom());
	}
}