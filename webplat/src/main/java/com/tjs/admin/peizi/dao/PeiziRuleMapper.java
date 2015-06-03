package com.tjs.admin.peizi.dao;

import java.util.List;

import com.tjs.admin.peizi.controller.PeiziRuleCtrlModel;
import com.tjs.admin.peizi.model.PeiziRule;
import com.tjs.admin.xintuo.model.ProductXtcp;

/**
 * 数据库操作接口类
 * @author Administrator
 *
 */
public interface PeiziRuleMapper {
	
	/**后期数量*/
    public int countPeiziRule(PeiziRuleCtrlModel peiziCtrlModel);
    /**查询规则*/
    public List<PeiziRule> selectPeiziRule(PeiziRuleCtrlModel peiziCtrlModel);
    /**插入规则*/
	public int  insertPeiziRule(PeiziRule peiziRule);
	/**跟新规则*/
	public int updatePeiziRule(PeiziRule peiziRule);
	/**根据主键删除规则*/
	public void deletePeiziRule(Long ruleId);
	/**删除规则*/
	public void deleteBatchPeiziRule(Long[] ruleIds);
	/**根据ID找到规则*/
	public PeiziRule findByPeiziRuleId(Long ruleId);
		
}
