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

	public String randomWeapon(int floor) {

		int max = (floor * 10) - 10;
		if (max > 70) {
			max = 70;
		}
		
		System.out.println("랜덤 무기 최대값 : " + max);
		
		int num = (int) (Math.random() * max) + 1; // 좌표 랜덤 지정

		randomWeaponId = num;

		return weaponRepository.randomWeapon(num);
	}
}