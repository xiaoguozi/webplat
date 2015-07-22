package com.tjs.admin.wx.service;

import java.util.List;

import com.tjs.admin.wx.model.WxTick;

public interface IWxTick {
	   /**查询Tick*/
    public List<WxTick> selectWxTick();
    /**插入Tick*/
	public int  insertWxTick(WxTick wxTick);
	/**更新Tick*/
	public int updateWxTick(WxTick wxTick);
}
