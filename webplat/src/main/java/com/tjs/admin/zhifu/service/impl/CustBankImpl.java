package com.tjs.admin.zhifu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.zhifu.controller.CustbankCtrlModel;
import com.tjs.admin.zhifu.dao.CustbankMapper;
import com.tjs.admin.zhifu.model.Custbank;
import com.tjs.admin.zhifu.service.ICustbank;

@Service
public class CustBankImpl implements ICustbank {

	@Resource
	CustbankMapper custbankMapper;
	
	@Override
	public Custbank insertCustbank(Custbank custbank) {
		// TODO Auto-generated method stub
		custbankMapper.insertCustbank(custbank);
       return custbank;
	}

	@Override
	public int deleteCustbank(Custbank custbank) {
		// TODO Auto-generated method stub
		return custbankMapper.deleteCustbank(custbank);
		
	}

	@Override
	public int countCustbank(CustbankCtrlModel custbankCtrlModel) {
		// TODO Auto-generated method stub
		return custbankMapper.countCustbank(custbankCtrlModel);
	}

	@Override
	public List<Custbank> selectCustbank(CustbankCtrlModel custbankCtrlModel) {
		// TODO Auto-generated method stub
		return custbankMapper.selectCustbank(custbankCtrlModel);
	}

	@Override
	public Custbank findBybankId(Long bankId) {
		// TODO Auto-generated method stub
		return custbankMapper.findBybankId(bankId);
	}

}
