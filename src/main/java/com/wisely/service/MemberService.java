package com.wisely.service;

import com.wisely.domain.MemberVO;
import com.wisely.dto.LoginDTO;

public interface MemberService {

	void join(MemberVO vo);

	MemberVO login_ok(LoginDTO dto);
	
	// Mapper 인터페이스의 메서드가 두 개 이상의 파라미터를 사용하면 에러가 발생한다.
	// 두 개 이상의 파라미터 사용 시 @Param 어노테이션을 반드시 명시해줘야 한다.
	String searchEML(String mb_brh, String mb_pn);
	
	// 임시 비밀번호 발급을 위한 확인작업 ( 아이디와 이메일 db에 존재하는지 확인 )
	String getEmailExists(String mb_eml);
	
	// 임시 비밀번호를 암호화하여 변경.
	void changePW(String mb_eml, String enc_mb_pw);
	
	// 회원정보 수정하기
	void modify(MemberVO vo);
}
