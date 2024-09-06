package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.WeaponRepository;

@Service
public class WeaponService {
	
	@Autowired
	private WeaponRepository weaponRepository;

	public String randomWeapon() {
		int num = (int) (Math.random() * 9)+1; // 좌표 랜덤 지정
		return weaponRepository.randomWeapon(num);
	}
}