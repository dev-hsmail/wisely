package com.wisely.service;

import java.util.List;

import com.wisely.domain.CategoryVO;
import com.wisely.domain.ProductVO;
import com.wisely.dto.Criteria;

public interface UserProductService {

	List<CategoryVO> getCategoryList();

	List<CategoryVO> getSubCategoryList(Integer categoryCode);
	
	List<ProductVO> getProductListbysubCategory(Integer ctgr_cd, Criteria cri);
	
	// 2차 카테고리별 상품개수
	int getProductCountbysubCategory(Integer ctgr_cd, Criteria cri);
	
	// 상품 상세정보
	ProductVO getProductByNum(Integer prdc_num);
}
