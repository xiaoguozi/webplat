package com.tjs.admin.zhifu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.zhifu.controller.CustomerFundCtrlModel;
import com.tjs.admin.zhifu.dao.CustomerFundMapper;
import com.tjs.admin.zhifu.model.CustomerFund;
import com.tjs.admin.zhifu.service.ICustomerFund;

@Service
public class CustomerFundImpl implements ICustomerFund {
 
	@Resource
	CustomerFundMapper customerFundMapper;
	
	@Override
	public int insertCustomerFund(CustomerFund customerFund) {
		// TODO Auto-generated method stub
		return customerFundMapper.insertCustomerFund(customerFund);
	}

	@Override
	public int deleteCustomerFund(Long customerFundId) {
		// TODO Auto-generated method stub
		return customerFundMapper.deleteCustomerFund(customerFundId);
		
	}

	@Override
	public int countCustomerFund(CustomerFundCtrlModel customerFundCtrlModel) {
		// TODO Auto-generated method stub
		return customerFundMapper.countCustomerFund(customerFundCtrlModel);
	}

	@Override
	public List<CustomerFund> selectCustomerFund(
			CustomerFundCtrlModel customerFundCtrlModel) {
		// TODO Auto-generated method stub
		return customerFundMapper.selectCustomerFund(customerFundCtrlModel);
	}

	@Override
	public CustomerFund findByCustomerFundId(Long customerFundId) {
		// TODO Auto-generated method stub
		return customerFundMapper.findByCustomerFundId(customerFundId);
	}

	@Override
	public int updateCustomerFund(CustomerFund customerFund) {
		// TODO Auto-generated method stub
		return customerFundMapper.updateCustomerFund(customerFund);
	}

}
