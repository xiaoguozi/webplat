package com.tjs.core.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.CharUtils;


/**
 * String操作工具类
 * 
 * @author panshuangwang
 */
public class StringExtUtils extends org.apache.commons.lang3.StringUtils {

	/** LT */
	public static final String LT = "!lt;";
	/** GT */
	public static final String GT = "!gt;";
	/** AND */
	public static final String AND = "!amp;";
	/** QUOT */
	public static final String QUOT = "!quot;";

	/**
	 * 对象属性转换为字段 例如：userName to USER_NAME
	 * 
	 * @param property
	 *            字段名
	 * @return 数据库字段
	 */
	public static String propertyToField(String property) {

		if (null == property) {
			return "";
		}

		char[] chars = property.toCharArray();
		StringBuffer sb = new StringBuffer();
		for (char c : chars) {
			if (CharUtils.isAsciiAlphaUpper(c)) {
				sb.append("_" + StringExtUtils.lowerCase(CharUtils.toString(c)));
			} else {
				sb.append(c);
			}
		}
		return sb.toString().toUpperCase();
	}

	/**
	 * 字段转换成对象属性 例如：USER_NAME to userName
	 * 
	 * @param field
	 *            -数据库字段
	 * @return -属性名
	 */
	public static String fieldToProperty(String field) {
		if (null == field) {
			return "";
		}
		char[] chars = field.toLowerCase().toCharArray();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < chars.length; i++) {
			char c = chars[i];
			if (c == '_') {
				int j = i + 1;
				if (j < chars.length) {
					sb.append(StringExtUtils.upperCase(CharUtils.toString(chars[j])));
					i++;
				}
			} else {
				sb.append(c);
			}
		}
		return sb.toString();
	}

	/**
	 * <p>
	 * Title: replaceHtml
	 * </p>
	 * <p>
	 * Description: 将html中的引号，大于号和小于号进行转义
	 * </p>
	 * 
	 * @param html
	 *            待转义的字符串
	 * @return 转义完成的字符串
	 */
	public static String replaceHtml(String html) {

		html = html.replaceAll("<", LT);
		html = html.replaceAll(">", GT);
		html = html.replaceAll(">", AND);
		html = html.replaceAll("\"", QUOT);
		return html;
	}

	/**
	 * <p>
	 * Title: transform2Html
	 * </p>
	 * <p>
	 * Description:将转义后的html还原
	 * </p>
	 * 
	 * @param str
	 *            待转义的字符串
	 * @return 转义完成的字符串
	 */
	public static String transform2Html(String str) {
		str = str.replaceAll(LT, "<");
		str = str.replaceAll(GT, ">");
		str = str.replaceAll(AND, ">");
		str = str.replaceAll(QUOT, "\"");
		return str;
	}

	/**
	 * 
	 * <p>
	 * Title: toUtf8String
	 * </p>
	 * <p>
	 * Description: 将字符串转为UTF-8编码
	 * </p>
	 * 
	 * @param s
	 *            字符串
	 * @return utf-8字符串
	 */
	public static String toUtf8String(String s) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			if (c >= 0 && c <= 255) {
				sb.append(c);
			} else {
				byte[] b;
				try {
					b = Character.toString(c).getBytes("utf-8");
				} catch (Exception ex) {
					b = new byte[0];
				}
				for (int j = 0; j < b.length; j++) {
					int k = b[j];
					if (k < 0) {
						k += 256;
					}
					sb.append("%" + Integer.toHexString(k).toUpperCase());
				}
			}
		}
		return sb.toString();
	}

	/**
	 * 使用java正则表达式去掉多余的.与0
	 * 
	 * @param s
	 *            原字符串
	 * @return 去0后字符串
	 */
	public static String subZeroAndDot(String s) {
		if (s.indexOf(".") > 0) {
			// 去掉多余的0
			s = s.replaceAll("0+?$", "");
			// 如最后一位是.则去掉
			s = s.replaceAll("[.]$", "");
		}
		return s;
	}

	/**
	 * 替换文本中的标签
	 * 
	 * @param s
	 *            原字符
	 * @return 替换后的字符串
	 */
	public static String replaceTextTags(String s) {
		if (StringExtUtils.isBlank(s)) {
			return "";
		}
		return s.replaceAll("<[^>]+>", "").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replace("&nbsp;", " ");
	}
	
	/**
     * 验证手机号码
     * @param mobiles
     * @return
     */
    public static boolean checkMobileNumber(String mobileNumber){
        boolean flag = false;
        try{
                Pattern regex = Pattern.compile("^((13[0-9]|15[0-9]|18[0-9]|14[57]|17[78])\\d{8})|(0\\d{2}-\\d{8})|(0\\d{3}-\\d{7})$");
                Matcher matcher = regex.matcher(mobileNumber);
                flag = matcher.matches();
            }catch(Exception e){
                flag = false;
            }
        return flag;
    }
    
    
}
