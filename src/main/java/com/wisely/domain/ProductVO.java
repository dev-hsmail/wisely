package com.wisely.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductVO {
	
	// prdc_num, ctgr_cd, ctgr_cd_prt, prdc_nm, prdc_prc,
	// prdc_dsct, prdc_com, prdc_dtl, prdc_img, prdc_img_folder,
	// prdc_amt, prdc_buy, prdc_dt_rgs, prdc_dt_up
	private Integer prdc_num;
	private Integer ctgr_cd;
	private Integer ctgr_cd_prt;
	private String prdc_nm;
	private int prdc_prc;
	private int prdc_dsct;
	private String prdc_com;
	private String prdc_dtl;
	private String prdc_img;
	private String prdc_img_folder;
	private int prdc_amt;
	private String prdc_buy;
	private Date prdc_dt_rgs;
	private Date prdc_dt_up;
	
	private MultipartFile uploadFile;
}
