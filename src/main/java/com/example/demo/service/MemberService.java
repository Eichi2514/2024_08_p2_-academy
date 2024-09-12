package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MemberRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

@Service
public class MemberService {

	@Autowired
	private MemberRepository memberRepository;

	public MemberService(MemberRepository memberRepository) {
		this.memberRepository = memberRepository;
	}

	public ResultData<Integer> doJoin(String loginId, String loginPw, String name, String nickname, String gender) {

		Member existsMember = getMemberByLoginId(loginId);

		if (existsMember != null) {
			return ResultData.from("F-7", Ut.f("이미 사용중인 아이디(%s)입니다.", loginId));
		}

		memberRepository.doJoin(loginId, loginPw, name, nickname, gender);

		int id = memberRepository.getLastInsertId();

		return ResultData.from("S-1", "회원가입 성공", "생성된 회원 id", id);
	}

	private Member getMemberByNameAndEmail(String name, String email) {
		return memberRepository.getMemberByNameAndEmail(name, email);
	}

	public Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}

	public Member getMemberById(int id) {
		return memberRepository.getMemberById(id);
	}

	public ResultData modifyMember(int loginedMemberId, String loginPw, String name, String nickname) {
		memberRepository.modifyMember(loginedMemberId, loginPw, name, nickname);
		return ResultData.from("S-1", "수정 완료");

	}

	public void floorUpdate(int loginedMemberId, int floor) {
		memberRepository.floorUpdate(loginedMemberId, floor);		
	}

}