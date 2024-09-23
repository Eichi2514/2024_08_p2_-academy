package com.example.demo.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MobRepository;

@Service
public class MobService {

	@Autowired
	private MobRepository mobRepository;

	public String mobData(int floor, int room) {
		if (room == 0) {
			floor--;
		}

		floor = mobimgMaxChack(floor);

		return mobRepository.mobData(floor);
	}

	public ArrayList<String> mobImgs(int floor) {

		return mobRepository.mobImgs(floor);
	}
	
	public int mobimgMaxChack(int floor) {
		int mobimgMax = 53; // 몬스터 종류
		if (floor > mobimgMax) {
			floor = (int) (Math.random() * 53) + 1;
		}
		return floor;
	}
}