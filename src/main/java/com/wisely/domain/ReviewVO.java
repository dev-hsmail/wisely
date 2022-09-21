package com.wisely.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {

	// rvw_num, mb_eml, prdc_num, rvw_cnt, rvw_sco, rvw_dt_reg
	
	private Integer rvw_num;
	private String mb_eml;
	private Integer prdc_num;
	private String rvw_cnt;
	private int rvw_sco;
	private Date rvw_dt_reg;
}
