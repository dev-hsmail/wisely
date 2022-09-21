	package com.wisely.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wisely.domain.AdminVO;
import com.wisely.service.AdminService;

import lombok.Setter;

@Controller
@RequestMapping("/admin/*")
public class AdminController {

	@Setter(onMethod_ = {@Autowired})
	private AdminService service; 
	
	// 스프링 시큐리티 암호화 클래스 주입
	@Setter(onMethod_ = {@Autowired})
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping("")
	public String adLogin() {
		
		return "/admin/adLogin";
	}
	
	@PostMapping("/adminOk")
	public String adminOk(AdminVO vo, HttpSession session) throws Exception {
		
		String url = "";
		
		AdminVO dbAdminVO = service.adminOk(vo);
		
		if(dbAdminVO != null) {		// 아이디 존재할 경우
			if (bCryptPasswordEncoder.matches(vo.getAdm_pw(), dbAdminVO.getAdm_pw())) {
				// 로그인 인증 성공
				session.setAttribute("adminStatus", dbAdminVO);	// 인증 성공 시 서버측에 세션을 통한 정보를 저장.
				url = "admin/adIndex";	// 메인페이지 주소
			} else {	// 비밀번호가 일치하지 않을 경우
				url = "admin/";	// 로그인폼 주소
			}	
		} else {	 // 아이디가 존재하지 않을 경우
			url = "admin/";
		}
		
		return "redirect:/" + url;
	}
	
	@GetMapping("/adIndex")
	public String adMain() {
		return "/admin/adIndex";
	}
	
	// 로그아웃
	@GetMapping("/adLogout")
	public String adLogout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/admin/";	// 관리자 로그인페이지 주소
	}
}
