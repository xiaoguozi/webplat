package com.tjs.admin.system.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.system.controller.BannerCtrlModel;
import com.tjs.admin.system.dao.SysHomeMapper;
import com.tjs.admin.system.model.SysHome;
import com.tjs.admin.system.service.ISysHome;

@Service
public class SysHomeServiceImpl  implements ISysHome {

	 @Resource
	 private SysHomeMapper sysHomeMapper;
	
	
	@Override
	public int countBanner(BannerCtrlModel bannerCtrlModel) {
		// TODO Auto-generated method stub
		return sysHomeMapper.countBanner(bannerCtrlModel);
	}

	@Override
	public List<SysHome> selectBanner(BannerCtrlModel bannerCtrlModel) {
		// TODO Auto-generated method stub
		return sysHomeMapper.selectBanner(bannerCtrlModel);
	}

	@Override
	public int insertBanner(SysHome sysHome) {
		// TODO Auto-generated method stub
		return sysHomeMapper.insertBanner(sysHome);
	}

	@Override
	public int updateBanner(SysHome sysHome) {
		// TODO Auto-generated method stub
		return sysHomeMapper.updateBanner(sysHome);
	}

	@Override
	public SysHome findSysHomeById(Long homeId) {
		// TODO Auto-generated method stub
		return sysHomeMapper.findSysHomeById(homeId);
	}

	
}
