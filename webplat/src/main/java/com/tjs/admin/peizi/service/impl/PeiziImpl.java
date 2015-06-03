package com.tjs.admin.peizi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.peizi.controller.PeiziCtrlModel;
import com.tjs.admin.peizi.dao.PeiziMapper;
import com.tjs.admin.peizi.model.Peizi;
import com.tjs.admin.peizi.service.IPeizi;

@Service
public class PeiziImpl implements IPeizi {

	
	@Resource
    private PeiziMapper peiziMapper;
	@Override
	public int countPeizi(PeiziCtrlModel peiziCtrlModel) {
		// TODO Auto-generated method stub
		return peiziMapper.countPeizi(peiziCtrlModel);
	}

	@Override
	public List<Peizi> selectPeizi(PeiziCtrlModel peiziCtrlModel) {
		// TODO Auto-generated method stub
		return peiziMapper.selectPeizi(peiziCtrlModel);
	}

	@Override
	public int insertPeizi(Peizi peizi) {
		// TODO Auto-generated method stub
		return peiziMapper.insertPeizi(peizi);
	}

	@Override
	public int updatePeizi(Peizi peizi) {
		// TODO Auto-generated method stub
		return peiziMapper.updatePeizi(peizi);
	}

	@Override
	public void deletePeizi(Long peiziId) {
		// TODO Auto-generated method stub
		peiziMapper.deletePeizi(peiziId);
		
	}

	@Override
	public void deleteBatchPeizi(Long[] peiziIds) {
		// TODO Auto-generated method stub
		peiziMapper.deleteBatchPeizi(peiziIds);
	}

	@Override
	public Peizi findByPeiziId(Long peiziId) {
		// TODO Auto-generated method stub
		return peiziMapper.findByPeiziId(peiziId);
	}

}
