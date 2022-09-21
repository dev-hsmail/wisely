package com.wisely.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wisely.domain.AdminVO;
import com.wisely.mapper.AdminMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService {

	@Setter(onMethod_ = {@Autowired})
	private AdminMapper adminMapper;
	
	@Override
	public AdminVO adminOk(AdminVO vo) {
		
		return adminMapper.adminOk(vo);
	}

}
