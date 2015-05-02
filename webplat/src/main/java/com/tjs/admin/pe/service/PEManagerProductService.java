package com.tjs.admin.pe.service;

import java.util.List;

import com.tjs.admin.pe.model.PEManager;
import com.tjs.admin.pe.model.PEManagerProduct;
import com.tjs.admin.pe.model.PEProduct;

/**
 * 私募经理对应产品服务类
 * 
 *@author zhsoft
 *@since 2015年4月30日
 **/
public interface PEManagerProductService {

	void insert(List<PEManagerProduct> managerProducts);
	
	/**
	 * 依据私募经理及产品清单进行组装数据插入到经理产品中间表
	 * 
	 * @param peManager
	 * @param products
	 * @return 1 成功， 0 失败
	 */
	int insert(PEManager peManager, List<PEProduct> products);
}
