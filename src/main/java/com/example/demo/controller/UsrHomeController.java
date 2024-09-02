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

	@RequestMapping("/usr/home/main")
	public String showMain(Model model, HttpServletRequest req) {
		
		List<Scoreboard> scoreboards = scoreboardService.scoreboardTop3();
		
		Rq rq = (Rq) req.getAttribute("rq");
		
		Charac charac = characService.characChack(rq.getLoginedMemberId());
		
		model.addAttribute("scoreboards", scoreboards);
		model.addAttribute("charac", charac);		
		
		return "/usr/home/main";
	}

	@RequestMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
}