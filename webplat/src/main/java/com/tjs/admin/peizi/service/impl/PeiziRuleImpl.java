package com.tjs.admin.peizi.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.tjs.admin.peizi.controller.PeiziRuleCtrlModel;
import com.tjs.admin.peizi.dao.PeiziRuleMapper;
import com.tjs.admin.peizi.model.PeiziRule;
import com.tjs.admin.peizi.service.IPeiziRule;

@Service
public class PeiziRuleImpl implements IPeiziRule {

	
	@Resource
    private PeiziRuleMapper peiziRuleMapper;
	@Override
	public int countPeiziRule(PeiziRuleCtrlModel peiziCtrlModel) {
		// TODO Auto-generated method stub
		return peiziRuleMapper.countPeiziRule(peiziCtrlModel);
	}

	@Override
	public List<PeiziRule> selectPeiziRule(PeiziRuleCtrlModel peiziCtrlModel) {
		// TODO Auto-generated method stub
		return peiziRuleMapper.selectPeiziRule(peiziCtrlModel);
	}

	@Override
	public int insertPeiziRule(PeiziRule peiziRule) {
		// TODO Auto-generated method stub
		return peiziRuleMapper.insertPeiziRule(peiziRule);
	}

	@Override
	public int updatePeiziRule(PeiziRule peiziRule) {
		// TODO Auto-generated method stub
		return peiziRuleMapper.updatePeiziRule(peiziRule);
	}

	@Override
	public void deletePeiziRule(Long ruleId) {
		// TODO Auto-generated method stub
		peiziRuleMapper.deletePeiziRule(ruleId);
		
	}

	@Override
	public void deleteBatchPeiziRule(Long[] ruleIds) {
		// TODO Auto-generated method stub
		peiziRuleMapper.deleteBatchPeiziRule(ruleIds);
	}

	@Override
	public PeiziRule findByPeiziRuleId(Long ruleId) {
		// TODO Auto-generated method stub
		return peiziRuleMapper.findByPeiziRuleId(ruleId);
	}

}
