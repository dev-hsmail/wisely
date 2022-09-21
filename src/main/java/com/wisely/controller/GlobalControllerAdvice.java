package com.wisely.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.wisely.service.UserProductService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

/*
 	com.docmall.controller 패키지 안에 컨트롤러에서 주소요청을 받으면,
 	categoryList메서드가 자동으로 호출되어. 공동모델을 사용할 수가 있게 된다.
 */

@Log4j
@ControllerAdvice(basePackages = {"com.wisely.controller"})	// @ControllerAdvice 어노테이션 사용을 기억
public class GlobalControllerAdvice {

	// 카테고리 메뉴 데이터를 DB에서 불러오는 작업 : Model 추가작업
	
	// com.docmall.controller패키지에서 공통적인 Model을 한번 DB연동해서 재사용하고자 할 때 @ControllerAdvice 사용.
	
	@Setter(onMethod_ = {@Autowired})
	private UserProductService userProService;
	
	// 1차 카테고리를 Model작업
	@ModelAttribute
	public void categoryList(Model model) {
		
		log.info("1차 카테고리 모델작업");
		
		model.addAttribute("mainCategoryList", userProService.getCategoryList());
	}
}