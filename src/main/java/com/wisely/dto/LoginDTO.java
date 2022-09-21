package com.wisely.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

//@RequiredArgsConstructor : final or @NonNull 필드를 대상으로 생성자 메서드가 생성.
//@NoArgsConstructor	// 파라미터를 사용하지 않는 디폴트 생성자메서드 생성

@Data					// @Getter @Setter @RequiredArgsConstructor, @ToString, @EqualsAndHashCode를 동시에 사용하는 의미
@AllArgsConstructor		// 클래스의 모든 필드를 이용한 생성자메서드 생성
public class LoginDTO {

	private String mb_eml;		// 이메일
	private String mb_pw;		// 비밀번호
	
}
