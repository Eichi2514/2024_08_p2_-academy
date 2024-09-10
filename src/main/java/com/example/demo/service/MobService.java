package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MobRepository;

@Service
public class MobService {

	@Autowired
	private MobRepository mobRepository;

	public String mobData(int floor, int room) {
		if (room == 0)
			floor--;
		int mobimgMax = 53; // 몬스터 종류
		while (floor > mobimgMax) {
			floor -= mobimgMax;

		}
		return mobRepository.mobData(floor);
	}
}