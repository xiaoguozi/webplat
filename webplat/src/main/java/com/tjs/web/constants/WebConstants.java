package com.tjs.web.constants;

/**
 * 
 * 
 * @author swpan
 *
 */
public final class WebConstants {

	private WebConstants() {
		
	}
	/** 短信验证码session **/
	public static final String SMS_VERIFY_SESSION_KEY = "smsVerifySessionKey";
	/** 短信验证码count session **/
	public static final String SMS_VERIFY_COUNT_SESSION_KEY = "smsVerifyCountSessionKey";
	public static final int SMS_VERIFY_COUNT_MAX = 50;
	/** 短信验证码count session **/
	public static final String SMS_RESEND_COUNT_SESSION_KEY = "smsResendCountSessionKey";
	public static final int SMS_RESEND_COUNT_MAX = 5;
	/** 用户名session **/
	public static final String USERNAME_VERIFY_SESSION_KEY = "userNameVerifySessionKey";
}
