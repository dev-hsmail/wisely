package com.wisely.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {

	// pay_cd, odr_cd, pay_method, pay_dt, pay_tot_prc, pay_rest_prc, pay_nobank_prc, pay_nobank_user, pay_nobank
	
	private Integer pay_cd;			// 시퀀스
	private Long odr_cd;			// 주문번호
	private String pay_method;		// 사용자 선택 및 입력
	private Date pay_dt;			// sql : sysdate
	private int pay_tot_prc;		// 
	private int pay_rest_prc;
	private int pay_nobank_prc;
	private String pay_nobank_user;
	private String pay_nobank;
}
