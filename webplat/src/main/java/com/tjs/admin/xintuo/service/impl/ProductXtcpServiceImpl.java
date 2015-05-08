package com.tjs.admin.xintuo.service.impl;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.xintuo.controller.XinTuoCpCtrlModel;
import com.tjs.admin.xintuo.controller.XinTuoSeachCtrlVO;
import com.tjs.admin.xintuo.dao.ProductXtcpMapper;
import com.tjs.admin.xintuo.dao.ProductXtgsMapper;
import com.tjs.admin.xintuo.model.ProductXtcp;
import com.tjs.admin.xintuo.model.ProductXtgs;
import com.tjs.admin.xintuo.service.IProductXtcpService;
import com.tjs.admin.xintuo.util.BigDecimalUtils;

@Service
public class ProductXtcpServiceImpl  implements IProductXtcpService {

	@Resource
    private ProductXtcpMapper productXtcpMapper;
	
	@Resource
    private ProductXtgsMapper productXtgsMapper;

	@Override
	public int countProductXtcp(XinTuoCpCtrlModel xintuoCpCtrlModel) {
		return productXtcpMapper.countProductXtcp(xintuoCpCtrlModel);
	}

	@Override
	public int insertProductXtcp(ProductXtcp productXtcp) {	
		ProductXtgs productXtgs =productXtgsMapper.findByProductXtgsId(productXtcp.getXtcpGsId());
		productXtcp.setXtcpGszhname(productXtgs.getXgtsSplname());
		return productXtcpMapper.insertProductXtcp(productXtcp);		
	}

	@Override
	public int updateProductXtcp(ProductXtcp productXtcp) {
		ProductXtgs productXtgs =productXtgsMapper.findByProductXtgsId(productXtcp.getXtcpGsId());
		productXtcp.setXtcpGszhname(productXtgs.getXgtsSplname());
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
	public List<ProductXtcp> selectProductXtcp(XinTuoCpCtrlModel xintuoCpCtrlModel) {	
		if(xintuoCpCtrlModel!=null){
			xintuoCpCtrlModel.setLimitStart((xintuoCpCtrlModel.getPageNo()-1)*xintuoCpCtrlModel.getPageSize());
		}
		List<ProductXtcp> lstVOs = productXtcpMapper.selectProductXtcp(xintuoCpCtrlModel);
		if(xintuoCpCtrlModel!=null&&xintuoCpCtrlModel.isFormat()){
			BigDecimal div10000 = new BigDecimal(10000);
			for(ProductXtcp product:lstVOs){
				product.setXtcpZdrgje(BigDecimalUtils.div(product.getXtcpZdrgje(), div10000));
				product.setXtcpFxgm(BigDecimalUtils.div(product.getXtcpFxgm(), div10000));
			}
		}
	
		return lstVOs;
	}

	@Override
	public void deleteBatchProductXtcp(Long[] xtcpIds) {
		 productXtcpMapper.deleteBatchProductXtcp(xtcpIds);
		
	}

	@Override
	public List<ProductXtcp> selectProductXtcpIndex() {
		return productXtcpMapper.selectProductXtcpIndex();
	}

	@Override
	public List<ProductXtcp> selectProductXtcpTrustTopIndex(XinTuoCpCtrlModel xintuoCpCtrlModel) {
		// TODO Auto-generated method stub
		List<ProductXtcp> lstVOs = productXtcpMapper.selectProductXtcpTrustTopIndex(xintuoCpCtrlModel);
		
		if(xintuoCpCtrlModel!=null&&xintuoCpCtrlModel.isFormat()){
			BigDecimal div10000 = new BigDecimal(10000);
			for(ProductXtcp product:lstVOs){
				product.setXtcpZdrgje(BigDecimalUtils.div(product.getXtcpZdrgje(), div10000));
				product.setXtcpFxgm(BigDecimalUtils.div(product.getXtcpFxgm(), div10000));
			}
		}
		
		return lstVOs;
	}

	@Override
	public List<ProductXtcp> selectProductXtcpTrustFootIndex(
			XinTuoCpCtrlModel xintuoCpCtrlModel) {
		// TODO Auto-generated method stub
		List<ProductXtcp> lstVOs = productXtcpMapper.selectProductXtcpTrustFootIndex(xintuoCpCtrlModel);
		
		if(xintuoCpCtrlModel!=null&&xintuoCpCtrlModel.isFormat()){
			BigDecimal div10000 = new BigDecimal(10000);
			for(ProductXtcp product:lstVOs){
				product.setXtcpZdrgje(BigDecimalUtils.div(product.getXtcpZdrgje(), div10000));
				product.setXtcpFxgm(BigDecimalUtils.div(product.getXtcpFxgm(), div10000));
			}
		}
		
		return lstVOs;
	}

	@Override
	public int countProductXtcpTrust(XinTuoSeachCtrlVO xinTuoSeachCtrlVO) {
		// TODO Auto-generated method stub
		return productXtcpMapper.countProductXtcpTrust(xinTuoSeachCtrlVO);
	}

	@Override
	public List<ProductXtcp> selectProductXtcpTrust(
			XinTuoSeachCtrlVO  xinTuoSeachCtrlVO) {		
		if(xinTuoSeachCtrlVO!=null){
			xinTuoSeachCtrlVO.setLimitStart((xinTuoSeachCtrlVO.getPageNo()-1)*xinTuoSeachCtrlVO.getPageSize());
		}
		List<ProductXtcp> lstVOs =productXtcpMapper.selectProductXtcpTrust(xinTuoSeachCtrlVO);	
		BigDecimal div10000 = new BigDecimal(10000);
		for(ProductXtcp product:lstVOs){
			product.setXtcpZdrgje(BigDecimalUtils.div(product.getXtcpZdrgje(), div10000));
			product.setXtcpFxgm(BigDecimalUtils.div(product.getXtcpFxgm(), div10000));
		}		
		return lstVOs;
	}

	@Override
	public List<ProductXtcp> selectProductXtcpByGsId(Long xtgsId) {		
			List<ProductXtcp> lstVOs = productXtcpMapper.selectProductXtcpByGsId(xtgsId);								
				BigDecimal div10000 = new BigDecimal(10000);
				for(ProductXtcp product:lstVOs){
					product.setXtcpZdrgje(BigDecimalUtils.div(product.getXtcpZdrgje(), div10000));
					product.setXtcpFxgm(BigDecimalUtils.div(product.getXtcpFxgm(), div10000));
				}				
		return lstVOs;
	}
		
	

}
