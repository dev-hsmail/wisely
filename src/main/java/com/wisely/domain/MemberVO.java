package com.wisely.domain;

import lombok.Data;

@Data
public class MemberVO {

	// mb_eml, mb_pw, mb_pn, mb_brh, mb_nm, mb_gen, mb_mda, mb_ntfc_rcv, mb_ser_rcv, mb_ad_rcv, mb_addr, mb_addr_dtl, mb_ship_req
	private String mb_eml;
	private String mb_eml_rcv;
	private String mb_pw;
	private String mb_pn;
	private String mb_brh;
	private String mb_nm;
	private String mb_gen;
	private String mb_mda;
	private String mb_ntfc_rcv;
	private String mb_ser_rcv;
	private String mb_ad_rcv;
	private String mb_addr;
	private String mb_addr_dtl;
	
}
