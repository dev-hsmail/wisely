package com.wisely.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor	// EamilDTO(String, String, String, String, String) 생성자가 생성됨.
public class EmailDTO {

	private String senderName;	// 발신자 이름
	private String senderMail;	// 발신자 메일주소
	private String receiveMail;	// 수신자 메일주소. 회원 메일주소 사용
	private String subject;		// 제목
	private String message;		// 본문
	
	public EmailDTO() {
		this.senderName = "WISELY";
		this.senderMail = "와이즐리 관리자";	// Gmail 전자우편 정보 이용.	현업 > 회사 메일서버 정보를 이용.
		this.subject = "WISELY 메일인증코드입니다.";
		this.message = "메일 인증을 위한 인증코드를 확인하시고, 인증코드 입력란에 입력하세요."; 
	}
}
