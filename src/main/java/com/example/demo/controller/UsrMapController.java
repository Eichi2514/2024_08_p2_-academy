package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrMapController {

	@RequestMapping("/usr/map/front")
	public String showFront() {
		return "/usr/map/front";
	}
}