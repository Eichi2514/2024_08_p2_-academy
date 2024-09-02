package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MemberRepository;
import com.example.demo.repository.ScoreboardRepository;
import com.example.demo.vo.Scoreboard;

@Service
public class ScoreboardService {

	@Autowired
	private ScoreboardRepository scoreboardRepository;
	
	public ScoreboardService(ScoreboardRepository scoreboardRepository) {
		this.scoreboardRepository = scoreboardRepository;
	}

	public List<Scoreboard> scoreboardTop3() {
		return scoreboardRepository.scoreboardTop3();
	};

}