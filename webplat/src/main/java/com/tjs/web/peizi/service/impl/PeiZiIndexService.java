package com.tjs.web.peizi.service.impl;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Service;

import com.tjs.admin.model.User;
import com.tjs.admin.peizi.constants.PeiziTypeEnum;
import com.tjs.admin.peizi.model.Peizi;
import com.tjs.admin.peizi.service.IPeizi;
import com.tjs.admin.service.UserService;
import com.tjs.web.constants.PeiZiConstants;
import com.tjs.web.peizi.controller.PZIndexCtrlModel;
import com.tjs.web.peizi.dao.PeiZiIndexMapper;
import com.tjs.web.peizi.model.FreePeiziDetailVO;
import com.tjs.web.peizi.model.UserInfoExtendVO;
import com.tjs.web.peizi.service.IPeiZiIndexService;

@Service
public class PeiZiIndexService implements IPeiZiIndexService {

	@Resource
	private PeiZiIndexMapper peiZiIndexMapper;
	
	@Resource
	private UserService userService;
	
	@Resource
	private IPeizi peiziService;
	
	@Override
	public int checkFreePeiZiIsValid(PZIndexCtrlModel pzIndexCtrlModel) {
		
		//前提用户已登录，在路径中已经配置
		Subject subject = SecurityUtils.getSubject();
		String username = (String)subject.getPrincipal();
		User user = userService.selectByUsername(username);
		
		//查询用户
		pzIndexCtrlModel.setUserId(user.getId());
		pzIndexCtrlModel.setPeiziType(PeiZiConstants.TYPE_FREE_ALL);
		List<UserInfoExtendVO> lstUserVO = peiZiIndexMapper.getUserInfoExtendList(pzIndexCtrlModel);
		
	    List<FreePeiziDetailVO> lstPZVO = peiZiIndexMapper.getFreePeiziDetailList(pzIndexCtrlModel.getDateString());
		if(lstPZVO==null || lstPZVO.size()==0){
			//1、新增当日活动计数记录
			FreePeiziDetailVO vo = new FreePeiziDetailVO();
			vo.setPeiziDate(Calendar.getInstance().getTime());
			vo.setPeiziCount(1);
			vo.setPeiziType(PeiZiConstants.TYPE_FREE_ALL);
			peiZiIndexMapper.insertFreePeiziDetailVO(vo);
			
			if(lstUserVO==null || lstUserVO.size()==0){
				//2、新增用户扩展信息表记录
				UserInfoExtendVO userInfoExtendVO = new UserInfoExtendVO();
				userInfoExtendVO.setUserId(user.getId());
				userInfoExtendVO.setIsOwnResource(PeiZiConstants.IS_OWN_RESOURCE);
				userInfoExtendVO.setPeiziType(PeiZiConstants.TYPE_FREE_ALL);
				peiZiIndexMapper.insertUserInfoExtendVO(userInfoExtendVO);
			}else{
				//查询该用户是否参加过该活动
				UserInfoExtendVO userInfoExtendVO = lstUserVO.get(0);
				if(userInfoExtendVO.getIsOwnResource()==PeiZiConstants.IS_OWN_RESOURCE){
					return PeiZiConstants.RESULT_VALID;
				}else{
					return PeiZiConstants.RESULT_ALREADY_USED;
				}
			}
			//参加活动结果合格
			return PeiZiConstants.RESULT_VALID;
		}else{
			FreePeiziDetailVO vo = lstPZVO.get(0);
			if(vo.getPeiziCount()<PeiZiConstants.FREE_ALL_COUNT){
				//查询用户扩展表信息，是否有记录
				if(lstUserVO==null || lstUserVO.size()==0){
					UserInfoExtendVO userInfoExtendVO = new UserInfoExtendVO();
					userInfoExtendVO.setUserId(user.getId());
					userInfoExtendVO.setIsOwnResource(PeiZiConstants.IS_OWN_RESOURCE);
					userInfoExtendVO.setPeiziType(PeiZiConstants.TYPE_FREE_ALL);
					peiZiIndexMapper.insertUserInfoExtendVO(userInfoExtendVO);
					
					//更新计数
					vo.setPeiziCount(vo.getPeiziCount()+1);
					peiZiIndexMapper.updateFreePeiziDetailVO(vo);
					
					return PeiZiConstants.RESULT_VALID;
				}else{
					//查看是否拥有资源
					UserInfoExtendVO userVO = lstUserVO.get(0);
					if(userVO.getIsOwnResource()==PeiZiConstants.IS_OWN_RESOURCE){
						return PeiZiConstants.RESULT_VALID;
					}else{
						return PeiZiConstants.RESULT_ALREADY_USED;
					}
				}
			}else{
				return PeiZiConstants.RESULT_NO_AMOUNT;
			}
		}
	}

	@Override
	public List<FreePeiziDetailVO> getFreePeiziDetailList(
			PZIndexCtrlModel pzIndexCtrlModel) {
		List<FreePeiziDetailVO> lstVO = peiZiIndexMapper.getFreePeiziDetailList(pzIndexCtrlModel.getDateString());
		
		return lstVO;
	}

	@Override
	public List<UserInfoExtendVO> getUserInfoExtendList(
			PZIndexCtrlModel pzIndexCtrlModel) {
		return peiZiIndexMapper.getUserInfoExtendList(pzIndexCtrlModel);
	}

	@Override
	public void createFreePeiziOrder(UserInfoExtendVO userInfoExtendVO) {
		peiZiIndexMapper.updateUserInfoExtendVO(userInfoExtendVO);
		Date date = Calendar.getInstance().getTime();
		//插入配资订单
		Peizi peizi = new Peizi();
		peizi.setDataZcpzj(new BigDecimal(10001));
		peizi.setDataTzbzj(new BigDecimal(1));
		peizi.setDataPzje(new BigDecimal(10000));
		peizi.setDataType(PeiziTypeEnum.MFPEIZI.getKey());
		peizi.setDataTypeSylx("10");
		peizi.setDataZjsyqx(2);
		peizi.setDataSubmitDate(date);
		peizi.setDataJyksDate("2");
		peizi.setDataCreateDate(date);
		peizi.setDataUserId(userInfoExtendVO.getUserId());
		peizi.setDataUserTel(Long.valueOf(userInfoExtendVO.getPhone()));
		peizi.setDataOperaStatus("10");
		peiziService.insertPeizi(peizi);
	}
	
	

}
