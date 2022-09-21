package com.wisely.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wisely.domain.MemberVO;
import com.wisely.dto.EmailDTO;
import com.wisely.dto.LoginDTO;
import com.wisely.service.EmailService;
import com.wisely.service.MemberService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/member/*")
@Controller
public class MemberController {

	// 스프링 시큐리티 암호화 클래스 주입
	@Setter(onMethod_ = {@Autowired})
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@Setter(onMethod_ = {@Autowired})
	private MemberService memService;
	
	@Setter(onMethod_ = {@Autowired})
	private EmailService mailService;
	
	@GetMapping("/join")
	public void join() {
		
	}
	
	@PostMapping("/join")
	public String join(MemberVO vo, RedirectAttributes rttr) throws Exception {
		
		// cryptEncoderPW에 암호화된 비밀번호가 들어온다.
		String cryptEncoderPW = bCryptPasswordEncoder.encode(vo.getMb_pw());
		
		vo.setMb_pw(cryptEncoderPW);	// 평문텍스트 비밀번호 -> 암호화된 비밀번호로 변경

		if(vo.getMb_ntfc_rcv() != null && vo.getMb_ntfc_rcv().equals("on")) {
			vo.setMb_ntfc_rcv("Y");
		} vo.setMb_ntfc_rcv("N");
		
		//log.info(vo);
		
		memService.join(vo);
		
		return "/member/login";
	}
	
	// 아이디 중복체크
	/*
	@ResponseBody
	@GetMapping("/emailCheck")
	public ResponseEntity<String> emailCheck(@RequestParam("mb_eml") String mb_eml) {
		
		ResponseEntity<String> entity = null;
		
		// 아이디 존재여부 작업
		String isUseEMAIL = "";
		
		if (memService.emailCheck(mb_eml) != null) {	// email이 null이 아니면 사용 불가한 아이디
			isUseEMAIL = "no";
		}else{	// email이 null이면 사용 가능한 아이디
			isUseEMAIL = "yes";
		}
		
		entity = new ResponseEntity<String>(isUseEMAIL, HttpStatus.OK);
		
		return entity;
	}
	*/
	
	// 로그인 폼
	@GetMapping("/login")
	public void login() {
		
	}
	
	// 로그인 인증작업
	@PostMapping("/loginPost") 
	public String login_ok(LoginDTO dto, RedirectAttributes rttr, HttpSession session) throws Exception {	//db작업을 위해 throws Exception 명시
		
		// --------------- RedirectAttributes인터페이스 주요메서드 설명 ---------------
		
		// 1) rttr.addFlashAttribute(attributeName, AttributeValue); : 페이지 이동주소의 jsp에서 참조할 경우
		
		// 2) rttr.addAttribute(attributeName, attributeValue); 	 : 리다이렉트 주소에 파라미터로 사용. /member/login?pageNum=값&amount=값
		
		/*
		 	rttr.addAttribute("pageNum", pageNum);
		 	rttr.addAttribute("amount", amount);
		 */
		
		// ---------------------------------------------------------------------
		
		// 로그인 정보 인증작업
		MemberVO vo = memService.login_ok(dto);
		
		String url = "";
		String msg = "";
		
		if(vo != null) {	// 아이디가 존재하는 경우
			
			// 사용자가 입력한 평문텍스트(일반비번)와 DB에 저장된 암호화된 비밀번호를 비교작업
			
			// 1) 비번일치되는 경우
			String passwd = dto.getMb_pw();		// 사용자가 입력한 비밀번호
			String db_passwd = vo.getMb_pw();	// DB에서 가져온 비밀번호
			
			// matches(평문텍스트 비번, db에서 가져온 암호화 비번)
			if (bCryptPasswordEncoder.matches(passwd, db_passwd)) {
				url = "/";	// 메인페이지 주소
				session.setAttribute("loginStatus", vo);	// 인증 성공 시 서버측에 세션을 통한 정보를 저장.
				msg = "loginSuccess";		
			} else {
				// 2) 비번 일치되지 않는 경우
				url = "/member/login";	// 로그인폼 주소
				msg = "passwdFailure";
			}
			
		} else {	// 아이디가 존재하지 않는 경우
			url = "/member/login";		// 로그인폼 주소
			msg = "idFailure";
		}
		
		rttr.addFlashAttribute("msg", msg);	// 이동하는 주소의 jsp에서 참조함.
		
		// 아이디와 비밀번호가 일치되면 로그인된 화면으로 넘어가야하고, 하나라도 일치하지 않으면 로그인폼 화면으로 다시 이동해야 한다.
		
		return "redirect:" + url;	// redirect로 해당주소로 이동하기 위할 때는 리턴타입이 String이 된다. (중요)	
	}
	
	// 로그아웃
	// 보안 생각을 하면 로그아웃은 get방식이 아닌 post방식을 해야하나 깊이가 있어 현 예제에서는 get방식으로 처리해본다.
	@GetMapping("/logout")
	public String logout(HttpSession session, RedirectAttributes rttr) {	// 로그아웃 후 redirect로 페이지 이동이 일어나므로 String 리턴타입으로 설정한다.
		
		// 세션소멸
		session.invalidate();	// 모든 세션을 소멸시키는 메소드 invalidate();
		
		rttr.addFlashAttribute("msg", "logout");	// 이동하는 주소의 jsp에서 참조함.
		
		return "redirect:/";	// 메인주소로 redirect
	}
	
	// 아이디 및 비밀번호  찾기 폼
	@GetMapping("/lostpass")
	public void lostpass() {
		
	}
	
	// 아이디 찾기
	@PostMapping("/searchEML")
	public String searchEML(@RequestParam("mb_brh") String mb_brh, @RequestParam("mb_pn") String mb_pn,
			Model model, RedirectAttributes rttr) {
		
		//log.info("이름: " + mb_nm);
		
		String mb_eml = memService.searchEML(mb_brh, mb_pn);
		
		String url = "";
		
		if (mb_eml != null) {
			model.addAttribute("mb_eml", mb_eml);	// key, value
			url = "/member/searchEML";	// jsp파일이름 > redirect가 빠지면 파일명
		} else {
			// url = "주소" 방식을 직접 요청하게 되면 GET 방식을 요청하게 된다.
			url = "redirect:/member/lostpass";	// 이동주소(GET방식요청) > redirect가 붙으면 이동주소
			rttr.addFlashAttribute("msg", "noEML");
		}
		
		return url;
		
	}
	
	// 임시비밀번호 발급
	@PostMapping("/searchImsiPW")
	public String searchImsiPW(@RequestParam("mb_eml") String mb_eml,
			Model model, RedirectAttributes rttr) {
		
		String db_mb_eml = memService.getEmailExists(mb_eml);
		String temp_mb_pw = "";	// 임시비밀번호 의미의 필드 선언
		String url = "";
		
		log.info("hello");
		
		if (db_mb_eml != null) {
		
			log.info("hello2");
			
			//메일보내기 작업
			
			// 1) 임시 비밀번호 생성
			UUID uid = UUID.randomUUID();
			temp_mb_pw = uid.toString().substring(0, 6);	// 인덱스 6은 제외한 범위의 0 <= x < 6. 6자리 문자열
			
			log.info("임시 비밀번호: " + temp_mb_pw);
			
			// 2) temp_mb_pw 임시 비밀번호를 암호화하여, db에 저장
			memService.changePW(mb_eml, bCryptPasswordEncoder.encode(temp_mb_pw));
			
			// 3) 메일 보내기
			EmailDTO dto = new EmailDTO("WISELY", "WISELY", mb_eml, "WISELY 임시 비밀번호 입니다.", "");
			
			try {
				mailService.sendMail(dto, temp_mb_pw);
				model.addAttribute("mail", "mail");
				url = "/member/searchEML";	// jsp파일이름
			} catch (Exception ex) {
				ex.printStackTrace();
			}
			
		} else {
			url = "redirect:/member/lostpass/";
			rttr.addFlashAttribute("msg", "noEML");
		}
		
		return url;
	}
	
	// 회원정보 수정을 위한 비밀번호 재확인 폼.
	@GetMapping("/confirmPW")
	public void confirmPW() {
		
	}
	
	// 회원정보 수정을 위한 비밀번호 재확인.
	@PostMapping("/confirmPW")
	// @RequestParam("A") 사용 시 태그의 name 속성과 값이 같아야 한다. name="A"
	public String confirmPW(@RequestParam("mb_pw") String mb_pw, HttpSession session, RedirectAttributes rttr) {
		
		String url = "";
		
		// loginStatus가 Object로 관리되고 있으므로 MemberVO 리턴타입으로 캐스팅 함.
		String mb_eml = ((MemberVO) session.getAttribute("loginStatus")).getMb_eml();
		
		// 로그인 시 사용한 코드를 재사용하는 목적. > login_ok(dto)
		
		LoginDTO dto = new LoginDTO(mb_eml, mb_pw);
		MemberVO vo = memService.login_ok(dto);	// 아이디만 비교된 상태(비밀번호 비교는 제외된 상태)
		
		if(vo != null) {	// 	아이디만 일치된 경우
			String db_passwd = vo.getMb_pw();	// DB에서 가져온 비밀번호
			
			// matches(평문텍스트 비번, db에서 가져온 암호화 비번)
			if (bCryptPasswordEncoder.matches(mb_pw, db_passwd)) { // 비밀번호 재확인이 되었을 경우
				url = "member/modify";
			} else {	// 비밀번호가 일치되지 않은 경우
				url = "member/confirmPW";
				rttr.addFlashAttribute("msg", "noPW");	
			}
			
		} else {	// 비밀번호가 틀린 경우 원래 재확인 주소로 이동
			url = "member/confirmPW";
			rttr.addFlashAttribute("msg", "noEML");
		}
		
		return "redirect:/" + url;
	}
	
	// HttpSession session 메서드 파라미터로 사용할 경우?
	// 로그인한 상태에서 세션의 로그인정보를 참조하고자 할 경우. ( ex> 로그아웃, 회원정보 수정 등 )
	
	// 회원정보수정 폼
	@GetMapping("/modify")
	// 로그인한 상태에서 저장시켜놨던 아이디 등을 참조하고자 할 경우에는 해당 메소드에서 HttpSession session 파라미터를 반드시 명시애햐 한다.
	public void modify(HttpSession session, Model model) {
		
		// 세션에서 로그인 시 사용한 정보를 사용.
		// loginStatus가 Object로 관리되고 있으므로 MemberVO 리턴타입으로 캐스팅 함.
		String mb_eml = ((MemberVO) session.getAttribute("loginStatus")).getMb_eml();
		
		LoginDTO dto = new LoginDTO(mb_eml, "");	// 비밀번호 파라미터는 쿼리에서 사용이 안되므로, "" 공백처리
		
		// 로그인 쿼리가 회원정보 쿼리와 동일하여 사용함.
		MemberVO vo = memService.login_ok(dto);
		model.addAttribute("memberVO", vo);
		
	}
	
	// 회원정보 수정 저장하기
	@PostMapping("/modify")
	public String modify(MemberVO vo, RedirectAttributes rttr) {

		log.info("회원수정정보: " + vo);
		
		// 클라이언트에서 입력한 정보의 파라미터명이 MemberVO클래스와 일치하지 않으면, 필드가 참조타입일 경우에는 Null이 된다.
		
		// 파라미터가 일치하지 않는 경우
		// 예> 비밀번호.	클라이언트 mb_pw100	->	서버(스프링) MemberVO클래스의 필드 mb_pw. Null이 된다.
		
		// 파라미터가 일치하는 경우 값을 입력하지 않으면
		//				클라이언트 mb_pw	->	서버(스프링) MemberVO클래스의 필드 mb_pw. 공백이 된다.
		
		if(vo.getMb_pw().equals("")) log.info("공백문자열 ");
		
		if (vo.getMb_pw() != null && !vo.getMb_pw().equals("")) {

			log.info("변경비밀번호: " + vo.getMb_pw());
			
			// cryptEncoderPW에 암호화된 비밀번호가 들어온다.
			String cryptEncoderPW = bCryptPasswordEncoder.encode(vo.getMb_pw());
			vo.setMb_pw(cryptEncoderPW);	// 평문텍스트 비밀번호 -> 암호화된 비밀번호로 변경	
		}
		
		// 메일 수신여부
		/*
		if(vo.getMb_eml_rcv().equals("on")) {
			vo.setMb_eml_rcv("Y");
		} else {
			vo.setMb_eml("N");
		}
		*/
		
		memService.modify(vo);
		
		return "redirect:/";
	}
}
