package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.CharacService;
import com.example.demo.service.MemberService;
import com.example.demo.service.WeaponService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Charac;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UsrMemberController {

	@Autowired
	private Rq rq;

	@Autowired
	private MemberService memberService;

	@Autowired
	private CharacService characService;

	@Autowired
	private WeaponService weaponService;

	// 로그아웃
	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public String doLogout(HttpServletRequest req) {
		// Rq에 저장돼 있는 정보 가져오기
		Rq rq = (Rq) req.getAttribute("rq");

		// Rq에 로그인 정보 지우기
		rq.logout();

		return Ut.jsReplace("S-1", Ut.f("로그아웃 되었습니다"), "/");
	}

	// 회원가입 페이지
	@RequestMapping("/usr/member/join")
	public String showJoin() {
		return "/usr/member/join";
	}

	// 로그인
	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(HttpServletRequest req, String loginId, String loginPw) {
		// Rq에 저장돼 있는 정보 가져오기
		Rq rq = (Rq) req.getAttribute("rq");

		// 아이디를 입력 안했을시 실패
		if (Ut.isEmptyOrNull(loginId)) {
			return Ut.jsHistoryBack("F-1", "ID를 입력해주세요");
		}
		// 비밀번호를 입력 안했을시 실패
		if (Ut.isEmptyOrNull(loginPw)) {
			return Ut.jsHistoryBack("F-2", "PW를 입력해주세요");
		}

		// 아이디가 존재하는지 확인
		Member member = memberService.getMemberByLoginId(loginId);

		// 아이디가 존재하지 않으면 실패
		if (member == null) {
			return Ut.jsHistoryBack("F-3", Ut.f("%s는(은) 존재하지 않습니다", loginId));
		}

		// 비밀번호가 일치하지 않으면 실패
		if (member.getLoginPw().equals(loginPw) == false) {
			return Ut.jsHistoryBack("F-4", Ut.f("비밀번호가 틀렸습니다"));
		}

		// Rq에 로그인 정보 저장
		rq.login(member);

		// System.out.println("memberId : "+ member.getId());

		// 캐릭터가 존재하는지 확인
		Charac charac = characService.characChack(member.getId());

		// 캐릭터가 없다면 캐릭터 생성
		if (charac == null) {
			characService.characCreation(member.getId());
			weaponService.weaponFindUpdata(member.getId(), 1);
		}

		return Ut.jsReplace("S-1", Ut.f("%s님 환영합니다", member.getNickname()), "/");
	}

	// 회원가입
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public String doJoin(HttpSession httpSession, String loginId, String loginPw, String loginPw2, String name,
			String nickname, String gender) {

		// 아이디를 입력 안했을시 실패
		if (Ut.isEmptyOrNull(loginId)) {
			return Ut.jsReplace("F-1", "아이디를 입력해주세요", "join");
		}
		// 비밀번호를 입력 안했을시 실패
		if (Ut.isEmptyOrNull(loginPw)) {
			return Ut.jsReplace("F-2", "비밀번호를 입력해주세요", "join");
		}
		// 재확인 비밀번호를 입력 안했을시 실패
		if (Ut.isEmptyOrNull(loginPw2)) {
			return Ut.jsReplace("F-2", "재확인 비밀번호를 입력해주세요", "join");
		}
		// 비밀번호와 재확인 비밀번호가 일치하지 않을시 실패
		if (!loginPw.contains(loginPw2)) {
			return Ut.jsReplace("F-2", "비밀번호가 일치하지 않습니다", "join");
		}
		// 이름을 입력 안했을시 실패
		if (Ut.isEmptyOrNull(name)) {
			return Ut.jsReplace("F-3", "이름을 입력해주세요", "join");
		}
		// 닉네임을 입력 안했을시 실패
		if (Ut.isEmptyOrNull(nickname)) {
			return Ut.jsReplace("F-4", "닉네임을 입력해주세요", "join");
		}
		// 성별을 선택 안했을시 실패
		if (Ut.isEmptyOrNull(gender)) {
			return Ut.jsReplace("F-5", "성별을 선택해주세요", "join");
		}

		// 회원가입 정보 서비스에 전달
		ResultData doJoinRd = memberService.doJoin(loginId, loginPw, name, nickname, gender);

		// 회원가입 실패여부 확인
		if (doJoinRd.isFail()) {
			return Ut.jsReplace(doJoinRd.getResultCode(), doJoinRd.getMsg(), "join");
		}

		return Ut.jsReplace("S-1", Ut.f("%s님 환영합니다", nickname), "/");
	}

	// 내 정보 페이지
	@RequestMapping("/usr/member/myPage")
	public String showmyPage() {
		return "usr/member/myPage";
	}

	// 내 정보 수정 권환 확인 페이지
	@RequestMapping("/usr/member/checkPw")
	public String showCheckPw() {
		return "usr/member/checkPw";
	}

	// 내 정보 수정 권환 확인
	@RequestMapping("/usr/member/doCheckPw")
	@ResponseBody
	public String doCheckPw(String loginPw) {
		// 비밀번호를 입력 안했을시 실패
		if (Ut.isEmptyOrNull(loginPw)) {
			return Ut.jsHistoryBack("F-1", "비밀번호를 입력해주세요");
		}

		// 입력한 비밀번호가 기존 비밀번호와 일치하지 않을 시 실패
		if (rq.getLoginedMember().getLoginPw().equals(loginPw) == false) {
			return Ut.jsHistoryBack("F-2", "비밀번호가 틀렸습니다");
		}

		return Ut.jsReplace("S-1", Ut.f("비밀번호 확인 성공"), "modify");
	}

	// 내 정보 수정 페이지
	@RequestMapping("/usr/member/modify")
	public String showmyModify() {
		return "usr/member/modify";
	}

	// 내 정부 수정
	@RequestMapping("/usr/member/doModify")
	@ResponseBody
	public String doModify(HttpServletRequest req, @RequestParam(defaultValue = "No") String loginPw, String name,
			String nickname) {
		// Rq에 저장돼 있는 정보 가져오기
		Rq rq = (Rq) req.getAttribute("rq");

		// 이름이 공백일시 실패
		if (Ut.isEmptyOrNull(name)) {
			return Ut.jsHistoryBack("F-3", "이름을 입력해주세요");
		}
		
		// 닉네임이 공백일시 실패
		if (Ut.isEmptyOrNull(nickname)) {
			return Ut.jsHistoryBack("F-4", "닉네임을 입력해주세요");
		}
		
		// 내 정보 수정
		ResultData modifyRD = memberService.modifyMember(rq.getLoginedMemberId(), loginPw, name, nickname);

		return Ut.jsReplace("S-1", Ut.f("회원정보 수정 성공"), "myPage");
	}

}