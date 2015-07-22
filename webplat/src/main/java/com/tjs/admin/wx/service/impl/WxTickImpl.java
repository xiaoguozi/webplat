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

	@Override
	public boolean isExpire() {
		boolean result=true;
    	List<WxTick> lstWxTick = this.selectWxTick();
    	if(lstWxTick==null||lstWxTick.size()==0){
    		WxTick wxTick = new WxTick();
    		wxTick.setTickInterval(6500L);
    		wxTick.setTokenDate(1L);
    		wxTick.setTickDate(1L);
    		wxTick.setTickName("tick");
    	    this.insertWxTick(wxTick);
    	}else{
    		WxTick wxTick = lstWxTick.get(0);
    		long currentTime = System.currentTimeMillis()/1000;
    		long lastQuestTime = wxTick.getTickDate();
    		long interval = wxTick.getTickInterval();
    		if(currentTime-lastQuestTime>interval){
    			result=true;
    		}else{
    			result=false;
    		}   		
    	}
    	
    	return result;
	}

}
