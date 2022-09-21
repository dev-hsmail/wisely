package com.wisely.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wisely.domain.CategoryVO;
import com.wisely.domain.ProductVO;
import com.wisely.dto.Criteria;
import com.wisely.mapper.UserProductMapper;

import lombok.Setter;

@Service
public class UserProductServiceImpl implements UserProductService {

	@Setter(onMethod_ = {@Autowired})
	private UserProductMapper userProMapper;
	
	@Override
	public List<CategoryVO> getCategoryList() {
		
		return userProMapper.getCategoryList();
	}

	@Override
	public List<CategoryVO> getSubCategoryList(Integer categoryCode) {
		
		return userProMapper.getSubCategoryList(categoryCode);
	}
	
	@Override
	public List<ProductVO> getProductListbysubCategory(Integer ctgr_cd, Criteria cri) {
		
		return userProMapper.getProductListbysubCategory(ctgr_cd, cri);
	}

	@Override
	public int getProductCountbysubCategory(Integer ctgr_cd, Criteria cri) {
		
		return userProMapper.getProductCountbysubCategory(ctgr_cd, cri);
	}

	@Override
	public ProductVO getProductByNum(Integer prdc_num) {
		
		return userProMapper.getProductByNum(prdc_num);
	}

}
