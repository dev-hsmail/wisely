package com.wisely.dto;

import lombok.Getter;
import lombok.ToString;

// jsp에서 [이전]	1	2	3	4	5	[다음]	- 뷰 형태를 만들기 위한 정보를 구성하는 목적
/*
 			1	2	3	4	5	[다음]	-- 첫 번째 블럭
 	[이전]	6	7	8	9	10	[다음]	-- 두 번째 블럭
 */

// jsp에서 호출용도로만 사용하므로 setter 어노테이션 세팅할 필요가 없다.

@Getter
@ToString
public class PageDTO {

	// 페이지의 시작과 끝을 담는 변수선언
	private int startPage;	// (1) 2  3  4  5	각 블럭의 시작페이지 번호저장 필드
	private int endPage;	//  1  2  3  4 (5)	각 블럭의 마지막페이지 번호저장 필드
	
	// 이전(prev), 다음(next) 표시여부
	private boolean prev, next;
	
	// 총 데이터 개수
	private int total;
	
	/*
	 	------------Criteria 클래스 필드로 호출------------
		페이징 정보필드 : 선택한 현재 페이지 정보, 페이지마다 출력할 건수
			 검색필드 : 검색종류, 검색어
	 */
	
	// 총 데이터 개수
	private Criteria cri;

	// 매개변수가 있는 생성자 정의
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		// 예) 데이터 수 = 42
		
		int pageSize = 20;	// 화면에 블럭마다 표현해줄 개수 ->	1	2	3	4	5
		int endPageInfo = pageSize -1;	// 5 - 1 = 4
		
		// ceil() < 올림기능
		// pageNum이 1 ~ 5 범위에 해당되면, 수식의 결과가 같아서 endPage변수의 값이 동일하게 된다. 
		// pageNum이 6이면, endPage 변수의 값이 다르게 된다.
		// (int) (ceil( 1 / 5.0 )) * 5, (int) (ceil( 2 / 5.0 )) * 5, (int) (ceil( 3 / 5.0 )) * 5
		this.endPage = (int) (Math.ceil(cri.getPageNum() / (double) pageSize)) * pageSize;
		this.startPage = this.endPage - endPageInfo;	// 10 - 4 = 6
		
		// 실제 데이터 수를 사용한 전체페이지수를 구한다.
		// 나머지가 존재하면 페이지수 + 1 증가하므로 ceil()로 증가시키는 작업
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		
		if(realEnd <= this.endPage) {
			this.endPage = realEnd;
		}
		
		// 이전, 다음 표시여부
		this.prev = this.startPage > 1;	// startPage가 1이 아닐 때, 이전버튼.
		this.next = this.endPage < realEnd;	// endPage가 realEnd 이면 마지막 블럭으로, 다음버튼 없어야함.
	}
	
}
