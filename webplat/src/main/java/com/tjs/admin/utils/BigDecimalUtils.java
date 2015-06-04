/******************************************************************************
 * Copyright (C) 2012 ShenZhen ComTop Information Technology Co.,Ltd
 * All Rights Reserved.
 * 本软件为深圳康拓普开发研制。未经本公司正式书面同意，其他任何个人、团体
 * 不得使用、复制、修改或发布本软件.
 *****************************************************************************/
package com.tjs.admin.utils;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.List;



/**
 * 金额转换帮助类
 *
 * @author hzg
 * @since JDK1.6
 */
public final class BigDecimalUtils {

    /**
     * 精度
     */
    private static final int DEFDIV_SCALE = 4;
    
    /**
     * 精度
     */
    public static final String WAN_FORMAT = "#,##0.####";
    
    /**
     * 精度
     */
    public static final String STAWAN_FORMAT = "#,##0.##";
    
    /**
     * 精度
     */
    public static final String YUAN_FORMAT = "#,##0.00";
    
    /**
     * 精度
     */
    private static final String DOUBLE_FORMAT = "#,##0.##";
    
    /**
     * 精度
     */
    public static final String DOUBLE_NO_DOT_FORMAT = "###0.##";
    
    /**
     * 精度
     */
    private static final String DOT_FORMAT = "#,##0.00";
    
    /**
     * 精度
     */
    public static final String DOT_WAN_FORMAT = "#,##0.0000";
    
    /**
     * 精度
     */
    public static final BigDecimal ZERO;
    
    static {
        ZERO = new BigDecimal(0d);
    }
    
    private BigDecimalUtils() {
        
    }
    
    /**
     * 提供精确的加法运算(BigDecimal作参数)
     * 
     * @param number0 被加数
     * @param number1 加数
     * @return 两个数的和
     */
    public static BigDecimal add(BigDecimal number0, BigDecimal number1) {
        if (number0 == null) {
            number0 = BigDecimalUtils.ZERO;
        }
        if (number1 == null) {
            number1 = BigDecimalUtils.ZERO;
        }
        return number0.add(number1);
    }
    
    /**
     * 提供精确的多个数相加加法运算(double作参数)
     * 
     * @param number 数值
     * @return 对象
     */
    public static BigDecimal multiAdd(List<?> number) {
        BigDecimal startNumber = BigDecimalUtils.ZERO;
        for (int i = 0; i < number.size(); i++) {
            Object objNumber = number.get(i);
            if (objNumber instanceof BigDecimal) {
                startNumber = startNumber.add((BigDecimal) number.get(i));
            }
        }
        return startNumber;
    }
    
    /**
     * 提供精确的减法运算(BigDecimal作参数)
     * 
     * @param number0 被减数
     * @param number1 减数
     * @return 两个数的和
     */
    public static BigDecimal subtract(BigDecimal number0, BigDecimal number1) {
        if (number0 == null) {
            number0 = BigDecimalUtils.ZERO;
        }
        if (number1 == null) {
            number1 = BigDecimalUtils.ZERO;
        }
        return number0.subtract(number1);
    }
    
    /**
     * 提供精确的除法运算(long作参数)
     * 
     * @param arg0 被除数
     * @param arg1 除数
     * @return 两个数的和
     */
    public static BigDecimal div(long arg0, long arg1) {
        if (arg1 == 0) {
            return BigDecimalUtils.ZERO;
        }
        BigDecimal number0 = BigDecimal.valueOf(arg0);
        BigDecimal number1 = BigDecimal.valueOf(arg1);
        return div(number0, number1);
    }
    
    /**
     * 提供精确的除法运算(long作参数)
     * 
     * @param arg0 被除数
     * @param arg1 除数
     * @param scale 精度
     * @return 两个数的和
     */
    public static BigDecimal div(long arg0, long arg1, int scale) {
        if (arg1 == 0) {
            return BigDecimalUtils.ZERO;
        }
        BigDecimal number0 = BigDecimal.valueOf(arg0);
        BigDecimal number1 = BigDecimal.valueOf(arg1);
        return div(number0, number1, scale);
    }
    
    /**
     * 提供精确的除法运算(BigDecimal作参数)
     * 
     * @param number0 被除数
     * @param number1 除数
     * @return 两个数的和
     */
    public static BigDecimal div(BigDecimal number0, BigDecimal number1) {
        try {
            return number0.divide(number1, DEFDIV_SCALE, BigDecimal.ROUND_HALF_UP);
        } catch (RuntimeException e) {
            return BigDecimalUtils.ZERO;
        }
    }
    
    /**
     * 提供精确的除法运算(BigDecimal作参数)
     * 
     * @param number0 被除数
     * @param number1 除数
     * @param scale 精度
     * @return 两个数的和
     */
    public static BigDecimal div(BigDecimal number0, BigDecimal number1, int scale) {
        try {
            return number0.divide(number1, scale, BigDecimal.ROUND_HALF_UP);
        } catch (RuntimeException e) {
            return BigDecimalUtils.ZERO;
        }
    }
    
    /**
     * 提供精确的乘法运算(String作参数)
     * 
     * @param number0 因数
     * @param number1 因数
     * @return 两个数的和
     */
    public static BigDecimal multiply(String number0, String number1) {
        BigDecimal dnumber0 = new BigDecimal(number0);
        BigDecimal dnumber1 = new BigDecimal(number1);
        if (dnumber0 == null || dnumber1 == null) {
            return BigDecimalUtils.ZERO;
        }
        return dnumber0.multiply(dnumber1);
    }
    
    /**
     * 提供精确的乘法运算(BigDecimal作参数)
     * 
     * @param number0 因数
     * @param number1 因数
     * @return 两个数的和
     */
    public static BigDecimal multiply(BigDecimal number0, BigDecimal number1) {
        if (number0 == null) {
            number0 = BigDecimalUtils.ZERO;
        }
        if (number1 == null) {
            number1 = BigDecimalUtils.ZERO;
        }
        return number0.multiply(number1);
    }
    
    public static boolean isLessThan(BigDecimal source, BigDecimal destination) {
        if (source == null) {
            source = BigDecimalUtils.ZERO;
        }
        if (destination == null) {
            destination = BigDecimalUtils.ZERO;
        }
        return source.compareTo(destination) < 0;
    }
    
    public static boolean isEquals(BigDecimal source, BigDecimal destination) {
        if (source == null) {
            source = BigDecimalUtils.ZERO;
        }
        if (destination == null) {
            destination = BigDecimalUtils.ZERO;
        }
        return source.compareTo(destination) == 0;
    }
    
    public static boolean isGreaterThan(BigDecimal source, BigDecimal destination) {
        if (source == null) {
            source = BigDecimalUtils.ZERO;
        }
        if (destination == null) {
            destination = BigDecimalUtils.ZERO;
        }
        return source.compareTo(destination) > 0;
    }
    
    /**
     * 格式化double类的数字输出(BigDecimal作参数)
     * 
     * @param doubleValue 需要格式化的double数字
     * @return 输出double数字
     */
    public static String format(BigDecimal doubleValue) {
        if (doubleValue == null) {
            doubleValue = BigDecimalUtils.ZERO;
        }
        return format(doubleValue.doubleValue(), DOUBLE_FORMAT);
    }
    
    /**
     * 格式化BigDecimal
     * 
     * @param strValue 值
     * @return BigDecimal
     */
    public static BigDecimal parseBigDecimal(String strValue) {
        try {
            // 转换全角的逗号
            if (strValue.indexOf("，") != -1) {
                strValue = strValue.replaceAll("，", ",");
            }
            return new BigDecimal(strValue.replaceAll(",", ""));
        } catch (Exception e) {
            return BigDecimalUtils.ZERO;
        }
    }
    
    /**
     * 判断是否为数字类型
     * 
     * @param arg0 值
     * @return 对象
     */
    public static boolean isNumber(String arg0) {
        try {
            new BigDecimal(arg0.replaceAll(",", ""));
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    /**
     * 格式化double类的数字输出(double作参数)
     * 
     * @param doubleValue 需要格式化的double数字
     * @param formatStyle 要输出的格式
     * @return 输出double数字
     */
    public static String format(double doubleValue, String formatStyle) {
        if ("".equals(formatStyle)) {
            formatStyle = DOUBLE_FORMAT;
        }
        DecimalFormat objDecimalFormat = new DecimalFormat(formatStyle);
        return objDecimalFormat.format(doubleValue);
    }
    
    /**
     * 格式化double类的数字输出(double作参数)
     * 
     * @param doubleValue 需要格式化的double数字
     * @param formatStyle 要输出的格式
     * @return 输出double数字
     */
    public static String format(BigDecimal doubleValue, String formatStyle) {
        if ("".equals(formatStyle)) {
            formatStyle = DOT_FORMAT;
        }
        DecimalFormat objDecimalFormat = new DecimalFormat(formatStyle);
        return objDecimalFormat.format(doubleValue);
    }
    
    public static String format(BigDecimal doubleValue, boolean numberDot) {
        DecimalFormat objDecimalFormat = new DecimalFormat(numberDot ? DOT_FORMAT : DOUBLE_FORMAT);
        return objDecimalFormat.format(doubleValue);
    }
    
    /**
     * 格式化小数（四舍五入）
     * 
     * @param bgValue 需要格式化的BigDecimal
     * @param scale 需要保留的小数位数
     * @return 输出格式化的BigDecimal
     */
    public static BigDecimal format(BigDecimal bgValue, int scale) {
        if (bgValue == null) {
            return ZERO;
        } else {
            BigDecimal bd =
                (new BigDecimal(Double.toString(bgValue.doubleValue()))).setScale(scale, BigDecimal.ROUND_HALF_UP);
            return bd;
        }
    }
    
    public static BigDecimal valueOf(String strValue) {
        return BigDecimalUtils.parseBigDecimal(strValue);
    }
    
    /**
     * 将BigDecimal类型数值乘以1万
     * 
     * @param bigValue 值
     * @return 对象
     */
    public static BigDecimal converWanToUnit(BigDecimal bigValue) {
        try {
            return bigValue.multiply(BigDecimal.valueOf(10000));
        } catch (Exception e) {
            return BigDecimalUtils.ZERO;
        }
    }
    
    /**
     * 将String类型数值乘以1万
     * 
     * @param strValue 值
     * @return 对象
     */
    public static BigDecimal converWanToUnit(String strValue) {
        try {
            BigDecimal bigValue = BigDecimalUtils.parseBigDecimal(strValue);
            return bigValue.multiply(BigDecimal.valueOf(10000));
        } catch (Exception e) {
            return BigDecimalUtils.ZERO;
        }
    }
    
    /**
     * 将BigDecimal类型数值除以1万,精确到分
     * 
     * @param bigValue 值
     * @return 对象
     */
    public static BigDecimal converUnitToWan(BigDecimal bigValue) {
        try {
            return converUnitToWan(bigValue, 6);
        } catch (Exception e) {
            return BigDecimalUtils.ZERO;
        }
    }
    
    /**
     * 将String类型数值除以1万，精确到分
     * 
     * @param strValue 值
     * @return 对象
     */
    public static BigDecimal converUnitToWan(String strValue) {
        try {
            BigDecimal bigValue = BigDecimalUtils.parseBigDecimal(strValue);
            return converUnitToWan(bigValue, 6);
        } catch (Exception e) {
            return BigDecimalUtils.ZERO;
        }
    }
    
    /**
     * 将BigDecimal类型数值除以1万
     * 
     * @param bigValue 值
     * @param scale 精度
     * @return 对象
     */
    public static BigDecimal converUnitToWan(BigDecimal bigValue, int scale) {
        try {
            return div(bigValue, BigDecimal.valueOf(10000), scale);
        } catch (Exception e) {
            return BigDecimalUtils.ZERO;
        }
    }
    
    /**
     * 将String类型数值除以1万
     * 
     * @param strValue 值
     * @param scale 精度
     * @return 对象
     */
    public static BigDecimal converUnitToWan(String strValue, int scale) {
        try {
            BigDecimal bigValue = BigDecimalUtils.parseBigDecimal(strValue);
            return div(bigValue, BigDecimal.valueOf(10000), scale);
        } catch (Exception e) {
            return BigDecimalUtils.ZERO;
        }
    }
    
    /**
     * 提供为null值的bigdecimal值转为0(BigDecimal作参数)
     * 
     * @param number0 可能为null的BigDecimal值
     * @return 默认值0或原值
     */
    public static BigDecimal getDefault(BigDecimal number0) {
        if (number0 == null) {
            number0 = BigDecimalUtils.ZERO;
        }
        return number0;
    }
    
    
    /**
     * 获取金额，当金额为空或为0则显示为0，不进行格式化
     *
     * @param amount
     * @return
     */
    public static String getAmount(BigDecimal amount) {
        String strDesignFeeSum = "";
        if (amount == null || BigDecimalUtils.isEquals(BigDecimalUtils.ZERO, amount)) {
            strDesignFeeSum = BigDecimalUtils.ZERO.toString();
        } else {
            strDesignFeeSum = BigDecimalUtils.format(amount);
        }
        return strDesignFeeSum;
    }
    
    

    /**
     *判断是否为空
     *
     * @param amount
     * @return
     */
    public static boolean isNull(BigDecimal amount) {
        if (amount == null || BigDecimalUtils.isEquals(BigDecimalUtils.ZERO, amount)) {
        	return true;
        }          
        return false;
    }

    
}
