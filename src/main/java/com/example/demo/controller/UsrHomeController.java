package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.ScoreboardService;
import com.example.demo.vo.Scoreboard;

@Controller
public class UsrHomeController {
	
	@Autowired
	ScoreboardService scoreboardService;

	@RequestMapping("/usr/home/main")
	public String showMain(Model model) {
		
		List<Scoreboard> scoreboards = scoreboardService.scoreboardTop3();
		
		model.addAttribute("scoreboards", scoreboards);
		
		return "/usr/home/main";
	}

	@RequestMapping("/")
	public String showRoot() {
		return "redirect:/usr/home/main";
	}
}