package com.wisely.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.wisely.dto.EmailDTO;
import com.wisely.service.EmailService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/email/*")
// 비동기 방식으로 ajax요청을 받기위해 RestController 어노테이션 사용
@RestController	
public class EmailController {
	
	@Setter(onMethod_= {@Autowired})
	private EmailService service;
	
	// 사용자가 입력한 메일주소가 EmailDTO dto에 들어온다.
	@GetMapping("/send")
	public ResponseEntity<String> send(EmailDTO dto, HttpSession session) {
		
		// 객체를 선언한 구문
		ResponseEntity<String> entity = null;
		
		// 인증코드 생성
		String authCode = "";
		for (int i = 0; i < 6; i++) {
			// 0.0 ~ 1.0 실수값 Math.random() 에 10을 곱하여 0 ~ 9 범위의 정수값으로 6자리를 생성.
			authCode += String.valueOf((int)(Math.random() * 10));
		}
		
		session.setAttribute("authCode", authCode);	// 세션으로 인증코드 정보를 서버측 메모리에 생성.
		
		log.info("인증코드: " + authCode);
		
		// 메일보내기 기능(인증코드)
		try {
			service.sendMail(dto, authCode);	// 메일 기본정보 ( 받는사람, 보내는 사람 등 ), 인증코드
			entity = new ResponseEntity<String> ("success", HttpStatus.OK);
		} catch (Exception ex) {
			// 네트워크 환경 상 이메일 전송이므로 에러 시 실행구문 작성
			ex.printStackTrace(); // catch 실행 시 문제를 콘솔에 출력역할
			entity = new ResponseEntity<String> (HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
}