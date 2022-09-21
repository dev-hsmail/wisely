package com.wisely.mapper;

import java.util.List;

import com.wisely.domain.CategoryVO;
import com.wisely.domain.ProductVO;
import com.wisely.dto.Criteria;

public interface ProductMapper {

	List<CategoryVO> getCateList();	// 1차 카테고리
	
	List<CategoryVO> getSubCateList(Integer categoryCode);	// 2차 카테고리
	
	void productInsert(ProductVO vo);
	
	List<ProductVO> getProductList(Criteria cri);
	
	int getProductTotalCount(Criteria cri);
	
	ProductVO getProductByNum(Integer prdc_num);
	
	void productModify(ProductVO vo);
	
	void productDelete(Integer prdc_num);
}
