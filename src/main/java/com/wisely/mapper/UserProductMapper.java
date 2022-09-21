package com.wisely.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.wisely.domain.CategoryVO;
import com.wisely.domain.ProductVO;
import com.wisely.dto.Criteria;

public interface UserProductMapper {

	List<CategoryVO> getCategoryList();
	
	// 2차 카테고리
	List<CategoryVO> getSubCategoryList(Integer ctgr_cd);
	
	List<ProductVO> getProductListbysubCategory(@Param("ctgr_cd") Integer ctgr_cd, @Param("cri") Criteria cri);
	
	// 2차 카테고리별 상품개수
	int getProductCountbysubCategory(@Param("ctgr_cd") Integer ctgr_cd, @Param("cri") Criteria cri);
	
	// 상품상세정보
	ProductVO getProductByNum(Integer prdc_num);
}
