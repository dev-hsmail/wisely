package com.wisely.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wisely.domain.CategoryVO;
import com.wisely.domain.ProductVO;
import com.wisely.dto.Criteria;
import com.wisely.mapper.ProductMapper;

import lombok.Setter;

@Service
public class AdProductServiceImpl implements AdProductService {

	@Setter(onMethod_ = {@Autowired})
	private ProductMapper proMapper;
	
	@Override
	public List<CategoryVO> getCateList() {
		// TODO Auto-generated method stub
		return proMapper.getCateList();
	}

	@Override
	public List<CategoryVO> getSubCateList(Integer categoryCode) {
		// TODO Auto-generated method stub
		return proMapper.getSubCateList(categoryCode);
	}

	@Override
	public void productInsert(ProductVO vo) {
		// TODO Auto-generated method stub
		proMapper.productInsert(vo);
	}

	@Override
	public List<ProductVO> getProductList(Criteria cri) {
		
		return proMapper.getProductList(cri);
	}

	@Override
	public int getProductTotalCount(Criteria cri) {
		
		return proMapper.getProductTotalCount(cri);
	}

	@Override
	public ProductVO getProductByNum(Integer prdc_num) {
		
		return proMapper.getProductByNum(prdc_num);
	}

	@Override
	public void productModify(ProductVO vo) {
		
		proMapper.productModify(vo);
	}

	@Override
	public void productDelete(Integer prdc_num) {
		
		proMapper.productDelete(prdc_num);
	}

}
