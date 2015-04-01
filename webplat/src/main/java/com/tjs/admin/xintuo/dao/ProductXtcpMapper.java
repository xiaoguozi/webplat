package com.tjs.admin.xintuo.dao;

import java.util.List;

import com.tjs.admin.xintuo.model.ProductXtcp;

/**
 * 数据库操作接口类
 * @author Administrator
 *
 */
public interface ProductXtcpMapper {
	
    public int countProductXtcp(ProductXtcp productXtcp);
	
	public int  insertProductXtcp(ProductXtcp productXtcp);
	
	public int updateProductXtcp(ProductXtcp productXtcp);
	
	public void deleteProductXtcp(Long xtcpId);
	
	public ProductXtcp findByProductXtcpId(Long xtcpId);
	
	public List<ProductXtcp> selectProductXtcp();
}
