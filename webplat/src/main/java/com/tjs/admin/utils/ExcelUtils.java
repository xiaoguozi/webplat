package com.tjs.admin.utils;


import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.commons.beanutils.PropertyUtils;





import jxl.Workbook;
import jxl.format.UnderlineStyle;
import jxl.write.*;
import jxl.write.biff.RowsExceededException;
import jxl.format.Colour;

// Referenced classes of package org.ddq.common.util:
//            ReflectUtils, LogerUtil

public class ExcelUtils
{

    public ExcelUtils()
    {
    }

   
    
    /**生成文件的步长*/
	private static double step = 2;
	
		
	/**
	 * 生成excel 文件
	 * @param os
	 * @param exportMo
	 */
	public static void generateFile(OutputStream os,ExportMo exportMo) {
		WritableWorkbook wwb = null;
		try {
			wwb = Workbook.createWorkbook(os);
			// 创建Excel工作表 指定名称和位置
			WritableSheet ws = wwb.createSheet(exportMo.getTableName(),0);
			
			WritableFont wfont = new WritableFont(WritableFont.ARIAL, 12,
					WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE,
					Colour.BLACK);
			WritableCellFormat wcfFC = new WritableCellFormat(wfont);
			wcfFC.setBorder(jxl.format.Border.NONE, jxl.format.BorderLineStyle.THIN,jxl.format.Colour.BLACK);
			wcfFC.setAlignment(jxl.format.Alignment.CENTRE);
			
			//ws.setRowView(0, 500);
			ws.addCell(new Label(0, 0, exportMo.getTableName(), wcfFC));
			
			String[] columns = new String[exportMo.getColumns().size()] ;
			exportMo.getColumns().toArray(columns);
			
			Double[] listWidth = new Double[columns.length];
			
			ws.mergeCells(0,0 , columns.length-1, 0); //合并单元格
			
			wfont = new jxl.write.WritableFont(WritableFont.ARIAL, 10,
					WritableFont.BOLD, false, UnderlineStyle.NO_UNDERLINE,
					Colour.BLACK);
			//生成表头
			generalTableHead(exportMo, ws, wfont, exportMo.getColumnTitles().toArray(), listWidth);
			
			wfont = new jxl.write.WritableFont(WritableFont.ARIAL, 10,
					WritableFont.NO_BOLD, false, UnderlineStyle.NO_UNDERLINE,
					Colour.BLACK);
			List<?> listObject = exportMo.getValues();
			List<String> columnTypes = exportMo.getColumnTypes();
			//生成相应的表内容
			for (int i = 0; i < listObject.size(); i++) {
				Object object = listObject.get(i);
				for (int j = 0; j < columns.length; j++) {
					String columsName = columns[j];
					//获取值
					String value = getStringPropertyValue(object,columsName);
					
					WritableCell label = getValueFormat(wfont, columns, listObject,
							columnTypes, i, j, value);
					ws.addCell(label);
					
					if (listWidth[j] != null) {
						double num = listWidth[j];
						if (value != null) 
							if (num < value.getBytes().length * step) {
								listWidth[j] = (Double)Math.ceil(value.getBytes().length * step);
							}
					} else {
						listWidth[j] = (Double)Math.ceil(value.getBytes().length * step);
					}
				}
			}
			
			if (listWidth != null && listWidth.length > 0) {
				for (int i = 0; i < listWidth.length; i++) {
					ws.setColumnView(i, (int)Math.ceil(listWidth[i]));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (wwb != null) {
					// 写入工作表
					wwb.write();
					wwb.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private static void generalTableHead(ExportMo exportMo, WritableSheet ws,
			WritableFont wfont, Object[] columns, Double[] listWidth)
			throws WriteException, RowsExceededException {
		WritableCellFormat wcfFC;
		wcfFC = new WritableCellFormat(wfont);
		wcfFC.setAlignment(jxl.format.Alignment.CENTRE); // 设置单元格居中显示
		wcfFC.setBackground(jxl.format.Colour.LIGHT_TURQUOISE); // 设置单元格的背景颜色
		wcfFC.setBorder(jxl.format.Border.ALL, jxl.format.BorderLineStyle.THIN, jxl.format.Colour.BLACK);

		/**
		 * 生成excel列头数据；
		 */
		if (columns != null && columns.length > 0) {
			for (int i = 0; i < columns.length; i++) {
				String columnName = columns[i].toString();
				if (i >= 0) {
					Label label = new Label(i, 1, columnName, wcfFC);
				    ws.addCell(label);
				    if (listWidth[i] != null) {
						double num = listWidth[i];
						if (num < columnName.getBytes().length * step) {
							listWidth[i] = (Double)Math.ceil(columnName.getBytes().length * step);
						}
					} else {
						listWidth[i] = (Double)Math.ceil(columnName.getBytes().length * step);
					}
				}
			}
		}
	}

	/***
	 * 格式化label数据
	 * @param wfont
	 * @param columns
	 * @param listObject
	 * @param columnTypes
	 * @param i
	 * @param j
	 * @param value
	 * @return
	 * @throws WriteException
	 */
	private static WritableCell getValueFormat(WritableFont wfont,
			String[] columns, List<?> listObject,
			List<String> columnTypes, int i, int j, String value)
			throws WriteException {
		WritableCell label;
		WritableCellFormat format = null;
		String colType = columnTypes.get(j);
		if("numberSize".equals(colType)){
			NumberFormat nf = new NumberFormat("###,###,###,###,###,###,##0.00");
			format = new WritableCellFormat(nf);
			Double dV = new BigDecimal((value == null) ? "0" : value
					.toString()).setScale(2, BigDecimal.ROUND_HALF_UP)
					.doubleValue();
			label = new jxl.write.Number(j, i + 2, dV, format);
		}else{
			format = new WritableCellFormat(wfont);
			label = new Label(j, i+2, value, format);
		}
		if (j == 0) {
			format.setBorder(jxl.format.Border.LEFT, jxl.format.BorderLineStyle.THIN,jxl.format.Colour.BLACK);
		}else if (j == columns.length - 1) {
			format.setBorder(jxl.format.Border.RIGHT, jxl.format.BorderLineStyle.THIN,jxl.format.Colour.BLACK);
		}else if (i == listObject.size() - 1) {
			format.setBorder(jxl.format.Border.BOTTOM, jxl.format.BorderLineStyle.THIN,jxl.format.Colour.BLACK);
		}
		return label;
	}
	
	 public static String getStringPropertyValue(Object object, String property)
	    {
	        Object value = getPropertyValue(object, property);
	        if(value == null)
	            return null;
	       
	        if(isDateTimeObject(value))
	        {
	            String timeStyle = "yyyy-MM-dd HH:mm:ss";
	            String strValue = new SimpleDateFormat(timeStyle).format((java.util.Date)value);
	            return strValue;
	        } else
	        {
	            return value.toString();
	        }
	    }
	    
	    public static Object getPropertyValue(Object object, String property)
	    {
	        Object obj = object;
	        for(; property.indexOf(".") > 0; property = property.substring(property.indexOf(".") + 1))
	            obj = getPropertyValue(obj, property.substring(0, property.indexOf(".")));

	        if(obj != null)
	            try
	            {
	                return PropertyUtils.getProperty(obj, property);
	            }
	            catch(Throwable e)
	            {
	                return null;
	            }
	        else
	            return null;
	    }
	    private  static boolean isDateTimeObject(Object obj)
	    {
	        return obj instanceof java.util.Date || obj instanceof java.sql.Timestamp;
	    }
	    
}
