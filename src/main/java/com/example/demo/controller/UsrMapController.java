package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.CharacService;
import com.example.demo.service.MapService;
import com.example.demo.vo.Charac;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrMapController {

	@Autowired
	private CharacService characService;

	@Autowired
	private MapService mapService;

	@RequestMapping("/usr/map/front")
	public String showFront(HttpServletRequest req, Model model) {

		int[][] map = mapService.mapCreation(52, 52, 46, 22); // 높이와 넓이를 전달해서 맵 생성

		Rq rq = (Rq) req.getAttribute("rq"); // HttpServletRequest에 저장돼 있는 정보 가져오기

		Charac charac = characService.characChack(rq.getLoginedMemberId()); // 캐릭터가 존재하는지 확인하기 위해 가져와보고

		if (charac == null) { // 캐릭터가 없다면

			characService.characCreation(rq.getLoginedMemberId()); // 생성 후

			charac = characService.characChack(rq.getLoginedMemberId()); // 가져와서

			model.addAttribute("charac", charac); // 모델로 보내주고
			
		} else { // 있다면
			
			model.addAttribute("charac", charac); // 바로 보내주기
		}

		return "/usr/map/front";
	}
}