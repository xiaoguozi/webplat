package com.tjs.admin.placement.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.placement.dao.PrivatePlacementCompanyMapper;
import com.tjs.admin.placement.model.PrivatePlacementCompany;
import com.tjs.admin.placement.service.PrivatePlacementCompanyService;

/**
 *@Author zhsoft
 *@Time 2015年3月26日
 *
 *  私募公司服务实现
 *  
 **/

@Service
public class PrivatePlacementCompanyServiceImpl implements
		PrivatePlacementCompanyService {
	
	@Resource
	private PrivatePlacementCompanyMapper privatePlacementCompanyMapper;
	
	private PrivatePlacementCompany privatePlacementCompany;

	@Override
	public int insertPrivatePlacementCompany(PrivatePlacementCompany privatePlacementCompany) {
		privatePlacementCompanyMapper.insertPrivatePlacementCompany(privatePlacementCompany);
		return 0;
	}

}
