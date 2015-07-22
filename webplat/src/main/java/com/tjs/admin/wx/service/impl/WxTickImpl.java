package com.tjs.admin.wx.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.wx.dao.WxTickMapper;
import com.tjs.admin.wx.model.WxTick;
import com.tjs.admin.wx.service.IWxTick;

@Service
public class WxTickImpl implements IWxTick {

	@Resource
	private WxTickMapper wxTickMapper;
	
	@Override
	public List<WxTick> selectWxTick() {
		// TODO Auto-generated method stub
		return wxTickMapper.selectWxTick();
	}

	@Override
	public int insertWxTick(WxTick wxTick) {
		// TODO Auto-generated method stub
		return wxTickMapper.insertWxTick(wxTick);
	}

	@Override
	public int updateWxTick(WxTick wxTick) {
		// TODO Auto-generated method stub
		return wxTickMapper.updateWxTick(wxTick);
	}

}
