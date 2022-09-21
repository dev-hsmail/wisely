package com.wisely.domain;

import java.util.Date;

import lombok.Data;

@Data
public class AdminVO {

	// adm_id, adm_pw, adm_nm, adm_dt_la
	private String adm_id;
	private String adm_pw;
	private String adm_nm;
	private Date adm_dt_la;
	
}
