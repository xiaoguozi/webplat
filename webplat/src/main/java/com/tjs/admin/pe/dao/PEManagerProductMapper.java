package com.tjs.admin.pe.dao;

import java.util.List;

import com.tjs.admin.pe.model.PEManagerProduct;

/**
 * 私募经理对应产品服务DAO
 * 
 *@author zhsoft
 *@since 2015年4月30日
 **/
public interface PEManagerProductMapper {

	void insert(List<PEManagerProduct> managerProducts);
}
