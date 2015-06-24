package com.tjs.admin.utils;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 字符串工具类
 * @author Administrator
 *
 */
public class StringUtils {

	public StringUtils() {
	}

	public static boolean isEmpty(String str) {
		return str == null || str.length() == 0;
	}

	public static boolean isNotEmpty(String str) {
		return str != null && str.length() > 0;
	}

	public static boolean isBlank(String str) {
		if (str == null || str.length() == 0)
			return true;
		int strLen = str.length();
		for (int i = 0; i < strLen; i++)
			if (!Character.isWhitespace(str.charAt(i)))
				return false;

		return true;
	}

	public static boolean isNotBlank(String str) {
		if (str == null || str.length() == 0)
			return false;
		int strLen = str.length();
		for (int i = 0; i < strLen; i++)
			if (!Character.isWhitespace(str.charAt(i)))
				return true;

		return false;
	}

	/**
	 * @deprecated Method clean is deprecated
	 */

	public static String clean(String str) {
		return str != null ? str.trim() : "";
	}

	public static String trim(String str) {
		return str != null ? str.trim() : null;
	}

	public static String trimToNull(String str) {
		String ts = trim(str);
		return ts != null && ts.length() != 0 ? ts : null;
	}

	public static String trimToEmpty(String str) {
		return str != null ? str.trim() : "";
	}

	public static String strip(String str) {
		return strip(str, null);
	}

	public static String stripToNull(String str) {
		if (str == null) {
			return null;
		} else {
			str = strip(str, null);
			return str.length() != 0 ? str : null;
		}
	}

	public static String stripToEmpty(String str) {
		return str != null ? strip(str, null) : "";
	}

	public static String strip(String str, String stripChars) {
		if (str == null || str.length() == 0) {
			return str;
		} else {
			str = stripStart(str, stripChars);
			return stripEnd(str, stripChars);
		}
	}

	public static String stripStart(String str, String stripChars) {
		if (str == null || str.length() == 0)
			return str;
		int strLen = str.length();
		int start = 0;
		if (stripChars == null) {
			for (; start != strLen && Character.isWhitespace(str.charAt(start)); start++)
				;
		} else {
			if (stripChars.length() == 0)
				return str;
			for (; start != strLen
					&& stripChars.indexOf(str.charAt(start)) != -1; start++)
				;
		}
		return str.substring(start);
	}

	public static String stripEnd(String str, String stripChars) {
		if (str == null || str.length() == 0)
			return str;
		int end = str.length();
		if (stripChars == null) {
			for (; end != 0 && Character.isWhitespace(str.charAt(end - 1)); end--)
				;
		} else {
			if (stripChars.length() == 0)
				return str;
			for (; end != 0 && stripChars.indexOf(str.charAt(end - 1)) != -1; end--)
				;
		}
		return str.substring(0, end);
	}

	public static String[] stripAll(String strs[]) {
		return stripAll(strs, null);
	}

	public static String[] stripAll(String strs[], String stripChars) {
		if (strs == null || strs.length == 0)
			return strs;
		int strsLen = strs.length;
		String newArr[] = new String[strsLen];
		for (int i = 0; i < strsLen; i++)
			newArr[i] = strip(strs[i], stripChars);

		return newArr;
	}

	public static boolean equals(String str1, String str2) {
		return str1 != null ? str1.equals(str2) : str2 == null;
	}

	public static boolean equalsIgnoreCase(String str1, String str2) {
		return str1 != null ? str1.equalsIgnoreCase(str2) : str2 == null;
	}

	public static int indexOf(String str, char searchChar) {
		if (str == null || str.length() == 0)
			return -1;
		else
			return str.indexOf(searchChar);
	}

	public static int indexOf(String str, char searchChar, int startPos) {
		if (str == null || str.length() == 0)
			return -1;
		else
			return str.indexOf(searchChar, startPos);
	}

	public static int indexOf(String str, String searchStr) {
		if (str == null || searchStr == null)
			return -1;
		else
			return str.indexOf(searchStr);
	}

	public static int indexOf(String str, String searchStr, int startPos) {
		if (str == null || searchStr == null)
			return -1;
		if (searchStr.length() == 0 && startPos >= str.length())
			return str.length();
		else
			return str.indexOf(searchStr, startPos);
	}

	public static int lastIndexOf(String str, char searchChar) {
		if (str == null || str.length() == 0)
			return -1;
		else
			return str.lastIndexOf(searchChar);
	}

	public static int lastIndexOf(String str, char searchChar, int startPos) {
		if (str == null || str.length() == 0)
			return -1;
		else
			return str.lastIndexOf(searchChar, startPos);
	}

	public static int lastIndexOf(String str, String searchStr) {
		if (str == null || searchStr == null)
			return -1;
		else
			return str.lastIndexOf(searchStr);
	}

	public static int lastIndexOf(String str, String searchStr, int startPos) {
		if (str == null || searchStr == null)
			return -1;
		else
			return str.lastIndexOf(searchStr, startPos);
	}

	public static boolean contains(String str, char searchChar) {
		if (str == null || str.length() == 0)
			return false;
		return str.indexOf(searchChar) >= 0;
	}

	public static boolean contains(String str, String searchStr) {
		if (str == null || searchStr == null)
			return false;
		return str.indexOf(searchStr) >= 0;
	}

	public static int indexOfAny(String str, char searchChars[]) {
		if (str == null || str.length() == 0 || searchChars == null
				|| searchChars.length == 0)
			return -1;
		for (int i = 0; i < str.length(); i++) {
			char ch = str.charAt(i);
			for (int j = 0; j < searchChars.length; j++)
				if (searchChars[j] == ch)
					return i;

		}

		return -1;
	}

	public static int indexOfAny(String str, String searchChars) {
		if (str == null || str.length() == 0 || searchChars == null
				|| searchChars.length() == 0)
			return -1;
		else
			return indexOfAny(str, searchChars.toCharArray());
	}

	public static int indexOfAnyBut(String str, char searchChars[]) {
		if (str == null || str.length() == 0 || searchChars == null
				|| searchChars.length == 0)
			return -1;
		label0: for (int i = 0; i < str.length(); i++) {
			char ch = str.charAt(i);
			for (int j = 0; j < searchChars.length; j++)
				if (searchChars[j] == ch)
					continue label0;

			return i;
		}

		return -1;
	}

	public static int indexOfAnyBut(String str, String searchChars) {
		if (str == null || str.length() == 0 || searchChars == null
				|| searchChars.length() == 0)
			return -1;
		for (int i = 0; i < str.length(); i++)
			if (searchChars.indexOf(str.charAt(i)) < 0)
				return i;

		return -1;
	}

	public static boolean containsOnly(String str, char valid[]) {
		if (valid == null || str == null)
			return false;
		if (str.length() == 0)
			return true;
		if (valid.length == 0)
			return false;
		return indexOfAnyBut(str, valid) == -1;
	}

	public static boolean containsOnly(String str, String validChars) {
		if (str == null || validChars == null)
			return false;
		else
			return containsOnly(str, validChars.toCharArray());
	}

	public static boolean containsNone(String str, char invalidChars[]) {
		if (str == null || invalidChars == null)
			return true;
		int strSize = str.length();
		int validSize = invalidChars.length;
		for (int i = 0; i < strSize; i++) {
			char ch = str.charAt(i);
			for (int j = 0; j < validSize; j++)
				if (invalidChars[j] == ch)
					return false;

		}

		return true;
	}

	public static boolean containsNone(String str, String invalidChars) {
		if (str == null || invalidChars == null)
			return true;
		else
			return containsNone(str, invalidChars.toCharArray());
	}

	public static int indexOfAny(String str, String searchStrs[]) {
		if (str == null || searchStrs == null)
			return -1;
		int sz = searchStrs.length;
		int ret = 2147483647;
		int tmp = 0;
		for (int i = 0; i < sz; i++) {
			String search = searchStrs[i];
			if (search != null) {
				tmp = str.indexOf(search);
				if (tmp != -1 && tmp < ret)
					ret = tmp;
			}
		}

		return ret != 2147483647 ? ret : -1;
	}

	public static int lastIndexOfAny(String str, String searchStrs[]) {
		if (str == null || searchStrs == null)
			return -1;
		int sz = searchStrs.length;
		int ret = -1;
		int tmp = 0;
		for (int i = 0; i < sz; i++) {
			String search = searchStrs[i];
			if (search != null) {
				tmp = str.lastIndexOf(search);
				if (tmp > ret)
					ret = tmp;
			}
		}

		return ret;
	}

	public static String substring(String str, int start) {
		if (str == null)
			return null;
		if (start < 0)
			start = str.length() + start;
		if (start < 0)
			start = 0;
		if (start > str.length())
			return "";
		else
			return str.substring(start);
	}

	public static String substring(String str, int start, int end) {
		if (str == null)
			return null;
		if (end < 0)
			end = str.length() + end;
		if (start < 0)
			start = str.length() + start;
		if (end > str.length())
			end = str.length();
		if (start > end)
			return "";
		if (start < 0)
			start = 0;
		if (end < 0)
			end = 0;
		return str.substring(start, end);
	}

	public static String left(String str, int len) {
		if (str == null)
			return null;
		if (len < 0)
			return "";
		if (str.length() <= len)
			return str;
		else
			return str.substring(0, len);
	}

	public static String right(String str, int len) {
		if (str == null)
			return null;
		if (len < 0)
			return "";
		if (str.length() <= len)
			return str;
		else
			return str.substring(str.length() - len);
	}

	public static String mid(String str, int pos, int len) {
		if (str == null)
			return null;
		if (len < 0 || pos > str.length())
			return "";
		if (pos < 0)
			pos = 0;
		if (str.length() <= pos + len)
			return str.substring(pos);
		else
			return str.substring(pos, pos + len);
	}

	public static String substringBefore(String str, String separator) {
		if (str == null || separator == null || str.length() == 0)
			return str;
		if (separator.length() == 0)
			return "";
		int pos = str.indexOf(separator);
		if (pos == -1)
			return str;
		else
			return str.substring(0, pos);
	}

	public static String substringAfter(String str, String separator) {
		if (str == null || str.length() == 0)
			return str;
		if (separator == null)
			return "";
		int pos = str.indexOf(separator);
		if (pos == -1)
			return "";
		else
			return str.substring(pos + separator.length());
	}

	public static String substringBeforeLast(String str, String separator) {
		if (str == null || separator == null || str.length() == 0
				|| separator.length() == 0)
			return str;
		int pos = str.lastIndexOf(separator);
		if (pos == -1)
			return str;
		else
			return str.substring(0, pos);
	}

	public static String substringAfterLast(String str, String separator) {
		if (str == null || str.length() == 0)
			return str;
		if (separator == null || separator.length() == 0)
			return "";
		int pos = str.lastIndexOf(separator);
		if (pos == -1 || pos == str.length() - separator.length())
			return "";
		else
			return str.substring(pos + separator.length());
	}

	public static String substringBetween(String str, String tag) {
		return substringBetween(str, tag, tag);
	}

	public static String substringBetween(String str, String open, String close) {
		if (str == null || open == null || close == null)
			return null;
		int start = str.indexOf(open);
		if (start != -1) {
			int end = str.indexOf(close, start + open.length());
			if (end != -1)
				return str.substring(start + open.length(), end);
		}
		return null;
	}

	public static String[] getSubStringBetween(String str, String open,
			String close) {
		if (str == null || open == null || close == null)
			return new String[0];
		int length = str.length();
		if (length == 0)
			return new String[0];
		List lstTemp = new ArrayList();
		int beg = 0;
		for (int end = 0; end < length;) {
			beg = str.indexOf(open);
			if (beg != -1) {
				end = str.indexOf(close, beg + open.length());
				if (end != -1) {
					lstTemp.add(str.substring(beg + open.length(), end));
					str = str.substring(end + 1, length);
					length = str.length();
					end = 0;
				} else {
					end = length;
				}
			} else {
				end = length;
			}
		}

		return (String[]) lstTemp.toArray(new String[lstTemp.size()]);
	}

	/**
	 * @deprecated Method getNestedString is deprecated
	 */

	public static String getNestedString(String str, String tag) {
		return substringBetween(str, tag, tag);
	}

	/**
	 * @deprecated Method getNestedString is deprecated
	 */

	public static String getNestedString(String str, String open, String close) {
		return substringBetween(str, open, close);
	}

	public static String[] split(String str) {
		return split(str, null, -1);
	}

	public static List split(String str, char separatorChar) {
		if (str == null)
			return null;
		int len = str.length();
		if (len == 0)
			return new ArrayList();
		ArrayList list = new ArrayList();
		int i = 0;
		int start = 0;
		boolean match = false;
		while (i < len)
			if (str.charAt(i) == separatorChar) {
				if (match) {
					list.add(str.substring(start, i));
					match = false;
				}
				start = ++i;
			} else {
				match = true;
				i++;
			}
		if (match)
			list.add(str.substring(start, i));
		return list;
	}

	public static String[] splitByChar(String str, char separatorChar) {
		return splitWorker(str, separatorChar, false);
	}

	public static String[] split(String str, String separatorChars) {
		return splitWorker(str, separatorChars, -1, false);
	}

	public static String[] split(String str, String separatorChars, int max) {
		return splitWorker(str, separatorChars, max, false);
	}

	public static String[] splitByWholeSeparator(String str, String separator) {
		return splitByWholeSeparator(str, separator, -1);
	}

	public static String[] splitByWholeSeparator(String str, String separator,
			int max) {
		if (str == null)
			return new String[0];
		int len = str.length();
		if (len == 0)
			return EMPTY_STRING_ARRAY;
		if (separator == null || "".equals(separator))
			return split(str, null, max);
		int separatorLength = separator.length();
		ArrayList substrings = new ArrayList();
		int numberOfSubstrings = 0;
		int beg = 0;
		for (int end = 0; end < len;) {
			end = str.indexOf(separator, beg);
			if (end > -1) {
				if (end > beg) {
					if (++numberOfSubstrings == max) {
						end = len;
						substrings.add(str.substring(beg));
					} else {
						substrings.add(str.substring(beg, end));
						beg = end + separatorLength;
					}
				} else {
					beg = end + separatorLength;
				}
			} else {
				substrings.add(str.substring(beg));
				end = len;
			}
		}

		return (String[]) substrings.toArray(new String[substrings.size()]);
	}

	public static String[] splitPreserveAllTokens(String str) {
		return splitWorker(str, null, -1, true);
	}

	public static String[] splitPreserveAllTokens(String str, char separatorChar) {
		return splitWorker(str, separatorChar, true);
	}

	private static String[] splitWorker(String str, char separatorChar,
			boolean preserveAllTokens) {
		if (str == null)
			return new String[0];
		int len = str.length();
		if (len == 0)
			return EMPTY_STRING_ARRAY;
		List list = new ArrayList();
		int i = 0;
		int start = 0;
		boolean match = false;
		boolean lastMatch = false;
		while (i < len)
			if (str.charAt(i) == separatorChar) {
				if (match || preserveAllTokens) {
					list.add(str.substring(start, i));
					match = false;
					lastMatch = true;
				}
				start = ++i;
			} else {
				lastMatch = false;
				match = true;
				i++;
			}
		if (match || preserveAllTokens && lastMatch)
			list.add(str.substring(start, i));
		return (String[]) list.toArray(new String[list.size()]);
	}

	public static String[] splitPreserveAllTokens(String str,
			String separatorChars) {
		return splitWorker(str, separatorChars, -1, true);
	}

	public static String[] splitPreserveAllTokens(String str,
			String separatorChars, int max) {
		return splitWorker(str, separatorChars, max, true);
	}

	private static String[] splitWorker(String str, String separatorChars,
			int max, boolean preserveAllTokens) {
		if (str == null)
			return new String[0];
		int len = str.length();
		if (len == 0)
			return EMPTY_STRING_ARRAY;
		List list = new ArrayList();
		int sizePlus1 = 1;
		int i = 0;
		int start = 0;
		boolean match = false;
		boolean lastMatch = false;
		if (separatorChars == null)
			while (i < len)
				if (Character.isWhitespace(str.charAt(i))) {
					if (match || preserveAllTokens) {
						lastMatch = true;
						if (sizePlus1++ == max) {
							i = len;
							lastMatch = false;
						}
						list.add(str.substring(start, i));
						match = false;
					}
					start = ++i;
				} else {
					lastMatch = false;
					match = true;
					i++;
				}
		else if (separatorChars.length() == 1) {
			char sep = separatorChars.charAt(0);
			while (i < len)
				if (str.charAt(i) == sep) {
					if (match || preserveAllTokens) {
						lastMatch = true;
						if (sizePlus1++ == max) {
							i = len;
							lastMatch = false;
						}
						list.add(str.substring(start, i));
						match = false;
					}
					start = ++i;
				} else {
					lastMatch = false;
					match = true;
					i++;
				}
		} else {
			while (i < len)
				if (separatorChars.indexOf(str.charAt(i)) >= 0) {
					if (match || preserveAllTokens) {
						lastMatch = true;
						if (sizePlus1++ == max) {
							i = len;
							lastMatch = false;
						}
						list.add(str.substring(start, i));
						match = false;
					}
					start = ++i;
				} else {
					lastMatch = false;
					match = true;
					i++;
				}
		}
		if (match || preserveAllTokens && lastMatch)
			list.add(str.substring(start, i));
		return (String[]) list.toArray(new String[list.size()]);
	}

	/**
	 * @deprecated Method concatenate is deprecated
	 */

	public static String concatenate(Object array[]) {
		return join(array, ((String) (null)));
	}

	public static String join(Object array[]) {
		return join(array, ((String) (null)));
	}

	public static String join(Object array[], char separator) {
		if (array == null)
			return null;
		int arraySize = array.length;
		int bufSize = arraySize != 0 ? ((array[0] != null ? array[0].toString()
				.length() : 16) + 1) * arraySize : 0;
		StringBuffer buf = new StringBuffer(bufSize);
		for (int i = 0; i < arraySize; i++) {
			if (i > 0)
				buf.append(separator);
			if (array[i] != null)
				buf.append(array[i]);
		}

		return buf.toString();
	}

	public static String join(Object array[], String separator) {
		if (array == null)
			return null;
		if (separator == null)
			separator = "";
		int arraySize = array.length;
		int bufSize = arraySize != 0 ? arraySize
				* ((array[0] != null ? array[0].toString().length() : 16) + (separator == null ? 0
						: separator.length()))
				: 0;
		StringBuffer buf = new StringBuffer(bufSize);
		for (int i = 0; i < arraySize; i++) {
			if (separator != null && i > 0)
				buf.append(separator);
			if (array[i] != null)
				buf.append(array[i]);
		}

		return buf.toString();
	}

	public static String join(Iterator iterator, char separator) {
		if (iterator == null)
			return null;
		StringBuffer buf = new StringBuffer(256);
		while (iterator.hasNext()) {
			Object obj = iterator.next();
			if (obj != null)
				buf.append(obj);
			if (iterator.hasNext())
				buf.append(separator);
		}
		return buf.toString();
	}

	public static String join(Iterator iterator, String separator) {
		if (iterator == null)
			return null;
		StringBuffer buf = new StringBuffer(256);
		while (iterator.hasNext()) {
			Object obj = iterator.next();
			if (obj != null)
				buf.append(obj);
			if (separator != null && iterator.hasNext())
				buf.append(separator);
		}
		return buf.toString();
	}

	public static String deleteWhitespace(String str) {
		if (str == null)
			return null;
		int sz = str.length();
		StringBuffer buffer = new StringBuffer(sz);
		for (int i = 0; i < sz; i++)
			if (!Character.isWhitespace(str.charAt(i)))
				buffer.append(str.charAt(i));

		return buffer.toString();
	}

	public static String replaceOnce(String text, String repl, String with) {
		return replace(text, repl, with, 1);
	}

	public static String replace(String text, String repl, String with) {
		return replace(text, repl, with, -1);
	}

	public static String replace(String text, String repl, String with, int max) {
		if (text == null || repl == null || with == null || repl.length() == 0
				|| max == 0)
			return text;
		StringBuffer buf = new StringBuffer(text.length());
		int start = 0;
		for (int end = 0; (end = text.indexOf(repl, start)) != -1;) {
			buf.append(text.substring(start, end)).append(with);
			start = end + repl.length();
			if (--max == 0)
				break;
		}

		buf.append(text.substring(start));
		return buf.toString();
	}

	public static String replaceChars(String str, char searchChar,
			char replaceChar) {
		if (str == null)
			return null;
		else
			return str.replace(searchChar, replaceChar);
	}

	public static String replaceChars(String str, String searchChars,
			String replaceChars) {
		if (str == null || str.length() == 0 || searchChars == null
				|| searchChars.length() == 0)
			return str;
		char chars[] = str.toCharArray();
		int len = chars.length;
		boolean modified = false;
		int i = 0;
		for (int isize = searchChars.length(); i < isize; i++) {
			char searchChar = searchChars.charAt(i);
			if (replaceChars == null || i >= replaceChars.length()) {
				int pos = 0;
				for (int j = 0; j < len; j++)
					if (chars[j] != searchChar)
						chars[pos++] = chars[j];
					else
						modified = true;

				len = pos;
			} else {
				for (int j = 0; j < len; j++)
					if (chars[j] == searchChar) {
						chars[j] = replaceChars.charAt(i);
						modified = true;
					}

			}
		}

		if (!modified)
			return str;
		else
			return new String(chars, 0, len);
	}

	/**
	 * @deprecated Method overlayString is deprecated
	 */

	public static String overlayString(String text, String overlay, int start,
			int end) {
		return (new StringBuffer(
				((start + overlay.length() + text.length()) - end) + 1))
				.append(text.substring(0, start)).append(overlay)
				.append(text.substring(end)).toString();
	}

	public static String overlay(String str, String overlay, int start, int end) {
		if (str == null)
			return null;
		if (overlay == null)
			overlay = "";
		int len = str.length();
		if (start < 0)
			start = 0;
		if (start > len)
			start = len;
		if (end < 0)
			end = 0;
		if (end > len)
			end = len;
		if (start > end) {
			int temp = start;
			start = end;
			end = temp;
		}
		return (new StringBuffer(((len + start) - end) + overlay.length() + 1))
				.append(str.substring(0, start)).append(overlay)
				.append(str.substring(end)).toString();
	}

	public static String chomp(String str) {
		if (str == null || str.length() == 0)
			return str;
		if (str.length() == 1) {
			char ch = str.charAt(0);
			if (ch == '\r' || ch == '\n')
				return "";
			else
				return str;
		}
		int lastIdx = str.length() - 1;
		char last = str.charAt(lastIdx);
		if (last == '\n') {
			if (str.charAt(lastIdx - 1) == '\r')
				lastIdx--;
		} else if (last != '\r')
			lastIdx++;
		return str.substring(0, lastIdx);
	}

	public static String chomp(String str, String separator) {
		if (str == null || str.length() == 0 || separator == null)
			return str;
		if (str.endsWith(separator))
			return str.substring(0, str.length() - separator.length());
		else
			return str;
	}

	/**
	 * @deprecated Method chompLast is deprecated
	 */

	public static String chompLast(String str, String sep) {
		if (str.length() == 0)
			return str;
		String sub = str.substring(str.length() - sep.length());
		if (sep.equals(sub))
			return str.substring(0, str.length() - sep.length());
		else
			return str;
	}

	/**
	 * @deprecated Method getChomp is deprecated
	 */

	public static String getChomp(String str, String sep) {
		int idx = str.lastIndexOf(sep);
		if (idx == str.length() - sep.length())
			return sep;
		if (idx != -1)
			return str.substring(idx);
		else
			return "";
	}

	/**
	 * @deprecated Method prechomp is deprecated
	 */

	public static String prechomp(String str, String sep) {
		int idx = str.indexOf(sep);
		if (idx != -1)
			return str.substring(idx + sep.length());
		else
			return str;
	}

	/**
	 * @deprecated Method getPrechomp is deprecated
	 */

	public static String getPrechomp(String str, String sep) {
		int idx = str.indexOf(sep);
		if (idx != -1)
			return str.substring(0, idx + sep.length());
		else
			return "";
	}

	public static String chop(String str) {
		if (str == null)
			return null;
		int strLen = str.length();
		if (strLen < 2)
			return "";
		int lastIdx = strLen - 1;
		String ret = str.substring(0, lastIdx);
		char last = str.charAt(lastIdx);
		if (last == '\n' && ret.charAt(lastIdx - 1) == '\r')
			return ret.substring(0, lastIdx - 1);
		else
			return ret;
	}

	/**
	 * @deprecated Method chopNewline is deprecated
	 */

	public static String chopNewline(String str) {
		int lastIdx = str.length() - 1;
		if (lastIdx <= 0)
			return "";
		char last = str.charAt(lastIdx);
		if (last == '\n') {
			if (str.charAt(lastIdx - 1) == '\r')
				lastIdx--;
		} else {
			lastIdx++;
		}
		return str.substring(0, lastIdx);
	}

	public static String repeat(String str, int repeat) {
		if (str == null)
			return null;
		if (repeat <= 0)
			return "";
		int inputLength = str.length();
		if (repeat == 1 || inputLength == 0)
			return str;
		if (inputLength == 1 && repeat <= 8192)
			return padding(repeat, str.charAt(0));
		int outputLength = inputLength * repeat;
		switch (inputLength) {
		case 1: // '\001'
			char ch = str.charAt(0);
			char output1[] = new char[outputLength];
			for (int i = repeat - 1; i >= 0; i--)
				output1[i] = ch;

			return new String(output1);

		case 2: // '\002'
			char ch0 = str.charAt(0);
			char ch1 = str.charAt(1);
			char output2[] = new char[outputLength];
			for (int i = repeat * 2 - 2; i >= 0; i--) {
				output2[i] = ch0;
				output2[i + 1] = ch1;
				i--;
			}

			return new String(output2);
		}
		StringBuffer buf = new StringBuffer(outputLength);
		for (int i = 0; i < repeat; i++)
			buf.append(str);

		return buf.toString();
	}

	private static String padding(int repeat, char padChar) {
		String pad = CONSTANTS_PADDING[padChar];
		if (pad == null)
			pad = String.valueOf(padChar);
		for (; pad.length() < repeat; pad = pad.concat(pad))
			;
		CONSTANTS_PADDING[padChar] = pad;
		return pad.substring(0, repeat);
	}

	public static String rightPad(String str, int size) {
		return rightPad(str, size, ' ');
	}

	public static String rightPad(String str, int size, char padChar) {
		if (str == null)
			return null;
		int pads = size - str.length();
		if (pads <= 0)
			return str;
		if (pads > 8192)
			return rightPad(str, size, String.valueOf(padChar));
		else
			return str.concat(padding(pads, padChar));
	}

	public static String rightPad(String str, int size, String padStr) {
		if (str == null)
			return null;
		if (padStr == null || padStr.length() == 0)
			padStr = " ";
		int padLen = padStr.length();
		int strLen = str.length();
		int pads = size - strLen;
		if (pads <= 0)
			return str;
		if (padLen == 1 && pads <= 8192)
			return rightPad(str, size, padStr.charAt(0));
		if (pads == padLen)
			return str.concat(padStr);
		if (pads < padLen)
			return str.concat(padStr.substring(0, pads));
		char padding[] = new char[pads];
		char padChars[] = padStr.toCharArray();
		for (int i = 0; i < pads; i++)
			padding[i] = padChars[i % padLen];

		return str.concat(new String(padding));
	}

	public static String leftPad(String str, int size) {
		return leftPad(str, size, ' ');
	}

	public static String leftPad(String str, int size, char padChar) {
		if (str == null)
			return null;
		int pads = size - str.length();
		if (pads <= 0)
			return str;
		if (pads > 8192)
			return leftPad(str, size, String.valueOf(padChar));
		else
			return padding(pads, padChar).concat(str);
	}
	
	/**
	 * 定长的，不足补padChar，多余的删掉
	 * @param str
	 * @param size
	 * @param padChar
	 * @return
	 */
	public static String leftlengthPad(String str, int size, char padChar) {
		if (str == null)
			return null;
		int pads = size - str.length();
		if (pads <= 0)
			return str.substring(str.length()-size);
		if (pads > 8192)
			return leftPad(str, size, String.valueOf(padChar));
		else
			return padding(pads, padChar).concat(str);
	}
	

	public static String leftPad(String str, int size, String padStr) {
		if (str == null)
			return null;
		if (padStr == null || padStr.length() == 0)
			padStr = " ";
		int padLen = padStr.length();
		int strLen = str.length();
		int pads = size - strLen;
		if (pads <= 0)
			return str;
		if (padLen == 1 && pads <= 8192)
			return leftPad(str, size, padStr.charAt(0));
		if (pads == padLen)
			return padStr.concat(str);
		if (pads < padLen)
			return padStr.substring(0, pads).concat(str);
		char padding[] = new char[pads];
		char padChars[] = padStr.toCharArray();
		for (int i = 0; i < pads; i++)
			padding[i] = padChars[i % padLen];

		return (new String(padding)).concat(str);
	}

	public static String center(String str, int size) {
		return center(str, size, ' ');
	}

	public static String center(String str, int size, char padChar) {
		if (str == null || size <= 0)
			return str;
		int strLen = str.length();
		int pads = size - strLen;
		if (pads <= 0) {
			return str;
		} else {
			str = leftPad(str, strLen + pads / 2, padChar);
			str = rightPad(str, size, padChar);
			return str;
		}
	}

	public static String center(String str, int size, String padStr) {
		if (str == null || size <= 0)
			return str;
		if (padStr == null || padStr.length() == 0)
			padStr = " ";
		int strLen = str.length();
		int pads = size - strLen;
		if (pads <= 0) {
			return str;
		} else {
			str = leftPad(str, strLen + pads / 2, padStr);
			str = rightPad(str, size, padStr);
			return str;
		}
	}

	public static String upperCase(String str) {
		if (str == null)
			return null;
		else
			return str.toUpperCase();
	}

	public static String lowerCase(String str) {
		if (str == null)
			return null;
		else
			return str.toLowerCase();
	}

	public static String capitalize(String str) {
		if (str == null || str.length() == 0) {
			return str;
		} else {
			int strLen = str.length();
			return (new StringBuffer(strLen))
					.append(Character.toTitleCase(str.charAt(0)))
					.append(str.substring(1)).toString();
		}
	}

	/**
	 * @deprecated Method capitalise is deprecated
	 */

	public static String capitalise(String str) {
		return capitalize(str);
	}

	public static String uncapitalize(String str) {
		if (str == null || str.length() == 0) {
			return str;
		} else {
			int strLen = str.length();
			return (new StringBuffer(strLen))
					.append(Character.toLowerCase(str.charAt(0)))
					.append(str.substring(1)).toString();
		}
	}

	/**
	 * @deprecated Method uncapitalise is deprecated
	 */

	public static String uncapitalise(String str) {
		return uncapitalize(str);
	}

	public static String swapCase(String str) {
		if (str == null || str.length() == 0)
			return str;
		int strLen = str.length();
		StringBuffer buffer = new StringBuffer(strLen);
		char ch = '\0';
		for (int i = 0; i < strLen; i++) {
			ch = str.charAt(i);
			if (Character.isUpperCase(ch))
				ch = Character.toLowerCase(ch);
			else if (Character.isTitleCase(ch))
				ch = Character.toLowerCase(ch);
			else if (Character.isLowerCase(ch))
				ch = Character.toUpperCase(ch);
			buffer.append(ch);
		}

		return buffer.toString();
	}

	public static int countMatches(String str, String sub) {
		if (str == null || str.length() == 0 || sub == null
				|| sub.length() == 0)
			return 0;
		int count = 0;
		for (int idx = 0; (idx = str.indexOf(sub, idx)) != -1; idx += sub
				.length())
			count++;

		return count;
	}

	public static boolean isAlpha(String str) {
		if (str == null)
			return false;
		int sz = str.length();
		for (int i = 0; i < sz; i++)
			if (!Character.isLetter(str.charAt(i)))
				return false;

		return true;
	}

	public static boolean isAlphaSpace(String str) {
		if (str == null)
			return false;
		int sz = str.length();
		for (int i = 0; i < sz; i++)
			if (!Character.isLetter(str.charAt(i)) && str.charAt(i) != ' ')
				return false;

		return true;
	}

	public static boolean isAlphanumeric(String str) {
		if (str == null)
			return false;
		int sz = str.length();
		for (int i = 0; i < sz; i++)
			if (!Character.isLetterOrDigit(str.charAt(i)))
				return false;

		return true;
	}

	public static boolean isAlphanumericSpace(String str) {
		if (str == null)
			return false;
		int sz = str.length();
		for (int i = 0; i < sz; i++)
			if (!Character.isLetterOrDigit(str.charAt(i))
					&& str.charAt(i) != ' ')
				return false;

		return true;
	}

	public static boolean isNumeric(String str) {
		if (str == null)
			return false;
		int sz = str.length();
		for (int i = 0; i < sz; i++)
			if (!Character.isDigit(str.charAt(i)))
				return false;

		return true;
	}

	public static boolean isNumericSpace(String str) {
		if (str == null)
			return false;
		int sz = str.length();
		for (int i = 0; i < sz; i++)
			if (!Character.isDigit(str.charAt(i)) && str.charAt(i) != ' ')
				return false;

		return true;
	}

	public static boolean isWhitespace(String str) {
		if (str == null)
			return false;
		int sz = str.length();
		for (int i = 0; i < sz; i++)
			if (!Character.isWhitespace(str.charAt(i)))
				return false;

		return true;
	}

	public static String defaultString(String str) {
		return str != null ? str : "";
	}

	public static String defaultString(String str, String defaultStr) {
		return str != null ? str : defaultStr;
	}

	public static String reverse(String str) {
		if (str == null)
			return null;
		else
			return (new StringBuffer(str)).reverse().toString();
	}

	public static String abbreviate(String str, int maxWidth) {
		return abbreviate(str, 0, maxWidth);
	}

	public static String abbreviate(String str, int offset, int maxWidth) {
		if (str == null)
			return null;
		if (maxWidth < 4)
			throw new IllegalArgumentException(
					"Minimum abbreviation width is 4");
		if (str.length() <= maxWidth)
			return str;
		if (offset > str.length())
			offset = str.length();
		if (str.length() - offset < maxWidth - 3)
			offset = str.length() - (maxWidth - 3);
		if (offset <= 4)
			return str.substring(0, maxWidth - 3) + "...";
		if (maxWidth < 7)
			throw new IllegalArgumentException(
					"Minimum abbreviation width with offset is 7");
		if (offset + (maxWidth - 3) < str.length())
			return "..." + abbreviate(str.substring(offset), maxWidth - 3);
		else
			return "..." + str.substring(str.length() - (maxWidth - 3));
	}

	public static String difference(String str1, String str2) {
		if (str1 == null)
			return str2;
		if (str2 == null)
			return str1;
		int at = indexOfDifference(str1, str2);
		if (at == -1)
			return "";
		else
			return str2.substring(at);
	}

	public static int indexOfDifference(String str1, String str2) {
		if (str1 == null || str2 == null)
			return 0;
		if (str1.equals(str2))
			return -1;
		int i;
		for (i = 0; i < str1.length() && i < str2.length(); i++)
			if (str1.charAt(i) != str2.charAt(i))
				break;

		if (i < str2.length() || i < str1.length())
			return i;
		else
			return -1;
	}

	public static int getLevenshteinDistance(String s, String t) {
		if (s == null || t == null)
			throw new IllegalArgumentException("Strings must not be null");
		int n = s.length();
		int m = t.length();
		if (n == 0)
			return m;
		if (m == 0)
			return n;
		int d[][] = new int[n + 1][m + 1];
		for (int i = 0; i <= n; i++)
			d[i][0] = i;

		for (int j = 0; j <= m; j++)
			d[0][j] = j;

		for (int i = 1; i <= n; i++) {
			char csi = s.charAt(i - 1);
			for (int j = 1; j <= m; j++) {
				char ctj = t.charAt(j - 1);
				int cost;
				if (csi == ctj)
					cost = 0;
				else
					cost = 1;
				d[i][j] = min(d[i - 1][j] + 1, d[i][j - 1] + 1, d[i - 1][j - 1]
						+ cost);
			}

		}

		return d[n][m];
	}

	private static int min(int a, int b, int c) {
		if (b < a)
			a = b;
		if (c < a)
			a = c;
		return a;
	}

	public static String toString(long lArray[]) {
		if (lArray == null)
			return "null";
		if (lArray.length == 0)
			return "[]";
		StringBuffer sb = new StringBuffer();
		sb.append('[');
		sb.append(lArray[0]);
		for (int i = 1; i < lArray.length; i++) {
			sb.append(", ");
			sb.append(lArray[i]);
		}

		sb.append("]");
		return sb.toString();
	}

	public static String toString(int iArray[]) {
		if (iArray == null)
			return "null";
		if (iArray.length == 0)
			return "[]";
		StringBuffer sb = new StringBuffer();
		sb.append('[');
		sb.append(iArray[0]);
		for (int i = 1; i < iArray.length; i++) {
			sb.append(", ");
			sb.append(iArray[i]);
		}

		sb.append("]");
		return sb.toString();
	}

	public static String toString(short sArray[]) {
		if (sArray == null)
			return "null";
		if (sArray.length == 0)
			return "[]";
		StringBuffer sb = new StringBuffer();
		sb.append('[');
		sb.append(sArray[0]);
		for (int i = 1; i < sArray.length; i++) {
			sb.append(", ");
			sb.append(sArray[i]);
		}

		sb.append("]");
		return sb.toString();
	}

	public static String toString(char cArray[]) {
		if (cArray == null)
			return "null";
		if (cArray.length == 0)
			return "[]";
		StringBuffer sb = new StringBuffer();
		sb.append('[');
		sb.append(cArray[0]);
		for (int i = 1; i < cArray.length; i++) {
			sb.append(", ");
			sb.append(cArray[i]);
		}

		sb.append("]");
		return sb.toString();
	}

	public static String toString(byte bArray[]) {
		if (bArray == null)
			return "null";
		if (bArray.length == 0)
			return "[]";
		StringBuffer sb = new StringBuffer();
		sb.append('[');
		sb.append(bArray[0]);
		for (int i = 1; i < bArray.length; i++) {
			sb.append(", ");
			sb.append(bArray[i]);
		}

		sb.append("]");
		return sb.toString();
	}

	public static String toString(boolean bArray[]) {
		if (bArray == null)
			return "null";
		if (bArray.length == 0)
			return "[]";
		StringBuffer sb = new StringBuffer();
		sb.append('[');
		sb.append(bArray[0]);
		for (int i = 1; i < bArray.length; i++) {
			sb.append(", ");
			sb.append(bArray[i]);
		}

		sb.append("]");
		return sb.toString();
	}

	public static String toString(float fArray[]) {
		if (fArray == null)
			return "null";
		if (fArray.length == 0)
			return "[]";
		StringBuffer sb = new StringBuffer();
		sb.append('[');
		sb.append(fArray[0]);
		for (int i = 1; i < fArray.length; i++) {
			sb.append(", ");
			sb.append(fArray[i]);
		}

		sb.append("]");
		return sb.toString();
	}

	public static String toString(double dArray[]) {
		if (dArray == null)
			return "null";
		if (dArray.length == 0)
			return "[]";
		StringBuffer sb = new StringBuffer();
		sb.append('[');
		sb.append(dArray[0]);
		for (int i = 1; i < dArray.length; i++) {
			sb.append(", ");
			sb.append(dArray[i]);
		}

		sb.append("]");
		return sb.toString();
	}

	public static String toString(Object objArray[]) {
		if (objArray == null)
			return "null";
		if (objArray.length == 0)
			return "[]";
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < objArray.length; i++) {
			if (i == 0)
				sb.append('[');
			else
				sb.append(", ");
			sb.append(String.valueOf(objArray[i]));
		}

		sb.append("]");
		return sb.toString();
	}

//	public static boolean isContainChineseCharacter(String cnStr) {
//		if (isEmpty(cnStr))
//			return false;
//		char chars[] = cnStr.toCharArray();
//		boolean bIsContainChineseCharacter = false;
//		for (int i = 0; i < chars.length; i++) {
//			byte bytes[] = chars[i].getBytes();
//			if (bytes.length != 2)
//				continue;
//			int ints[] = new int[2];
//			ints[0] = bytes[0] & 255;
//			ints[1] = bytes[1] & 255;
//			if (ints[0] < 129 || ints[0] > 254 || ints[1] < 64 || ints[1] > 254)
//				continue;
//			bIsContainChineseCharacter = true;
//			break;
//		}
//
//		return bIsContainChineseCharacter;
//	}

//	public static int getStringLength(String str) {
//		if (isEmpty(str))
//			return 0;
//		int iLen = 0;
//		char chars[] = str.toCharArray();
//		for (int i = 0; i < chars.length; i++) {
//			char charTemp = chars[i];
//			String strTemp = String.valueOf(charTemp);
//			if (isContainChineseCharacter(strTemp))
//				iLen += 2;
//			else
//				iLen++;
//		}
//
//		return iLen;
//	}

	public static String filterSpecialChar(String str, String regex) {
		if (str == null) {
			return null;
		} else {
			Pattern pattern = Pattern.compile(regex, 32);
			Matcher matcher = pattern.matcher(str);
			return matcher.replaceAll("").trim();
		}
	}

	public static boolean isMatch(String str, String regex) {
		if (str == null || regex == null || regex.trim().length() == 0) {
			return false;
		} else {
			Pattern pattern = Pattern.compile(regex, 32);
			Matcher matcher = pattern.matcher(str);
			return matcher.find();
		}
	}

	public static String replaceIllegalString(String strInput) {
		String strOutPut = strInput.replaceAll("<", "&lt ")
				.replaceAll(">", "&gt ").replaceAll("\"", "&#34 ")
				.replaceAll("'", "&#39 ");
		return strOutPut;
	}

	public static String useCharSpellList(String strArray[]) {
		StringBuffer sbResult = new StringBuffer(512);
		if (strArray != null && strArray.length > 0) {
			sbResult.append("(");
			for (int i = 0; i < strArray.length; i++) {
				sbResult.append("'");
				sbResult.append(strArray[i]);
				sbResult.append("',");
			}

		}
		String strResult = sbResult.substring(0, sbResult.length() - 1) + ")";
		return strResult;
	}

	public static final String EMPTY = "";
	private static final int PAD_LIMIT = 8192;
	private static final String CONSTANTS_PADDING[];
	private static final String EMPTY_STRING_ARRAY[] = new String[0];

	static {
		CONSTANTS_PADDING = new String[65535];
		CONSTANTS_PADDING[32] = "";
	}
}
