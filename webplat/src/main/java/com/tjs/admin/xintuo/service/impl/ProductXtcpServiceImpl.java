package com.tjs.admin.xintuo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.xintuo.dao.ProductXtcpMapper;
import com.tjs.admin.xintuo.dao.ProductXtgsMapper;
import com.tjs.admin.xintuo.model.ProductXtcp;
import com.tjs.admin.xintuo.model.ProductXtgs;
import com.tjs.admin.xintuo.service.IProductXtcpService;

@Service
public class ProductXtcpServiceImpl  implements IProductXtcpService {

	@Resource
    private ProductXtcpMapper productXtcpMapper;
	
	@Resource
    private ProductXtgsMapper productXtgsMapper;

	@Override
	public int countProductXtcp(ProductXtcp productXtcp) {
		return productXtcpMapper.countProductXtcp(productXtcp);
	}

	@Override
	public int insertProductXtcp(ProductXtcp productXtcp) {	
		ProductXtgs productXtgs =productXtgsMapper.findByProductXtgsId(productXtcp.getXtcpGsId());
		productXtcp.setXtcpGszhname(productXtgs.getXgtsZhname());
		return productXtcpMapper.insertProductXtcp(productXtcp);		
	}

	@Override
	public int updateProductXtcp(ProductXtcp productXtcp) {
		ProductXtgs productXtgs =productXtgsMapper.findByProductXtgsId(productXtcp.getXtcpGsId());
		productXtcp.setXtcpGszhname(productXtgs.getXgtsZhname());
		return productXtcpMapper.updateProductXtcp(productXtcp);
	}

	@Override
	public void deleteProductXtcp(Long xtcpId) {
		productXtcpMapper.deleteProductXtcp(xtcpId);
	}

	@Override
	public ProductXtcp findByProductXtcpId(Long xtcpId) {
		return productXtcpMapper.findByProductXtcpId(xtcpId);
	}

	@Override
	public List<ProductXtcp> selectProductXtcp() {		
		return productXtcpMapper.selectProductXtcp();
	}

	@Override
	public void deleteBatchProductXtcp(Long[] xtcpIds) {
		 productXtcpMapper.deleteBatchProductXtcp(xtcpIds);
		
	}
		
	

}
