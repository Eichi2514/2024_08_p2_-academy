package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.CharacService;
import com.example.demo.service.ScoreboardService;
import com.example.demo.vo.Charac;
import com.example.demo.vo.Rq;
import com.example.demo.vo.Scoreboard;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrCharacController {

	@Autowired
	CharacService characService;

	@RequestMapping("/usr/charac/update")
	@ResponseBody
	public void update(HttpServletRequest req, int hp, int stage, int weaponId) {
		
		int floor = stage / 5;		
		int room = stage % 5;
		
		Rq rq = (Rq) req.getAttribute("rq");
		
		int memberId = rq.getLoginedMemberId();
		
		characService.update(hp, floor, room, weaponId, memberId);		
	}
}