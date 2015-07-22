package com.tjs.admin.wx.dao;

import java.util.List;

import com.tjs.admin.wx.model.WxTick;

/**
 * 数据库操作接口类
 * @author Administrator
 *
 */
public interface WxTickMapper {
	
    /**查询Tick*/
    public List<WxTick> selectWxTick();
    /**插入Tick*/
	public int  insertWxTick(WxTick wxTick);
	/**更新Tick*/
	public int updateWxTick(WxTick wxTick);
	
		
}
