/******************************************************************************
 * Copyright (C) 2007 ShenZhen ComTop Power Automation Co.,Ltd
 * All Rights Reserved.
 * 本软件为深圳康拓普开发研制。未经本公司正式书面同意，其他任何个人、团体不得使用、复制、
 * 修改或发布本软件.
 *****************************************************************************/

package com.tjs.admin.utils;

import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.NoSuchElementException;
import java.util.TimeZone;


/**
 * 扩展有关日期工具类的方法。
 *
 * @author 刘伟
 * @since JDK1.4
 * @history 2007-08-28 刘伟 新建
 */
public final class DateTimeUtils {

    /**
     * 设置 UTC time zone (often referred to as GMT)区域.
     */
    public static final TimeZone UTC_TIME_ZONE = TimeZone.getTimeZone("GMT");

    /**
     * YEAR_RANGE_SCOPE
     */
    public final static int YEAR_RANGE_SCOPE = 4;

    /**
     * 设置毫秒和秒之间的对应关系
     */
    public static final long MILLIS_PER_SECOND = 1000;

    /**
     * 设置毫秒和分之间的关系.
     */
    public static final long MILLIS_PER_MINUTE = 60 * MILLIS_PER_SECOND;

    /**
     * 设置毫秒和分之间的约束关系。
     */
    public static final long MILLIS_PER_HOUR = 60 * MILLIS_PER_MINUTE;

    /**
     * 设置一天为多少小时.
     */
    public static final long MILLIS_PER_DAY = 24 * MILLIS_PER_HOUR;

    /**
     * SEMI_MONTH
     */
    public final static int SEMI_MONTH = 1001;

    /**
     * fields
     */
    private static final int[][] FIELDS =
        { { Calendar.MILLISECOND }, { Calendar.SECOND }, { Calendar.MINUTE }, { Calendar.HOUR_OF_DAY, Calendar.HOUR },
            { Calendar.DATE, Calendar.DAY_OF_MONTH, Calendar.AM_PM }, { Calendar.MONTH, DateTimeUtils.SEMI_MONTH },
            { Calendar.YEAR }, { Calendar.ERA } };

    /**
     * RANGE_WEEK_SUNDAY
     */
    public final static int RANGE_WEEK_SUNDAY = 1;

    /**
     * RANGE_WEEK_MONDAY
     */
    public final static int RANGE_WEEK_MONDAY = 2;

    /**
     * RANGE_WEEK_RELATIVE
     */
    public final static int RANGE_WEEK_RELATIVE = 3;

    /**
     * RANGE_WEEK_CENTER
     */
    public final static int RANGE_WEEK_CENTER = 4;

    /**
     * RANGE_MONTH_SUNDAY
     */
    public final static int RANGE_MONTH_SUNDAY = 5;

    /**
     * RANGE_MONTH_MONDAY
     */
    public final static int RANGE_MONTH_MONDAY = 6;

    /** ISO_DATETIME_FORMAT */
    public final static String ISO_DATETIME_FORMAT = "yyyy-MM-dd HH:mm:ss";

    /** ISO_DATE_FORMAT */
    public final static String ISO_DATE_FORMAT = "yyyy-MM-dd";

    /** ISO_SHORT_DATE_FORMAT */
    public final static String ISO_SHORT_DATE_FORMAT = "yyyy-MM";

    /** ISO_TIME_FORMAT */
    public final static String ISO_TIME_FORMAT = "HH:mm:ss";

    /**
     * 根据配置的默认日期时间格式来获取指定的对象的字符串信息。
     *
     * @param value 需要被转换的日期时间对象引用。
     * @return 返回的是格式化后的字符串。
     */
    public static String formatDateTime(Timestamp value) {
        return formatDateTime(value, ISO_DATETIME_FORMAT);
    }

    /**
     * 根据配置的默认日期时间格式来获取指定的对象的字符串信息。
     *
     * @param value 需要被转换的日期时间对象引用。
     * @param defaultFormat 按照指定的格式来处理当前的日期时间对象。
     * @return 返回的是格式化后的字符串。
     */
    public static String formatDateTime(Timestamp value, String defaultFormat) {
        if (value == null) {
            return "";
        }
        String strFormatStyle = StringUtils.isEmpty(defaultFormat) ? ISO_DATETIME_FORMAT : defaultFormat;
        SimpleDateFormat objSimpleDateFormat = new SimpleDateFormat(strFormatStyle);
        return objSimpleDateFormat.format(value);
    }

    public static String formatDate(Timestamp value) {
        return formatDateTime(value, ISO_DATE_FORMAT);
    }

    public static String formatDate(Timestamp value, String defaultFormat) {
        if (value == null) {
            return "";
        }
        String strFormatStyle = StringUtils.isEmpty(defaultFormat) ? ISO_DATE_FORMAT : defaultFormat;
        SimpleDateFormat objSimpleDateFormat = new SimpleDateFormat(strFormatStyle);
        return objSimpleDateFormat.format(value);
    }

    public static String formatDate(java.sql.Date value) {
        return formatDate(value, ISO_DATE_FORMAT);
    }

    public static String formatDate(java.util.Date value) {
        return formatDate(value, ISO_DATE_FORMAT);
    }

    public static String formatDate(java.util.Date value, String defaultFormat) {
        if (value == null) {
            return "";
        }
        String strFormatStyle = StringUtils.isEmpty(defaultFormat) ? ISO_DATE_FORMAT : defaultFormat;
        SimpleDateFormat objSimpleDateFormat = new SimpleDateFormat(strFormatStyle);
        return objSimpleDateFormat.format(value);
    }

    public static String formatDate(java.sql.Date value, String defaultFormat) {
        if (value == null) {
            return "";
        }
        String strFormatStyle = StringUtils.isEmpty(defaultFormat) ? ISO_DATE_FORMAT : defaultFormat;
        SimpleDateFormat objSimpleDateFormat = new SimpleDateFormat(strFormatStyle);
        return objSimpleDateFormat.format(value);
    }

    public static String formatTime(Time value, String defaultFormat) {
        if (value == null) {
            return "";
        }
        String strFormatStyle = StringUtils.isEmpty(defaultFormat) ? ISO_TIME_FORMAT : defaultFormat;
        SimpleDateFormat objSimpleDateFormat = new SimpleDateFormat(strFormatStyle);
        return objSimpleDateFormat.format(value);
    }

    public static String formatTime(Time value) {
        return formatTime(value, ISO_TIME_FORMAT);
    }

    public static String formatShortDate(Timestamp value) {
        return formatDateTime(value, ISO_SHORT_DATE_FORMAT);
    }

    public static String formatShortDate(Timestamp value, String defaultFormat) {
        if (value == null) {
            return "";
        }
        String strFormatStyle = StringUtils.isEmpty(defaultFormat) ? ISO_SHORT_DATE_FORMAT : defaultFormat;
        SimpleDateFormat objSimpleDateFormat = new SimpleDateFormat(strFormatStyle);
        return objSimpleDateFormat.format(value);
    }

    /**
     * 确定两个日期是否是同一天
     *
     * @param dateSource 需要执行判断的第一个日期时间
     * @param dateDesti 需要执行的第二个日期时间。
     * @return true 如果两个日期都代表了同一天，那么将会返回true。
     */
    public static boolean isSameDay(Date dateSource, Date dateDesti) {
        if (dateSource == null || dateDesti == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar objCalendarSource = Calendar.getInstance();
        objCalendarSource.setTime(dateSource);
        Calendar objCalendarDesti = Calendar.getInstance();
        objCalendarDesti.setTime(dateDesti);
        return isSameDay(objCalendarSource, objCalendarDesti);
    }

    public static boolean isSameDay(Calendar calSource, Calendar calDesti) {
        if (calSource == null || calDesti == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        return calSource.get(Calendar.ERA) == calDesti.get(Calendar.ERA)
            && calSource.get(Calendar.YEAR) == calDesti.get(Calendar.YEAR)
            && calSource.get(Calendar.DAY_OF_YEAR) == calDesti.get(Calendar.DAY_OF_YEAR);
    }

    public static boolean isSameInstant(Date date1, Date date2) {
        if (date1 == null || date2 == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        return date1.getTime() == date2.getTime();
    }

    public static boolean isSameInstant(Calendar cal1, Calendar cal2) {
        if (cal1 == null || cal2 == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        return cal1.getTime().getTime() == cal2.getTime().getTime();
    }

    public static boolean isSameLocalTime(Calendar calSource, Calendar calDesti) {
        return calSource.equals(calDesti);
    }

    public static Date parseDate(String value, String[] parsePatterns) throws ParseException {
        if (value == null || parsePatterns == null) {
            throw new IllegalArgumentException("Date and Patterns must not be null");
        }

        SimpleDateFormat parser = null;
        ParsePosition pos = new ParsePosition(0);
        for (int i = 0; i < parsePatterns.length; i++) {
            if (i == 0) {
                parser = new SimpleDateFormat(parsePatterns[0]);
            } else {
                parser.applyPattern(parsePatterns[i]);
            }
            pos.setIndex(0);
            Date date = parser.parse(value, pos);
            if (date != null && pos.getIndex() == value.length()) {
                return date;
            }
        }
        throw new ParseException("Unable to parse the date: " + value, -1);
    }

    public static java.sql.Date nowAsDate() {
        Calendar objCurrentCalendar = Calendar.getInstance();
        StringBuffer sbDateString = new StringBuffer();
        int iYear = objCurrentCalendar.get(Calendar.YEAR);
        int iMonth = objCurrentCalendar.get(Calendar.MONTH) + 1;
        int iDate = objCurrentCalendar.get(Calendar.DATE);
        sbDateString.append(iYear);
        sbDateString.append("-");
        sbDateString.append(iMonth);
        sbDateString.append("-");
        sbDateString.append(iDate);
        try {
			return java.sql.Date.valueOf(sbDateString.toString());
		} catch (Exception e) {
			return new java.sql.Date(System.currentTimeMillis());
		}
    }

  
    public static Time nowAsTime() {
        Calendar objCurrentCalendar = Calendar.getInstance();
        StringBuffer sbTimeString = new StringBuffer();
        int iHourOfDay = objCurrentCalendar.get(Calendar.HOUR_OF_DAY);
        int iMinute = objCurrentCalendar.get(Calendar.MINUTE);
        int iSecond = objCurrentCalendar.get(Calendar.SECOND);
        sbTimeString.append(iHourOfDay);
        sbTimeString.append(":");
        sbTimeString.append(iMinute);
        sbTimeString.append(":");
        sbTimeString.append(iSecond);
        return java.sql.Time.valueOf(sbTimeString.toString());
    }

    public static Timestamp nowAsTimestamp() {
        Calendar objCurrentCalendar = Calendar.getInstance();
        return new Timestamp(objCurrentCalendar.getTimeInMillis());
    }

    public static Timestamp addYears(Date date, int amount) {
        return add(date, Calendar.YEAR, amount);
    }

    public static Timestamp addMonths(Date date, int amount) {
        return add(date, Calendar.MONTH, amount);
    }

    public static Timestamp addWeeks(Date date, int amount) {
        return add(date, Calendar.WEEK_OF_YEAR, amount);
    }

    public static Timestamp addDays(Date date, int amount) {
        return add(date, Calendar.DAY_OF_MONTH, amount);
    }

    public static Timestamp addHours(Date date, int amount) {
        return add(date, Calendar.HOUR_OF_DAY, amount);
    }

    public static Timestamp addMinutes(Date date, int amount) {
        return add(date, Calendar.MINUTE, amount);
    }

    public static Timestamp addSeconds(Date date, int amount) {
        return add(date, Calendar.SECOND, amount);
    }

    public static Timestamp addMilliseconds(Date date, int amount) {
        return add(date, Calendar.MILLISECOND, amount);
    }

    public static Timestamp add(Date date, int calendarField, int amount) {
        if (date == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.add(calendarField, amount);
        return new Timestamp(c.getTimeInMillis());
    }

    public static Date round(Date date, int field) {
        if (date == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar gval = Calendar.getInstance();
        gval.setTime(date);
        modify(gval, field, true);
        return gval.getTime();
    }

    public static Calendar round(Calendar date, int field) {
        if (date == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar rounded = (Calendar) date.clone();
        modify(rounded, field, true);
        return rounded;
    }

    public static Date round(Object date, int field) {
        if (date == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        if (date instanceof Date) {
            return round((Date) date, field);
        } else if (date instanceof Calendar) {
            return round((Calendar) date, field).getTime();
        } else {
            throw new ClassCastException("Could not round " + date);
        }
    }

    public static Date truncate(Date date, int field) {
        if (date == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar gval = Calendar.getInstance();
        gval.setTime(date);
        modify(gval, field, false);
        return gval.getTime();
    }

    public static Calendar truncate(Calendar date, int field) {
        if (date == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar truncated = (Calendar) date.clone();
        modify(truncated, field, false);
        return truncated;
    }

    public static Date truncate(Object date, int field) {
        if (date == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        if (date instanceof Date) {
            return truncate((Date) date, field);
        } else if (date instanceof Calendar) {
            return truncate((Calendar) date, field).getTime();
        } else {
            throw new ClassCastException("Could not truncate " + date);
        }
    }

    private static void modify(Calendar val, int field, boolean round) {
        if (val.get(Calendar.YEAR) > 280000000) {
            throw new ArithmeticException("Calendar value too large for accurate calculations");
        }

        if (field == Calendar.MILLISECOND) {
            return;
        }
        Date date = val.getTime();
        long time = date.getTime();
        boolean done = false;

        int millisecs = val.get(Calendar.MILLISECOND);
        if (!round || millisecs < 500) {
            time = time - millisecs;
            if (field == Calendar.SECOND) {
                done = true;
            }
        }

        int seconds = val.get(Calendar.SECOND);
        if (!done && (!round || seconds < 30)) {
            time = time - (seconds * 1000L);
            if (field == Calendar.MINUTE) {
                done = true;
            }
        }
        int minutes = val.get(Calendar.MINUTE);
        if (!done && (!round || minutes < 30)) {
            time = time - (minutes * 60000L);
        }

        if (date.getTime() != time) {
            date.setTime(time);
            val.setTime(date);
        }
        boolean roundUp = false;
        for (int i = 0; i < FIELDS.length; i++) {
            for (int j = 0; j < FIELDS[i].length; j++) {
                if (FIELDS[i][j] == field) {
                    if (round && roundUp) {
                        if (field == DateTimeUtils.SEMI_MONTH) {
                            if (val.get(Calendar.DATE) == 1) {
                                val.add(Calendar.DATE, 15);
                            } else {
                                val.add(Calendar.DATE, -15);
                                val.add(Calendar.MONTH, 1);
                            }
                        } else {
                            val.add(FIELDS[i][0], 1);
                        }
                    }
                    return;
                }
            }
            int offset = 0;
            boolean offsetSet = false;

            if (field == DateTimeUtils.SEMI_MONTH && FIELDS[i][0] == Calendar.DATE) {
                offset = val.get(Calendar.DATE) - 1;
                if (offset >= 15) {
                    offset -= 15;
                }
                roundUp = offset > 7;
                offsetSet = true;
            } else if (field == Calendar.AM_PM && FIELDS[i][0] == Calendar.HOUR_OF_DAY) {
                offset = val.get(Calendar.HOUR_OF_DAY);
                if (offset >= 12) {
                    offset -= 12;
                }
                roundUp = offset > 6;
                offsetSet = true;
            }

            if (!offsetSet) {
                int min = val.getActualMinimum(FIELDS[i][0]);
                int max = val.getActualMaximum(FIELDS[i][0]);
                offset = val.get(FIELDS[i][0]) - min;
                roundUp = offset > ((max - min) / 2);
            }
            if (offset != 0) {
                val.set(FIELDS[i][0], val.get(FIELDS[i][0]) - offset);
            }
        }
        throw new IllegalArgumentException("The field " + field + " is not supported");

    }

    public static Iterator iterator(Date focus, int rangeStyle) {
        if (focus == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar gval = Calendar.getInstance();
        gval.setTime(focus);
        return iterator(gval, rangeStyle);
    }

    public static Iterator iterator(Calendar focus, int rangeStyle) {
        if (focus == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        Calendar start = null;
        Calendar end = null;
        int startCutoff = Calendar.SUNDAY;
        int endCutoff = Calendar.SATURDAY;
        switch (rangeStyle) {
            case RANGE_MONTH_SUNDAY:
            case RANGE_MONTH_MONDAY:
                start = truncate(focus, Calendar.MONTH);
                end = (Calendar) start.clone();
                end.add(Calendar.MONTH, 1);
                end.add(Calendar.DATE, -1);
                if (rangeStyle == RANGE_MONTH_MONDAY) {
                    startCutoff = Calendar.MONDAY;
                    endCutoff = Calendar.SUNDAY;
                }
                break;
            case RANGE_WEEK_SUNDAY:
            case RANGE_WEEK_MONDAY:
            case RANGE_WEEK_RELATIVE:
            case RANGE_WEEK_CENTER:
                start = truncate(focus, Calendar.DATE);
                end = truncate(focus, Calendar.DATE);
                switch (rangeStyle) {
                    case RANGE_WEEK_SUNDAY:
                        break;
                    case RANGE_WEEK_MONDAY:
                        startCutoff = Calendar.MONDAY;
                        endCutoff = Calendar.SUNDAY;
                        break;
                    case RANGE_WEEK_RELATIVE:
                        startCutoff = focus.get(Calendar.DAY_OF_WEEK);
                        endCutoff = startCutoff - 1;
                        break;
                    case RANGE_WEEK_CENTER:
                        startCutoff = focus.get(Calendar.DAY_OF_WEEK) - 3;
                        endCutoff = focus.get(Calendar.DAY_OF_WEEK) + 3;
                        break;
                }
                break;
            default:
                throw new IllegalArgumentException("The range style " + rangeStyle + " is not valid.");
        }
        if (startCutoff < Calendar.SUNDAY) {
            startCutoff += 7;
        }
        if (startCutoff > Calendar.SATURDAY) {
            startCutoff -= 7;
        }
        if (endCutoff < Calendar.SUNDAY) {
            endCutoff += 7;
        }
        if (endCutoff > Calendar.SATURDAY) {
            endCutoff -= 7;
        }
        while (start.get(Calendar.DAY_OF_WEEK) != startCutoff) {
            start.add(Calendar.DATE, -1);
        }
        while (end.get(Calendar.DAY_OF_WEEK) != endCutoff) {
            end.add(Calendar.DATE, 1);
        }
        return new DateIterator(start, end);
    }

    public static Iterator iterator(Object focus, int rangeStyle) {
        if (focus == null) {
            throw new IllegalArgumentException("The date must not be null");
        }
        if (focus instanceof Date) {
            return iterator((Date) focus, rangeStyle);
        } else if (focus instanceof Calendar) {
            return iterator((Calendar) focus, rangeStyle);
        } else {
            throw new ClassCastException("Could not iterate based on " + focus);
        }
    }

    /** DateIterator */
    static class DateIterator implements Iterator {

        /** endFinal */
        private final Calendar endFinal;

        /** spot */
        private final Calendar spot;

        DateIterator(Calendar startFinal, Calendar endFinal) {
            super();
            this.endFinal = endFinal;
            spot = startFinal;
            spot.add(Calendar.DATE, -1);
        }

        public boolean hasNext() {
            return spot.before(endFinal);
        }

        public Object next() {
            if (spot.equals(endFinal)) {
                throw new NoSuchElementException();
            }
            spot.add(Calendar.DATE, 1);
            return spot.clone();
        }

        public void remove() {
            throw new UnsupportedOperationException();
        }
    }

    /**
     * 得到指定周的第一天(周日)00:00:00秒，返回对应的Timestamp，可以用作时间区间的计算
     *
     * @param cal Calendar对象，如果为null，则使用本地JVM中的Calendar对象
     * @param week
     * @return
     */
    public static Timestamp getFirstOfWeek(Calendar cal, int week) {
        if (cal == null) {
            cal = Calendar.getInstance();
        }
        cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return new Timestamp(cal.getTimeInMillis());
    }

    /**
     * 得到指定周的最后一天(周日)23:23:59秒，返回对应的Timestamp，可以用作时间区间的计算
     *
     * @param cal Calendar对象，如果为null，则使用本地JVM中的Calendar对象
     * @param week
     * @return
     */
    public static Timestamp getLastOfWeek(Calendar cal, int week) {
        if (cal == null) {
            cal = Calendar.getInstance();
        }
        cal.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
        cal.set(Calendar.HOUR_OF_DAY, 23);
        cal.set(Calendar.MINUTE, 59);
        cal.set(Calendar.SECOND, 59);
        cal.set(Calendar.MILLISECOND, 999);
        return new Timestamp(cal.getTimeInMillis());
    }

    /**
     * 得到当前周在一年中的周数
     *
     * @param cal Calendar对象，如果为null，则使用本地JVM中的Calendar对象
     * @return
     */
    public static int getCurrentWeek() {
        Calendar cal = Calendar.getInstance();
        return cal.get(Calendar.WEEK_OF_YEAR);
    }

    /**
     * 得到当前周在一年中的周数
     *
     * @param cal Calendar对象，如果为null，则使用本地JVM中的Calendar对象
     * @return
     */
    public static int getCurrentWeek(Calendar cal) {
        if (cal == null) {
            cal = Calendar.getInstance();
        }
        return cal.get(Calendar.WEEK_OF_YEAR);
    }

    public static int getCurrentWeek(Timestamp t1) {
        Calendar cal;
        if (t1 == null) {
            cal = Calendar.getInstance();
        } else {
            cal = new GregorianCalendar();
            cal.setTime(t1);
        }
        return cal.get(Calendar.WEEK_OF_YEAR);
    }

    /**
     * 得到指定Timestamp代表的日期第一年中第几周
     *
     * @param cal Calendar对象，如果为null，则使用本地JVM中的Calendar对象
     * @param ts 指定Timestamp
     * @return 周数
     */
    public static int getWeekOfYear(Calendar cal, Timestamp ts) {
        if (cal == null) {
            cal = Calendar.getInstance();
        }
        cal.setTimeInMillis(ts.getTime());
        return cal.get(Calendar.WEEK_OF_YEAR);
    }

    /**
     * 得到当前年份
     *
     * @return 年
     */
    public static int getCurrentYear() {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(new Date());
        return calendar.get(Calendar.YEAR);
    }

    public static int getYear(Date date) {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        return calendar.get(Calendar.YEAR);
    }

    /**
     * 得到当前月份
     *
     * @return 月份
     */
    public static int getCurrentMonth() {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(new Date());
        return calendar.get(Calendar.MONTH) + 1;
    }

    public static int getCurrentMonth(Timestamp t1) {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(t1);
        return calendar.get(Calendar.MONTH) + 1;
    }

    public static int getCurrentMonth(Date date) {
        Calendar calendar = new GregorianCalendar();
        calendar.setTime(date);
        return calendar.get(Calendar.MONTH) + 1;
    }


    /**
     * 获取指定时间的前后多少天的日期以分秒
     */
    public static Timestamp getTimestamp(Timestamp timestamp, int day, int hour, int minute) {
        Calendar calendar = new GregorianCalendar();
        if (timestamp != null) {
            calendar.setTimeInMillis(timestamp.getTime());
        } else {
            calendar = Calendar.getInstance();
        }
        calendar.add(Calendar.DATE, day);
        calendar.set(Calendar.HOUR, hour);
        calendar.set(Calendar.MINUTE, minute);
        return new Timestamp(calendar.getTimeInMillis());
    }

    /**
     * 给出两个日期，计算他们之间相差的年数|月数|天数
     *
     * @param c1 日期1
     * @param c2 日期2
     * @param what 比较模式，如果是Calendar.YEAR则在年份上比较； 如果是Calendar.MONTH则在月数上比较；
     *            如果是Calendar.DATE则在天数上比较（默认情形）
     * @return 相差的年数或月数或天数
     */
    public static int compare(Calendar c1, Calendar c2, int what) {
        int number = 0;
        switch (what) {
            case Calendar.YEAR:
                number = c1.get(Calendar.YEAR) - c2.get(Calendar.YEAR);
                break;
            case Calendar.MONTH:
                int years = compare(c1, c2, Calendar.YEAR);
                number = 12 * years + (c1.get(Calendar.MONTH) - c2.get(Calendar.MONTH));
                break;
            case Calendar.DATE:
                number = (int) ((c1.getTimeInMillis() - c2.getTimeInMillis()) / (1000 * 60 * 60 * 24));
                break;
            default:
                number = (int) ((c1.getTimeInMillis() - c2.getTimeInMillis()) / (1000 * 60 * 60 * 24));
                break;
        }
        return number;
    }

    /*
     * 得到指定日期的所在年份的最后一天
     */
    public static Timestamp getLastOfYear(Timestamp t1) {
        Calendar a = new GregorianCalendar();
        a.setTime(t1);
        a.set(Calendar.MONTH, 11);
        a.set(Calendar.DATE, 1);// 把日期设置为12月第一天
        a.roll(Calendar.DATE, -1);// 日期回滚一天，也就是当年最后一天
        return new Timestamp(a.getTimeInMillis());
    }

    /*
     * 得到指定日期的所在年份的第一天
     */
    public static Timestamp getFirstOfYear(Timestamp t1) {
        Calendar a = new GregorianCalendar();
        a.setTime(t1);
        a.set(Calendar.MONTH, 0);
        a.set(Calendar.DATE, 1);// 把日期设置为12月第一天
        return new Timestamp(a.getTimeInMillis());
    }

    /*
     * 得到指定日期的所在月份的最后一天
     */
    public static Timestamp getLastOfMonth(Timestamp t1) {
        Calendar a = new GregorianCalendar();
        a.setTime(t1);
        a.set(Calendar.DATE, 1);// 把日期设置为当月第一天
        a.roll(Calendar.DATE, -1);// 日期回滚一天，也就是最后一天
        // int MaxDate = a.get(Calendar.DATE);
        // System.out.println("该月最大天数:"+MaxDate);
        return new Timestamp(a.getTimeInMillis());
    }

    /**
     * 得到指定日期的所在月份的第一天
     *
     * @param t1
     * @return
     */
    public static Timestamp getFirstOfMonth(Timestamp t1) {
        Calendar a = new GregorianCalendar();
        a.setTime(t1);
        a.set(Calendar.DATE, 1);// 把日期设置为当月第一天
        // int MaxDate = a.get(Calendar.DATE);
        // System.out.println("该月最大天数:"+MaxDate);
        return new Timestamp(a.getTimeInMillis());
    }

    /**
     * 给出两个日期，计算他们之间相差的年数|月数|天数
     *
     * @param c1 日期1
     * @param c2 日期2
     * @param what 比较模式，如果是Calendar.YEAR则在年份上比较； 如果是Calendar.MONTH则在月数上比较；
     *            如果是Calendar.DATE则在天数上比较（默认情形）
     * @return 相差的年数或月数或天数
     */
    public static int compare(Timestamp t1, Timestamp t2, int what) {

        Calendar c1 = Calendar.getInstance();
        c1.setTime(t1);

        Calendar c2 = Calendar.getInstance();
        c2.setTime(t2);

        int number = 0;
        switch (what) {
            case Calendar.YEAR:
                number = c1.get(Calendar.YEAR) - c2.get(Calendar.YEAR);
                break;
            case Calendar.MONTH:
                int years = compare(c1, c2, Calendar.YEAR);
                number = 12 * years + (c1.get(Calendar.MONTH) - c2.get(Calendar.MONTH));
                break;
            case Calendar.DATE:
                number = (int) ((c1.getTimeInMillis() - c2.getTimeInMillis()) / (1000 * 60 * 60 * 24));
                break;
            default:
                number = (int) ((c1.getTimeInMillis() - c2.getTimeInMillis()) / (1000 * 60 * 60 * 24));
                break;
        }
        return number;
    }

    public static boolean after(Timestamp t1, Timestamp t2) {
        if (t1 == null || t2 == null) {
            return false;
        }

        return t1.after(t2);
    }

    public static boolean equals(Timestamp t1, Timestamp t2) {
        if (t1 == null && t2 == null) {
            return true;
        } else {
            if (t1 == null) {
                return t2.equals(t1);
            } else {
                return t1.equals(t2);
            }
        }
    }

    public static boolean before(Timestamp t1, Timestamp t2) {
        if (t1 == null || t2 == null) {
            return false;
        }

        return t1.before(t2);
    }

    /**
     * 把字符串的日期转成Timestamp
     *
     * @param time 字符串的日期
     * @return int Timestamp型日期
     */
    public static Timestamp stringConvertTimestamp(String time) {
        if (null == time || "".equals(time)) {
            return null;
        }
        if (time.length() == 10) {// yyyy-MM-dd
            time = time + " 00:00:00.000000000";
        } else if (time.length() == 16) {// yyyy-MM-dd hh:mm
            time = time + ":00.000000000";
        } else if (time.length() == 19) {// yyyy-MM-dd hh:mm:dd
            time = time + ".000000000";
        }
        return Timestamp.valueOf(time);
    }

    /**
     * 把字符串的日期转成Timestamp
     *
     * @param date 字符串的日期
     * @return int Timestamp型日期
     */
    public static Date stringConvertDate(String date) {
        if (null == date || "".equals(date)) {
            return null;
        }
        if (date.length() == 10) {// yyyy-MM-dd
            date = date + " 00:00:00";
        } else if (date.length() == 16) {// yyyy-MM-dd hh:mm
            date = date + ":00";
        }
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date objDate;
        try {
            objDate = formatter.parse(date);
        } catch (ParseException e) {
            objDate = null;
        }
        return objDate;
    }

    /**
     * 比较两日期大小
     *
     * @param DATE1
     * @param DATE2
     * @param what 比较模式，如果是Calendar.YEAR则在年份上比较； 如果是Calendar.MONTH则在月数上比较；
     *            如果是Calendar.DATE则在天数上比较（默认情形）
     * @return date1 在date2前=1;date1在date2后=-1;否则=0;
     * @throws ParseException
     */
    public static int compareDate(String date1, String date2, int what) throws ParseException {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date objDate1 = df.parse(date1);
        Date objDate2 = df.parse(date2);
        return compareDate(objDate1, objDate2, what);
    }

    /**
     * 比较两日期大小
     *
     * @param DATE1
     * @param DATE2
     * @param what 比较模式，如果是Calendar.YEAR则在年份上比较； 如果是Calendar.MONTH则在月数上比较；
     *            如果是Calendar.DATE则在天数上比较（默认情形）
     * @return date1 在date2前=1;date1在date2后=-1;否则=0;
     */
    public static int compareDate(Date date1, Date date2, int what) {
        Calendar objCalendar1 = Calendar.getInstance();
        objCalendar1.setTime(date1);
        Calendar objCalendar2 = Calendar.getInstance();
        objCalendar2.setTime(date2);
        int iResult = compare(objCalendar1, objCalendar2, what);
        if (iResult > 0) {
            return 1;
        } else if (iResult < 0) {
            return -1;
        } else {
            return 0;
        }
    }

    /**
     * 和当前日期比较大小
     *
     * @param currentDate
     * @return currentDate 在当前日期前=1;date1在当前日期后=-1;否则=0;
     */
    public static int compareCurrentDate(Date currentDate) {
        return compareDate(currentDate, nowAsDate(), Calendar.DATE);
    }

    /**
     * 和当前日期比较大小
     *
     * @param currentDate
     * @return currentDate 在当前日期前=1;date1在当前日期后=-1;否则=0;
     * @throws ParseException
     */
    public static int compareCurrentDate(String currentDate) throws ParseException {
        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        Date objDate = df.parse(currentDate);
        return compareDate(objDate, nowAsDate(), Calendar.DATE);

    }

    /**
     * 根据日期，输出日期对应的月份
     * @param date
     * @return　month
     */
    public static int getMonth(Date date) {
    	if (null == date) {
    		throw new IllegalArgumentException("The date is null");
    	}

    	Calendar calendar = Calendar.getInstance();
    	calendar.setTime(date);

    	return calendar.get(Calendar.MONTH);
    }

    /**
     * 获得传入月的第一天和最后一天
     *
     * @param year
     * @param month
     * @param type 1为第一天，2为最后1天
     * @return
     * @throws Exception
     */
    public static String getDateByYearAndMonth(int year, int month, int type) {
        String dateTime = "";
        Calendar calendar = Calendar.getInstance();
        calendar.clear();
        calendar.set(Calendar.YEAR, year);
        calendar.set(Calendar.MONTH, month - 1);
        int day = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);// 本月份的天数
        if (1 == type) {// 得到当前第一天
            calendar.set(Calendar.DATE, 1);
            dateTime = (new SimpleDateFormat("yyyy-MM-dd")).format(calendar.getTime());
        } else { // 得到当月最后一天
            calendar.set(Calendar.DATE, day);
            dateTime = (new SimpleDateFormat("yyyy-MM-dd")).format(calendar.getTime());
        }
        return dateTime;
    }
}
