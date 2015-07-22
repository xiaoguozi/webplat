package com.tjs.admin.wx.utils;

import java.util.List;

import javax.annotation.Resource;

import com.tjs.admin.wx.model.WxTick;
import com.tjs.admin.wx.service.IWxTick;

/**
 * 操作WxTick工具类
 * @author Administrator
 *
 */
public class WxTickUtils {
	
	@Resource
	private IWxTick wxTickService;
	private static  WxTickUtils wxTickUtils;
    private WxTickUtils(){
    	
    }   
    public static synchronized  WxTickUtils getInstance(){
    	if(wxTickUtils==null){
    		wxTickUtils = new WxTickUtils();
    	}
    	return wxTickUtils;
    }
    
    /**
     * 
     * @return true:超期，false:不超期 
     */
    public boolean isExpire(){
    	boolean result=true;
    	List<WxTick> lstWxTick = wxTickService.selectWxTick();
    	if(lstWxTick==null||lstWxTick.size()==0){
    		WxTick wxTick = new WxTick();
    		wxTick.setTickInterval(6500L);
    		wxTick.setTokenDate(1L);
    		wxTick.setTickDate(1L);
    		wxTick.setTickName("tick");
    		wxTickService.insertWxTick(wxTick);
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
