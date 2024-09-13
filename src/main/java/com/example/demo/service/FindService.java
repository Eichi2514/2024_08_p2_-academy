package com.example.demo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.FindRepository;
import com.example.demo.vo.Find;

@Service
public class FindService {

	@Autowired
	private FindRepository findRepository;

	public int weaponFind(int memberId, int weaponId) {
		return findRepository.weaponFind(memberId, weaponId);
	}

	public Map<Integer, String> weaponImgs(int loginedMemberId) {
		ArrayList<Find> weaponImgList = findRepository.weaponImgs(loginedMemberId);
		Map<Integer, String> weaponImgs = new HashMap<Integer, String>();

		for (int i = 0; i < weaponImgList.size(); i++) {
		weaponImgs.put(weaponImgList.get(i).getId(), weaponImgList.get(i).getImg());
		};

		return weaponImgs;
	}
}