package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.WeaponRepository;

import lombok.Getter;

@Service
public class WeaponService {
	
	@Autowired
	private WeaponRepository weaponRepository;
	
	@Getter
	private int randomWeaponId;

	public String randomWeapon() {
		int num = (int) (Math.random() * 6)+1; // 좌표 랜덤 지정
		
		randomWeaponId = num;
		
		return weaponRepository.randomWeapon(num);
	}
}