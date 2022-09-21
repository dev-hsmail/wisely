package com.wisely.domain;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {

	// 주문 테이블
	// odr_num, mb_eml, odr_nm, odr_zcd, odr_addr, odr_addr_dtl, odr_pn, odr_prc, odr_dt
	
	private Long odr_num;			// db: 시퀀스 사용
	private String mb_eml;			// 세션: 로그인 이메일
	private String odr_nm;			// 입력데이터
	private String odr_zcd;			// 입력데이터
	private String odr_addr;		// 입력데이터
	private String odr_addr_dtl;	// 입력데이터
	private String odr_pn;			// 입력데이터
	private int odr_prc;			// 입력데이터
	private Date odr_dt;			// db: 기본값. SYSDATE
}
