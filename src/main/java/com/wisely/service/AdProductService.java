package com.wisely.service;

import java.util.List;

import com.wisely.domain.CategoryVO;
import com.wisely.domain.ProductVO;
import com.wisely.dto.Criteria;

public interface AdProductService {

	List<CategoryVO> getCateList();
	
	List<CategoryVO> getSubCateList(Integer categoryCode);
	
	void productInsert(ProductVO vo);
	
	List<ProductVO> getProductList(Criteria cri);
	
	int getProductTotalCount(Criteria cri);
	
	// 상품수정 폼 (상품정보)
	ProductVO getProductByNum(Integer prdc_num);
	
	// 상품수정하기
	void productModify(ProductVO vo);
	
	// 상품 삭제하기
	void productDelete(Integer prdc_num);
}
