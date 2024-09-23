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
		max = weaponMaxChack(max);

		// System.out.println("랜덤 무기 최대값 : " + max);

		int weaponId = (int) (Math.random() * max) + 1; // 무기번호 랜덤 지정

		this.randomWeaponId = weaponId; // 생성된 웨폰아이디 저장

		return weaponRepository.weaponImg(weaponId);
	}

	public String weaponImg(int weaponId) {
		weaponId = weaponMaxChack(weaponId);
		return weaponRepository.weaponImg(weaponId);
	}

	public int weaponMaxChack(int weaponId) {
		while (weaponId > 70) { // 무기 범위를 넘어갈 시 60번대로 감소
			weaponId -= 10;
		}
		return weaponId;
	}	
}