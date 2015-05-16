package com.tjs.admin.xintuo.service.impl;

import java.math.BigDecimal;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.xintuo.controller.XinTuoGsCtrlModel;
import com.tjs.admin.xintuo.dao.ProductXtgsMapper;
import com.tjs.admin.xintuo.model.ProductXtgs;
import com.tjs.admin.xintuo.service.IProductXtgsService;
import com.tjs.admin.xintuo.util.BigDecimalUtils;

@Service
public class ProductXtgsServiceImpl  implements IProductXtgsService {

	@Resource
    private ProductXtgsMapper productXtgsMapper;
		
	@Override
	public int countProductXtgs(XinTuoGsCtrlModel xinTuoGsCtrlModel) {
		return productXtgsMapper.countProductXtgs(xinTuoGsCtrlModel);
	}

	@Override
	public int  insertProductXtgs(ProductXtgs productXtgs) {
		return productXtgsMapper.insertProductXtgs(productXtgs);
		 
	}
	
	@Override
	public void updateProductXtgs(ProductXtgs productXtgs) {
		System.err.println(">>>"+productXtgs.getXgtsZczb());
		productXtgsMapper.updateProductXtgs(productXtgs);
	}





	@Override
	public void deleteProductXtgs(Long xtgsId) {
		productXtgsMapper.deleteProductXtgs(xtgsId);
	}





	@Override
	public ProductXtgs findByProductXtgsId(Long xtgsId) {
		return productXtgsMapper.findByProductXtgsId(xtgsId);
	}
	
	
	
	@Override
	public void deleteBatchProductXtgs(Long[] xtgsIds) {
		productXtgsMapper.deleteBatchProductXtgs(xtgsIds);
		
	}

	@Override
	public List<ProductXtgs> selectProductXtgs(XinTuoGsCtrlModel xintuoGsCtrlModel) {
		if(xintuoGsCtrlModel!=null){
			xintuoGsCtrlModel.setLimitStart((xintuoGsCtrlModel.getPageNo()-1)*xintuoGsCtrlModel.getPageSize());
		}
		List<ProductXtgs> lstVos = productXtgsMapper.selectProductXtgs(xintuoGsCtrlModel);
		if(xintuoGsCtrlModel!=null&&xintuoGsCtrlModel.isFormat()){
			BigDecimal div10000 = new BigDecimal(10000);
			for(ProductXtgs productVO:lstVos){
				productVO.setXgtsZczb(BigDecimalUtils.div(productVO.getXgtsZczb(), div10000));
			}
		}
		return lstVos;
	}

	@Override
	public List<ProductXtgs> selectProductXtgsIndex() {
		// TODO Auto-generated method stub
		List<ProductXtgs> lstVos = productXtgsMapper.selectProductXtgsIndex();		
			BigDecimal div10000 = new BigDecimal(10000);
			for(ProductXtgs productVO:lstVos){
				productVO.setXgtsZczb(BigDecimalUtils.div(productVO.getXgtsZczb(), div10000));
			}
		
		return lstVos;
	}


}
