package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.ScoreboardService;
import com.example.demo.vo.Scoreboard;

@Controller
public class UsrScoreboardController {
	
	@Autowired
	ScoreboardService scoreboardService;

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
}