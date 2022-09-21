package com.wisely.domain;

import lombok.Data;

@Data
public class CartVO {

	// cart_num, prdc_num, mb_eml, cart_amt
	
	private Long cart_num;
	private Integer prdc_num;
	private String mb_eml;
	private int cart_amt;
}
