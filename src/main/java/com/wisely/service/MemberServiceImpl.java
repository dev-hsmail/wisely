package com.wisely.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wisely.domain.MemberVO;
import com.wisely.dto.LoginDTO;
import com.wisely.mapper.MemberMapper;

import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {

	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memMapper;
	
	@Override
	public void join(MemberVO vo) {
		
		memMapper.join(vo);
	}

	@Override
	public MemberVO login_ok(LoginDTO dto) {
		
		return memMapper.login_ok(dto);
	}

	@Override
	public String searchEML(String mb_brh, String mb_pn) {
		
		return memMapper.searchEML(mb_brh, mb_pn);
	}

	@Override
	public String getEmailExists(String mb_eml) {
		
		return memMapper.getEmailExists(mb_eml);
	}

	@Override
	public void changePW(String mb_eml, String enc_mb_pw) {
		
		memMapper.changePW(mb_eml, enc_mb_pw);
	}

	@Override
	public void modify(MemberVO vo) {
		
		memMapper.modify(vo);
	}

}
