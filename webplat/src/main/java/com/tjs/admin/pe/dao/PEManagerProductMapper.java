package com.tjs.admin.pe.dao;

import java.util.List;

import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.model.PEManagerProduct;

/**
 * 私募经理对应产品服务DAO
 * 
 *@author zhsoft
 *@since 2015年4月30日
 **/
public interface PEManagerProductMapper {

	void insert(List<PEManagerProduct> managerProducts);
	
	/**
	 * 通过经理ID,公司ID查询经理所负责的产品。
	 * 
	 * @param peManager
	 * @return 经理产品关系列表
	 */
	List<PEManagerProduct> queryProductsByManager(PEManager peManager);
}
