package com.tjs.web.peizi.token;

import java.math.BigInteger;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.tjs.admin.utils.StringUtils;

public class TokenHandler {
	private static Logger logger = Logger.getLogger(TokenHandler.class);

	static Map<String, String> springmvc_token = null;

	// 生成一个唯一值的token
	@SuppressWarnings("unchecked")
	public synchronized static String generateGUID(HttpSession session) {
		String token = "";
		try {		
			token = new BigInteger(165, new Random()).toString(36)
					.toUpperCase();
			session.removeAttribute(TokenConstants.DEFAULT_TOKEN_NAME);
			session.setAttribute(TokenConstants.DEFAULT_TOKEN_NAME, token);
		} catch (IllegalStateException e) {
			logger.error("generateGUID() mothod find bug,by token session...");
		}
		return token;
	}

	
	// 验证表单token值和session中的token值是否一致
	@SuppressWarnings("unchecked")
	public static boolean validToken(HttpServletRequest request) {
		String inputToken = getInputToken(request);

		if (inputToken == null) {
			logger.warn("token is not valid!inputToken is NULL");
			return false;
		}

		HttpSession session = request.getSession();	
		String sessionToken = (String) session.getAttribute(TokenConstants.DEFAULT_TOKEN_NAME);
		
		if (!inputToken.equals(sessionToken)) {
			logger.warn("token is not valid!inputToken='" + inputToken
					+ "',sessionToken = '" + sessionToken + "'");
			return false;
		}
				
		session.removeAttribute(TokenConstants.DEFAULT_TOKEN_NAME);
		return true;
	}
	

	// 获取表单中token值
	@SuppressWarnings("unchecked")
	public static String getInputToken(HttpServletRequest request) {
		String token = request.getParameter(TokenConstants.DEFAULT_TOKEN_NAME);

		if(StringUtils.isBlank(token)) {
			logger.warn("Got a null or empty token name.");
			return null;
		}
		return token;
	}

}
