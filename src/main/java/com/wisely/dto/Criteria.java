package com.wisely.dto;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {

	// 1)페이징 정보
	private int pageNum;	// 현재 페이지 번호. 1 2 3 4 5
	private int amount;		// 게시물 출력 개수
	
	// 2)검색정보
	private String type;	// 검색종류(상품명, 제조사, 상품명+제조사)
	private String keyword;	// 검색어
	
	// 기본생성자(default) 정의
	public Criteria() {
		this(1, 10);		// 첫 번째 페이지1, 보여줄 개수 10
	}

	public Criteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
	
		return type == null? new String[] {} : type.split("");	// {"T", "W"}
	}
	
	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", this.pageNum)
				.queryParam("amount", this.getAmount())
				.queryParam("type", this.getType())
				.queryParam("keyword", this.getKeyword());
		
		return builder.toUriString();
	}
}
