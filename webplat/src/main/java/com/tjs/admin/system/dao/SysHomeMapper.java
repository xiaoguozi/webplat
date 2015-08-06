package com.tjs.admin.system.dao;

import java.util.List;

import com.tjs.admin.system.controller.BannerCtrlModel;
import com.tjs.admin.system.model.SysHome;


/**
 * 数据库操作接口类
 * @author Administrator
 *
 */
public interface SysHomeMapper {
		/**查询banner数量 */
	    public int countBanner(BannerCtrlModel bannerCtrlModel);
	    /**查询banner*/
	    public List<SysHome> selectBanner(BannerCtrlModel bannerCtrlModel);
	    /**新增banner*/
		public int  insertBanner(SysHome sysHome);
		 /**更新banner*/
		public int updateBanner(SysHome sysHome);
		/**查找banner*/
		public SysHome findSysHomeById(Long homeId);
}
