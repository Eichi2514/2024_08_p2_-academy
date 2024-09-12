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
}