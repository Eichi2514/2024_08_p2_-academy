package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.CharacRepository;
import com.example.demo.vo.Charac;

@Service
public class CharacService {

	@Autowired
	private CharacRepository characRepository;

	public CharacService(CharacRepository characRepository) {
		this.characRepository = characRepository;
	}

	public void characCreation(int loginedMemberId) {
		characRepository.characCreation(loginedMemberId);
	}

	public Charac characChack(int loginedMemberId) {
		return characRepository.characChack(loginedMemberId);
	}

	public void update(int hp, int floor, int room, int memberId) {


		// 보스방 통과시에만 체력 증가
		if (floor != 1 && room == 1 && hp < 10) {
			hp++;
		}
		
		characRepository.update(hp, floor, room, memberId);
	}

	public void weaponChange(int memberId, int weaponId) {
		/* System.out.println("무기 체인지 서비스 실행"); */
		/* System.out.println(weaponId); */
		characRepository.weaponChange(memberId, weaponId);
	}

	public void reset(int memberId) {
		characRepository.reset(memberId);

	}

	public String itemGet(int memberId, int floor, int power, int speed) {
		int randomMax = floor * 50;
		if (randomMax > 2000){
			randomMax = 2000;
		}
		int random_ability = (int) (Math.random() * randomMax) + 1;
		int ability = 1;
		int point = power;
		int probability = 0;
		String msg;
	    if (random_ability <= (probability += 200)) {
			ability = 1;
			point = power + 1;
			System.out.println("힘 +1");
			msg = "힘 +1";
		} else if (random_ability <= (probability += 70)) {
			ability = 1;
			point = power + 2;
			System.out.println("힘 +2");
			msg = "힘 +2";
		} else if (random_ability <= (probability += 50)) {
			ability = 1;
			point = power + 3;
			System.out.println("힘 +3");
			msg = "힘 +3";
		} else if (random_ability <= (probability += 40)) {
			ability = 1;
			point = power + 4;
			System.out.println("힘 +4");
			msg = "힘 +4";
		} else if (random_ability <= (probability += 35)) {
			ability = 1;
			point = power + 5;
			System.out.println("힘 +5");
			msg = "힘 +5";
		} else if (random_ability <= (probability += 50)) {
			ability = 2;
			point = speed - 10;
			System.out.println("속도 +10");
			msg = "속도 +10";
		} else if (random_ability <= (probability += 50)) { 
			ability = 2;
			point = speed + 10;
			msg = "속도 -10";
			System.out.println("속도 -10");
		} else if (random_ability <= (probability += 100)) {
			ability = 1;
			point = power - 1;
			msg = "힘 -1";
			System.out.println("힘 -1");
		} else if (random_ability <= (probability += 70)) {
			ability = 1;
			point = power - 2;
			System.out.println("힘 -2");
			msg = "힘 -2";
		} else if (random_ability <= (probability += 50)) {
			ability = 1;
			point = power - 3;
			System.out.println("힘 -3");
			msg = "힘 -3";
		} else if (random_ability <= (probability += 40)) {
			ability = 1;
			point = power - 4;
			System.out.println("힘 -4");
			msg = "힘 -4";
		} else if (random_ability <= (probability += 35)) {
			ability = 1;
			point = power - 5;
			System.out.println("힘 -5");
			msg = "힘 -5";
		} else if (random_ability <= (probability += 25)) {
			ability = 1;
			point = power + 6;
			System.out.println("힘 +6");
			msg = "힘 +6";
		} else if (random_ability <= (probability += 15)) {
			ability = 1;
			point = power + 7;
			System.out.println("힘 +7");
			msg = "힘 +7";
		} else if (random_ability <= (probability += 10)) {
			ability = 1;
			point = power + 8;
			System.out.println("힘 +8");
			msg = "힘 +8";
		} else if (random_ability <= (probability += 4)) { 
			ability = 1;
			point = power + 9;
			System.out.println("힘 +9");
			msg = "힘 +9";
		} else if (random_ability <= (probability += 1)) { 
			ability = 1;
			point = power + 10;
			System.out.println("힘 +10");
			msg = "힘 +10";
		} else if (random_ability <= (probability += 25)) {
			ability = 1;
			point = power - 6;
			System.out.println("힘 -6");
			msg = "힘 -6";
		} else if (random_ability <= (probability += 15)) {
			ability = 1;
			point = power - 7;
			System.out.println("힘 -7");
			msg = "힘 -7";
		} else if (random_ability <= (probability += 10)) {
			ability = 1;
			point = power - 8;
			System.out.println("힘 -8");
			msg = "힘 -8";
		} else if (random_ability <= (probability += 4)) {
			ability = 1;
			point = power - 9;
			System.out.println("힘 -9");
			msg = "힘 -9";
		} else if (random_ability <= (probability += 1)) {
			ability = 1;
			point = power - 10;
			System.out.println("힘 -10");
			msg = "힘 -10";
		} else if (random_ability <= (probability += 30)) {
			ability = 2;
			point = speed - 20;
			System.out.println("속도 +20");
			msg = "속도 +20";
		} else if (random_ability <= (probability += 30)) {
			ability = 2;
			point = speed + 20;
			System.out.println("속도 -20");
			msg = "속도 -20";
		} else if (random_ability <= (probability += 15)) {
			ability = 2;
			point = speed - 30;
			System.out.println("속도 +30");
			msg = "속도 +30";
		} else if (random_ability <= (probability += 15)) {
			ability = 2;
			point = speed + 30;
			System.out.println("속도 -30");
			msg = "속도 -30";
		} else if (random_ability <= (probability += 4)) {
			ability = 2;
			point = speed - 40;
			System.out.println("속도 +40");
			msg = "속도 +40";
		} else if (random_ability <= (probability += 4)) {
			ability = 2;
			point = speed + 40;
			System.out.println("속도 -40");
			msg = "속도 -40";
		} else if (random_ability <= (probability += 1)) {
			ability = 2;
			point = speed - 50;
			System.out.println("속도 +50");
			msg = "속도 +50";
		} else if (random_ability <= (probability += 1)) {
			ability = 2;
			point = speed + 50;
			System.out.println("속도 -50");
			msg = "속도 -50";
		} else {
			System.out.println("꽝");
			msg = "꽝";
		}
		
		if (ability == 1 && point < 0) {
			point = 0;
		}
		if (ability == 2 && point < 10) {
			point = 10;
		}else if (ability == 2 && point > 100) {
			point = 100;
		}
		/*
		System.out.println("아이템 획득 서비스 실행");		
		*/
		
		characRepository.itemGet(memberId, ability, point);
		
		return msg;
	}
}