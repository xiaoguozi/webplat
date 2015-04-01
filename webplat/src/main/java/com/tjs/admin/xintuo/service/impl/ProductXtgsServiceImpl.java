package com.tjs.admin.xintuo.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.xintuo.dao.ProductXtgsMapper;
import com.tjs.admin.xintuo.model.ProductXtgs;
import com.tjs.admin.xintuo.service.IProductXtgsService;
import com.tjs.core.generic.GenericDao;
import com.tjs.core.generic.GenericServiceImpl;

@Service
public class ProductXtgsServiceImpl extends GenericServiceImpl<ProductXtgs, Long> implements IProductXtgsService {

	@Resource
    private ProductXtgsMapper productXtgsMapper;
		
	@Override
	public GenericDao<ProductXtgs, Long> getDao() {
		 return productXtgsMapper;
	}

	@Override
	public int countProductXtgs(ProductXtgs productXtgs) {
		return productXtgsMapper.countProductXtgs(productXtgs);
	}

	@Override
	public int  insertProductXtgs(ProductXtgs productXtgs) {
		// TODO Auto-generated method stub
		 productXtgsMapper.insertProductXtgs(productXtgs);
		 System.err.println(">>>xt="+productXtgs.getXtgsId());
		 return 1;
	}





	@Override
	public void updateProductXtgs(ProductXtgs productXtgs) {
		// TODO Auto-generated method stub
		productXtgsMapper.updateProductXtgs(productXtgs);
	}





	@Override
	public void deleteProductXtgs(Long xtgsId) {
		// TODO Auto-generated method stub
		productXtgsMapper.deleteProductXtgs(xtgsId);
	}





	@Override
	public ProductXtgs findByProductXtgsId(Long xtgsId) {
		return productXtgsMapper.findByProductXtgsId(xtgsId);
	}
	
	
	@Override
    public int insert(ProductXtgs productXtgs) {
        return productXtgsMapper.insertProductXtgs(productXtgs);
    }

	@Override
	public List<ProductXtgs> selectProductXtgs() {
		 return productXtgsMapper.selectProductXtgs();			 
	}


}
