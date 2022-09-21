package com.wisely.domain;

import lombok.Data;

@Data
public class OrderDetailVO {

	// 주문상세테이블
	// odr_num, prdc_num, odr_amt, odr_prc
	
	private Long odr_num;
	private Integer prdc_num;
	private int odr_amt;
	private int odr_prc;
}
