package com.tjs.web.constants;

public class PeiZiConstants {

	/** 免费配总数量 */
	public static final int FREE_ALL_COUNT = 100;
	
	/** 免息配总数量 */
	public static final int FREE_CHARGE_COUNT = 100;
	
//	/** 免费配 */
//	public static final int TYPE_FREE_ALL = 1;
//	
//	/** 免息配 */
//	public static final int TYPE_FREE_CHARGE = 2;
	
	/** 是否已经使用过了  */
	public static final int IS_USED = 1;
	
	/** 是否已经拥有了名额 */
	public static final int IS_OWN_RESOURCE = 1;
	
	/** 检查结果返回值 -- 已经没有名额   -1  */
	public static final int RESULT_NO_AMOUNT = -1;
	
	/** 检查结果返回值 -- 用户已经参加过该活动   -2  */
	public static final int RESULT_ALREADY_USED = -2;
	
	/** 检查结果返回值 -- 可以参加该活动   1  */
	public static final int RESULT_VALID = 1;
	
	/** 认证服务参数不正确,请联系客服！ */
	public static final String VALIDATE_RESULT_71 = "-71";
	
	/** 认证服务账号过期,请联系客服！  */
	public static final String VALIDATE_RESULT_53 = "-53";
	
	/** 认证服务权限不足,请联系客服！ */
	public static final String VALIDATE_RESULT_72 = "-72";
	
	/** 认证服务需要充值,请联系客服！ */
	public static final String VALIDATE_RESULT_31 = "-31";
	
	/** 认证服务参数格式错误,请联系客服！ */
	public static final String VALIDATE_RESULT_60 = "-60";
	
	/** 认证服务器出问题,请联系客服！ */
	public static final String VALIDATE_RESULT_90 = "-90";
	
	/** 实名认证存在问题，请联系客服人工验证！ */
	public static final String VALIDATE_RESULT_MAN = "-1000";
	
	/** 身份证号码与姓名不一致  */
	public static final String VALIDATE_RESULT_NOT_SAME = "-1001";
	
	/** 该姓名和身份证号码已被其他用户实名认证，请勿重复认证! */
	public static final String VALIDATE_RESULT_EXIST = "-1002";
	
}
