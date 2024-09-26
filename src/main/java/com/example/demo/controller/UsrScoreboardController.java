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
		// 한 페이지에 나타낼 갯수 변수에 저장
		int itemsInAPage = 10;
		// 페이지 범위 변수에 저장
		int limitFrom = (page - 1) * itemsInAPage;
		
		// 현재 스코어의 갯수 변수에 저장
		int totalCnt = scoreboardService.totalCnt();
		// 스코어 페이지의 갯수 변수에 저장
		int totalPage = (int) Math.ceil(totalCnt / (double) itemsInAPage);
		
		// 현재 페이지의 이전 페이지 변수에 저장
		int lpage = page - 1;
		if (page - 1 <= 0) {
			lpage = 1;
		}
		// 현재 페이지의 다음 페이지 변수에 저장
		int rpage = page + 1;
		if (page + 1 >= totalPage) {
			rpage = totalPage;
		}
		
		// 스코어들 가져오기
		List<Scoreboard> scoreboards = scoreboardService.scoreboardList(limitFrom, itemsInAPage);
		
		// 스코어들 넘기기
		model.addAttribute("scoreboards", scoreboards);
		// 현재 스코어의 갯수 넘기기
		model.addAttribute("totalCnt", totalCnt);
		// 스코어 페이지의 갯수 넘기기
		model.addAttribute("totalPage", totalPage);
		// 현재 페이지의 이전 페이지 넘기기
		model.addAttribute("lpage", lpage);
		// 현재 페이지의 다음 페이지 넘기기
		model.addAttribute("rpage", rpage);
		// 현재 페이지 넘기기
		model.addAttribute("page", page);
		
		return "/usr/scoreboard/list";
	}
	
	// 스코어 남기기
	@RequestMapping("/usr/scoreboard/log")
	@ResponseBody
	public void log(HttpServletRequest req) {
		// Rq에 저장돼 있는 정보 가져오기
		Rq rq = (Rq) req.getAttribute("rq");
		// 로그인한 아이디의 고유번호 변수에 저장
		int memberId = rq.getLoginedMemberId();
		
		// 로그인 유저의 캐릭터 정보 가져오기		
		Charac charac = characService.characChack(rq.getLoginedMemberId()); // 캐릭터 가져오기
		// 불러온 캐릭터의 층 변수에 저장
		int floor = charac.getFloor();
		// 불러온 캐릭터의 방 변수에 저장
		int room = charac.getRoom();
		// 불러온 캐릭터의 방 변수에 저장
		int clearTime = charac.getClearTime();
		/*
		 * System.out.println(rq.getLoginedMemberId());
		 * System.out.println(charac.getFloor()); 
		 * System.out.println(charac.getRoom());
		 */
		scoreboardService.log(memberId, floor, room, clearTime);
	}
}